<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 23/07/2019
 * Time: 14:31
 */

namespace App\EventSubscriber;

use ApiPlatform\Core\EventListener\EventPriorities;
use App\Entity\SousSecteur;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;

class SousSecteurSubscriber implements EventSubscriberInterface
{


    public static function getSubscribedEvents()
    {
       return [
           KernelEvents::VIEW => [
               ['PostSousSecteur',EventPriorities::PRE_WRITE],
               ['PutSousSecteur',EventPriorities::PRE_WRITE],
           ]
       ];
    }

    public function PostSousSecteur(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();


        if(!$entity instanceof  SousSecteur  || $method !== Request::METHOD_POST ){
            return;
        }

        if($entity->getName()){
            $entity->setNameLower(mb_strtolower($entity->getName()));
        }


    }


    public function PutSousSecteur(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if(!$entity instanceof  SousSecteur  || $method !== Request::METHOD_PUT ){
            return;
        }

        if($entity->getName()){
            $entity->setNameLower(mb_strtolower($entity->getName()));
        }

    }



}