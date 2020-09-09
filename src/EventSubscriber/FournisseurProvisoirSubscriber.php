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
use App\Entity\ContactFournisseur;
use App\Entity\Admin;
use App\Entity\Fournisseur;
use App\Entity\FournisseurProvisoire;
use App\Entity\Personnel;
use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class FournisseurProvisoirSubscriber implements EventSubscriberInterface
{



    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;
    /**
     * @var Mailer
     */
    private $mailer;
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;


    public  function  __construct(
        Mailer $mailer,
        EntityManagerInterface $entityManager,
        TokenStorageInterface $tokenStorage
        )
    {
        $this->tokenStorage = $tokenStorage;
        $this->mailer = $mailer;
        $this->entityManager = $entityManager;
    }

    public static function getSubscribedEvents()
    {
       return [
           KernelEvents::VIEW => [
               ['PutFrsProvisoire',EventPriorities::PRE_WRITE],
           ]
       ];
    }



    public function PutFrsProvisoire(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if(!$entity instanceof  FournisseurProvisoire  || $method !== Request::METHOD_PUT ){
            return;
        }

        /**
         * @var UserInterface $user
         */
        $user = $this->tokenStorage->getToken()->getUser();

        if($user instanceof Fournisseur) {
            if ($entity->getType() === 1) {
                // Nouvelle Agence / Service
                $agence = new Personnel();
                $agence->setCreated(new \DateTime());
                $agence->setPhone($entity->getPhone());
                $agence->setEmail($entity->getEmail());
                $agence->setFournisseur($user);
                $agence->setDel(0);
                $agence->setName($entity->getFirstName().' '.$entity->getLastName());
                $agence->setAgence($entity->getSociete());
                $this->entityManager->persist($agence);
                $this->entityManager->flush();
                $this->mailer->nouvelleAgenceService($entity);

            }elseif ($entity->getType() === 2){
                // Nouveau Fournisseur
                $nv_frs = clone $user;
                $nv_frs->setCreated(new \DateTime());
                $nv_frs->setPhone($entity->getPhone());
                $nv_frs->setEmail($entity->getEmail());
                $nv_frs->setFirstName($entity->getFirstName());
                $nv_frs->setLastName($entity->getLastName());
                $nv_frs->setPassword($entity->getPassword());
                $nv_frs->setParent($user);
                $nv_frs->setCivilite($entity->getCivilite());
                $nv_frs->setConfirmationToken(null);
                $nv_frs->setChilds(null);
                $nv_frs->setJetons(null);
                $nv_frs->setPasswordChangeDate(null);
                $nv_frs->setPasswordResetDate(null);
                $nv_frs->setRoles([User::ROLE_FOURNISSEUR_PRE]);
                $nv_frs->setRedirect("/register/fournisseur2");
                $nv_frs->setStep(2);
                $nv_frs->setCategories(null);

                $this->entityManager->persist($nv_frs);

                $this->entityManager->flush();
                $this->mailer->nouveauFournisseur($entity);
            }
        }

    }



}