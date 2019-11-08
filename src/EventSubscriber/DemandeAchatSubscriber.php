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
use App\Entity\DemandeAchat;
use App\Entity\User;
use App\Exception\DisableToDelete;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Symfony\Component\Security\Core\Exception\DisabledException;
use Symfony\Component\Security\Core\User\UserInterface;

class DemandeAchatSubscriber implements EventSubscriberInterface
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

    public  function  __construct(
        TokenStorageInterface $tokenStorage,
        EntityManagerInterface $entityManager,
        Mailer $mailer
        )
    {
        $this->tokenStorage = $tokenStorage;
        $this->entityManager = $entityManager;
        $this->mailer = $mailer;
    }

    public static function getSubscribedEvents()
    {
       return [
           KernelEvents::VIEW => [
               ['visiteDemandeAchat',EventPriorities::PRE_WRITE ],
               ['deleteDemeandeAchat',EventPriorities::PRE_WRITE ],
            //   ['AccessControll',EventPriorities::PRE_WRITE ],
               ['putDemandeAchat',EventPriorities::PRE_WRITE ]
           ]
       ];
    }

    public function putDemandeAchat(GetResponseForControllerResultEvent $event){

        $demande = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();


        if(!$demande instanceof  DemandeAchat  || $method !== Request::METHOD_PUT ){
            return;
        }

        $demande->setDateModification(new \DateTime());
        if($demande->getStatut() === 1 && $demande->sendEmail){
            $demande->setNbrShare($this->mailer->alerterFournisseurs($demande));
        }
        if($demande->sendEmail){
            $demande->setIsAlerted(true);
        }

    }
    public function visiteDemandeAchat(GetResponseForControllerResultEvent $event){

        $demande = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        /**
         * @var UserInterface $acheteur
         */
        $user = $this->tokenStorage->getToken()->getUser();

        if(!$demande instanceof  DemandeAchat  || $method !== Request::METHOD_GET ){
            return;
        }

        if(!$user instanceof User){
            $nbrVisite = $demande->getNbrVisite();

            $nbrVisite +=1;

            $demande->setNbrVisite($nbrVisite);

            $this->entityManager->flush();
        }


    }
    public function deleteDemeandeAchat(GetResponseForControllerResultEvent $event){

        $demande = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();


        if(!$demande instanceof  DemandeAchat  || $method !== Request::METHOD_DELETE ){
            return;
        }

        if($demande->getStatut() === 1 || $demande->getStatut() === 3){
            throw new DisableToDelete();
        }

    }

    /*public function AccessControll(GetResponseForControllerResultEvent $event){

        $request = $event->getRequest();

        /**
         * @var UserInterface $acheteur
         */
    /* $acheteur = $this->tokenStorage->getToken()->getUser();


     if('api_acheteurs_demandes_get_subresource' !== $request->get('_route')){
         return;
     }
     $lists = $event->getControllerResult();

     if($acheteur instanceof Acheteur){

         $trouve = false;
         if($lists->getTotalItems()){
             foreach ($lists as $list){
                 if($list->getAcheteur() == $acheteur){
                     $trouve =true;
                     break;
                 }
             }
         }else{
             $trouve = true;
         }

         if(!$trouve){
             throw new AccessDeniedException();
         }
     }


 }*/
}