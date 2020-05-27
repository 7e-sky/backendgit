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
use App\Entity\Produit;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class ProduitSubscriber implements EventSubscriberInterface
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
               ['PostProduit',EventPriorities::PRE_WRITE],
               ['PutProduit',EventPriorities::PRE_WRITE],
           ]
       ];
    }

    public function PostProduit(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();


        if(!$entity instanceof  Produit  || $method !== Request::METHOD_POST ){
            return;
        }

        if($entity->getTitre()){
            $entity->setTitreLower(mb_strtolower($entity->getTitre()));
        }
        /**
         * @var UserInterface $user
         */
        $user = $this->tokenStorage->getToken()->getUser();
        if($user instanceof Fournisseur){
            $entity->setCurrency($user->getCurrency());
            $entity->setPays($user->getPays());
            $entity->setVille($user->getVille());
        }

    }


    public function PutProduit(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if(!$entity instanceof  Produit  || $method !== Request::METHOD_PUT ){
            return;
        }

        if($entity->getTitre()){
            $entity->setTitreLower(mb_strtolower($entity->getTitre()));
        }

        /**
         * @var UserInterface $user
         */
        $user = $this->tokenStorage->getToken()->getUser();

        if($user instanceof Fournisseur){
            $entity->setCurrency($user->getCurrency());
            $entity->setPays($user->getPays());
            $entity->setVille($user->getVille());
        }
        if($user instanceof Admin) {
            if ($entity->getisValid() && is_null($entity->getDateValidation())) {
                $entity->setDateValidation(new \DateTime());
                $this->mailer->alerteFournisseurValidationProduit($entity);
            }
        }

    }



}