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
use App\Entity\DetailVisite;
use App\Repository\BlackListesRepository;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class DetailVisiteSubscriber implements EventSubscriberInterface
{


    /**
     * @var BlackListesRepository
     */
    private $blackListesRepository;
    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;
    /**
     * @var Mailer
     */
    private $mailer;


    public  function  __construct(
        Mailer $mailer,
        BlackListesRepository $blackListesRepository,
        TokenStorageInterface $tokenStorage
        )
    {
        $this->blackListesRepository = $blackListesRepository;
        $this->tokenStorage = $tokenStorage;
        $this->mailer = $mailer;
    }

    public static function getSubscribedEvents()
    {
       return [
           KernelEvents::VIEW => [
               ['AddDetailVisiteCheck',EventPriorities::PRE_VALIDATE],
               ['PutDetailVisite',EventPriorities::PRE_VALIDATE],
           ]
       ];
    }
    public function AddDetailVisiteCheck(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();


        if(!$entity instanceof  DetailVisite  || $method !== Request::METHOD_POST ){
            return;
        }

        $acheteur =$entity->getDemande()->getAcheteur()->getId();
        /**
         * @var UserInterface $founrisseur
         */
        $fournisseur = $this->tokenStorage->getToken()->getUser();

        if(!$acheteur || !$fournisseur){
            return;
        }

        $blacklist = $this->blackListesRepository->findOneBy(['fournisseur'=>$fournisseur,'acheteur'=>$acheteur,'etat'=>1]);

        if($blacklist){
            throw new \Exception('Cette société vous a êtes blacklisté, merci de nous contacter a cette adresse mediateur@lesachatsindustriels.com pour plus de détails');
        }

        $entity->setDateRec(new \DateTime('+1 week'));


    }

    public function PutDetailVisite(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if(!$entity instanceof  DetailVisite  || $method !== Request::METHOD_PUT ){
            return;
        }

        if($entity->getPersonnel() && $entity->getDemande() && $entity->sendEmail && !$entity->getStatut()){
            $this->mailer->alerterPersonnels($entity->getPersonnel(), $entity->getDemande(),$entity->getFournisseur());
        }

    }



}