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
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class MessagesSubscriber implements EventSubscriberInterface
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
               ['PutMessage',EventPriorities::PRE_WRITE],
               ['GetMessage',EventPriorities::PRE_WRITE],
           ]
       ];
    }

    public function GetMessage(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();


        if(!$entity instanceof  ContactFournisseur  || $method !== Request::METHOD_GET ){
            return;
        }

        /**
         * @var UserInterface $fournisseur
         */
        $fournisseur = $this->tokenStorage->getToken()->getUser();

        if($fournisseur instanceof Fournisseur && $fournisseur->getId() === $entity->getFournisseur()->getId()){

            if(is_null($entity->getDateRead()) && !$entity->getisRead()){
                $entity->setDateRead(new \DateTime());
                $entity->setIsRead(true);
                $this->entityManager->flush();
            }

        }

    }




    public function PutMessage(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if(!$entity instanceof  ContactFournisseur  || $method !== Request::METHOD_PUT ){
            return;
        }

        /**
         * @var UserInterface $user
         */
        $user = $this->tokenStorage->getToken()->getUser();

        if($user instanceof Admin) {
            if ($entity->getStatut() && is_null($entity->getDateValidation())) {
                $entity->setDateValidation(new \DateTime());
                $this->mailer->alerteFournisseurMessagePublic($entity);
            }
        }

    }



}