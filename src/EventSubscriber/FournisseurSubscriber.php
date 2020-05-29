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
use App\Entity\Admin;
use App\Entity\Fournisseur;
use App\Interfaces\SetFournisseurInterface;
use App\Services\ParentService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class FournisseurSubscriber implements EventSubscriberInterface
{

    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;
    /**
     * @var Mailer
     */
    private $mailer;
    /**
     * @var ParentService
     */
    private $parentService;


    public function __construct(
        TokenStorageInterface $tokenStorage,
        EntityManagerInterface $entityManager,
        Mailer $mailer,
        ParentService $parentService
    )
    {
        $this->tokenStorage = $tokenStorage;
        $this->entityManager = $entityManager;
        $this->mailer = $mailer;
        $this->parentService = $parentService;
    }

    public
    static function getSubscribedEvents()
    {
        return [
            KernelEvents::VIEW => [
                ['SetFournisseur', EventPriorities::PRE_WRITE,],
                ['GetFournisseur', EventPriorities::PRE_WRITE],
                ['PutFournisseur', EventPriorities::PRE_WRITE],
            ]
        ];
    }

    public function SetFournisseur(GetResponseForControllerResultEvent $event)
    {

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        /**
         * @var UserInterface $founrisseur
         */
        $founrisseur = $this->tokenStorage->getToken()->getUser();

        if (!$entity instanceof SetFournisseurInterface || $method !== Request::METHOD_POST) {
            return;
        }

        if ($founrisseur instanceof Fournisseur) {
            $entity->setFournisseur($founrisseur);
        }

    }

    public function GetFournisseur(GetResponseForControllerResultEvent $event)
    {

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();


        /**
         * @var UserInterface $founrisseur
         */
        $user = $this->tokenStorage->getToken()->getUser();

        if (!$entity instanceof Fournisseur || $method !== Request::METHOD_GET) {
            return;
        }

        if (!$user instanceof Admin) {
            $entity->setVisite($entity->getVisite() + 1);
            $this->entityManager->flush();
        }

    }

    public function PutFournisseur(GetResponseForControllerResultEvent $event)
    {

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if (!$entity instanceof Fournisseur || $method !== Request::METHOD_PUT) {
            return;
        }
        if($entity->getSociete()){
            $entity->setSocieteLower(mb_strtolower($entity->getSociete()));
        }

        if($entity->getStep() === 3 && !$entity->getisComplet()){
            $this->parentService->setParent($entity,'Fournisseur');
            $this->mailer->bienvenueEmail($entity);
            $entity->setIsComplet(true);
            $entity->setCodeClient('F-'.$entity->getId().$this->random_strings(4));


        }

    }

    function random_strings($length_of_string) {

        // md5 the timestamps and returns substring
        // of specified length
        return substr(md5(time()), 0, $length_of_string);
    }



}