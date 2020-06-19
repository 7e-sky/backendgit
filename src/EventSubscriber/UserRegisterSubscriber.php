<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 23/07/2019
 * Time: 14:31
 */

namespace App\EventSubscriber;

use ApiPlatform\Core\EventListener\EventPriorities;
use App\Email\Mailer;
use App\Entity\Acheteur;
use App\Entity\Commercial;
use App\Entity\Fournisseur;
use App\Entity\User;
use App\Entity\ZoneCommercial;
use App\Repository\CommercialRepository;
use App\Repository\UserRepository;
use App\Repository\ZoneCommercialRepository;
use App\Security\TokenGenerator;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserRegisterSubscriber implements EventSubscriberInterface
{

    /**
     * @var UserPasswordEncoderInterface
     */
    private $passwordEncoder;
    /**
     * @var TokenGenerator
     */
    private $tokenGenerator;
    /**
     * @var Mailer
     */
    private $mailer;
    /**
     * @var UserRepository
     */
    private $userRepository;
    /**
     * @var CommercialRepository
     */
    private $commercialRepository;
    /**
     * @var ZoneCommercialRepository
     */
    private $zoneCommercialRepository;


    public function __construct(
        UserPasswordEncoderInterface $passwordEncoder,
        TokenGenerator $tokenGenerator,
        Mailer $mailer,
        UserRepository $userRepository,
        CommercialRepository $commercialRepository,
        ZoneCommercialRepository $zoneCommercialRepository)
    {
        $this->passwordEncoder = $passwordEncoder;
        $this->tokenGenerator = $tokenGenerator;
        $this->mailer = $mailer;
        $this->userRepository = $userRepository;
        $this->commercialRepository = $commercialRepository;
        $this->zoneCommercialRepository = $zoneCommercialRepository;
    }

    public static function getSubscribedEvents()
    {
        return [

            KernelEvents::VIEW => [
                ['userRegistered', EventPriorities::PRE_WRITE]
            ]
        ];
    }


    public function userRegistered(GetResponseForControllerResultEvent $event)
    {

        $user = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();
        if (!$user instanceof User || !in_array($method, [Request::METHOD_POST])) {
            return;
        }

        //Encode Password
        $user->setPassword(
            $this->passwordEncoder->encodePassword($user, $user->getPassword
            ())
        );




        //Set Role Fournisseur
        if ($user instanceof Fournisseur) {

            $user->setRoles([User::ROLE_FOURNISSEUR_PRE]);
            $user->setRedirect("/register/fournisseur");
            if ($user->getSociete()) {
                $user->setSocieteLower(mb_strtolower($user->getSociete()));
            }
            //Set Confirmation Token
            $user->setConfirmationToken($this->tokenGenerator->getRandomSecureToken());
            // Send email confirmation to Fournisseur
            $this->mailer->sendConfirmationEmail($user);
            // Send email new fournisseur registred to Admin
            $this->mailer->newRegister($user,'Fournisseur');
        } elseif ($user instanceof Acheteur) {
            $user->setRoles([User::ROLE_ACHETEUR_PRE]);
            $user->setRedirect("/register/ac2");
            //Set Confirmation Token
            $user->setConfirmationToken($this->tokenGenerator->getRandomSecureToken());
            // Send email confirmation to Acheteur
            $this->mailer->sendConfirmationEmail($user);
            // Send email new acheteur registred to Admin
            $this->mailer->newRegister($user,'Acheteur');

        } elseif ($user instanceof ZoneCommercial) {
            $user->setRoles([User::ROLE_ZONE]);
            $user->setRedirect("/dashboard");

            $user->setIsActif(true);
        } elseif ($user instanceof Commercial) {

            $user->setRoles([User::ROLE_COMMERCIAL]);
            $user->setRedirect("/dashboard");
            $user->setIsActif(true);
        } else {
            $user->setRoles([User::ROLE_ADMIN]);
            $user->setRedirect("/dashboard");
            $user->setIsActif(true);
        }

    }


}