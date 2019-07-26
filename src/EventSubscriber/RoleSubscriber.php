<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 23/07/2019
 * Time: 14:31
 */

namespace App\EventSubscriber;

use ApiPlatform\Core\EventListener\EventPriorities;
use App\Entity\Acheteur;
use App\Entity\Commercial;
use App\Entity\Fournisseur;
use App\Entity\User;
use App\Entity\ZoneCommercial;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class RoleSubscriber implements EventSubscriberInterface
{



    public static function getSubscribedEvents()
    {
       return [
           KernelEvents::VIEW => ['setRole',EventPriorities::PRE_WRITE]
       ];
    }
    public function setRole(GetResponseForControllerResultEvent $event){
        $user = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();
        if(!$user instanceof  User || $method !== Request::METHOD_POST ){
            return;
        }

        if($user instanceof Fournisseur){
            $user->setRoles([User::ROLE_FOURNISSEUR]);
        }
        elseif($user instanceof Acheteur){
            $user->setRoles([User::ROLE_ACHETEUR]);
        }
        elseif($user instanceof ZoneCommercial){
            $user->setRoles([User::ROLE_ZONE]);
        }
        elseif($user instanceof Commercial){
            $user->setRoles([User::ROLE_COMMERCIAL]);
        }
        else{
            $user->setRoles([User::ROLE_ADMIN]);
        }
    }
}