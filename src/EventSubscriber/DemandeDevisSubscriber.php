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
use App\Entity\DemandeDevis;
use App\Entity\Admin;
use App\Entity\Fournisseur;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class DemandeDevisSubscriber implements EventSubscriberInterface
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
               ['postDemandeDevis',EventPriorities::PRE_WRITE],
               ['PutDemandeDevis',EventPriorities::PRE_WRITE],
               ['GetDemandeDevis',EventPriorities::PRE_WRITE],
           ]
       ];
    }

    public function GetDemandeDevis(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();


        if(!$entity instanceof  DemandeDevis  || $method !== Request::METHOD_GET ){
            return;
        }

        /**
         * @var UserInterface $fournisseur
         */
        $fournisseur = $this->tokenStorage->getToken()->getUser();

        if($fournisseur instanceof Fournisseur){

            if(is_null($entity->getDateRead()) && !$entity->getisRead()){
                $entity->setDateRead(new \DateTime());
                $entity->setIsRead(true);
                $this->entityManager->flush();
            }

        }

    }


    public function postDemandeDevis(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();


        if(!$entity instanceof  DemandeDevis  || $method !== Request::METHOD_POST ){
            return;
        }

        $fournisseur = $entity->getProduit()->getFournisseur();
        if($fournisseur){
            $entity->setFournisseur($fournisseur);
        }

    }

    public function PutDemandeDevis(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if(!$entity instanceof  DemandeDevis  || $method !== Request::METHOD_PUT ){
            return;
        }

        /**
         * @var UserInterface $user
         */
        $user = $this->tokenStorage->getToken()->getUser();

        if($user instanceof Admin) {
            if ($entity->getStatut()) {
                $entity->setDateValidation(new \DateTime());
                $this->mailer->alerteFournisseurDemandeDevisPublic($entity);
            }
        }

    }



}