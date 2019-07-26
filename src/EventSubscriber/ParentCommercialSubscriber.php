<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 23/07/2019
 * Time: 14:31
 */

namespace App\EventSubscriber;

use ApiPlatform\Core\EventListener\EventPriorities;
use App\Entity\Commercial;
use App\Entity\ZoneCommercial;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class ParentCommercialSubscriber implements EventSubscriberInterface
{

    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;

    public  function  __construct(TokenStorageInterface $tokenStorage)
    {
        $this->tokenStorage = $tokenStorage;
    }

    public static function getSubscribedEvents()
    {
       return [
           KernelEvents::VIEW => ['setParent',EventPriorities::PRE_WRITE]
       ];
    }
    public function setParent(GetResponseForControllerResultEvent $event){
        $user = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        /**
         * @var UserInterface $parent
         */
        $parent = $this->tokenStorage->getToken()->getUser();

        if((!$user instanceof  ZoneCommercial && !$user instanceof  Commercial) || $method !== Request::METHOD_POST ){
            return;
        }

        $user->setParent1($parent);

    }
}