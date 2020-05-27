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
use App\Interfaces\SetAcheteurInterface;
use App\Services\ParentService;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class AcheteurSubscriber implements EventSubscriberInterface
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
     * @var ParentService
     */
    private $parentService;


    public  function  __construct(
        TokenStorageInterface $tokenStorage,
        Mailer $mailer,
        ParentService $parentService
        )
    {
        $this->tokenStorage = $tokenStorage;
        $this->mailer = $mailer;
        $this->parentService = $parentService;
    }

    public static function getSubscribedEvents()
    {
       return [
           KernelEvents::VIEW => [
               ['SetAcheteur',EventPriorities::PRE_WRITE],
               ['PutAcheteur',EventPriorities::PRE_WRITE]
           ]
       ];
    }
    public function SetAcheteur(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        /**
         * @var UserInterface $acheteur
         */
        $acheteur = $this->tokenStorage->getToken()->getUser();

        if(!$entity instanceof  SetAcheteurInterface  || $method !== Request::METHOD_POST ){
            return;
        }

        if($acheteur instanceof Acheteur){
            $entity->setAcheteur($acheteur);
        }

    }

    public function PutAcheteur(GetResponseForControllerResultEvent $event)
    {

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if (!$entity instanceof Acheteur || $method !== Request::METHOD_PUT) {
            return;
        }


        if ($entity->getStep() === 2 && !$entity->getisComplet()) {
            $this->parentService->setParent($entity,'Acheteur');
            $this->mailer->bienvenueEmail($entity);
            $entity->setIsComplet(true);

        }
    }


}