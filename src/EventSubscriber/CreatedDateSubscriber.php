<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 23/07/2019
 * Time: 14:31
 */

namespace App\EventSubscriber;

use ApiPlatform\Core\EventListener\EventPriorities;
use App\Interfaces\CreatedEntityInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;

class CreatedDateSubscriber implements EventSubscriberInterface
{

    public static function getSubscribedEvents()
    {
       return [
           KernelEvents::VIEW => ['setCreatedDate',EventPriorities::PRE_WRITE]
       ];
    }
    public function setCreatedDate(GetResponseForControllerResultEvent $event){
        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();
        if(!$entity instanceof  CreatedEntityInterface || $method !== Request::METHOD_POST ){
            return;
        }

        $entity->setCreated(
           new \DateTime()
        );
    }
}