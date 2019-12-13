<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 23/07/2019
 * Time: 14:31
 */

namespace App\EventSubscriber;

use ApiPlatform\Core\EventListener\EventPriorities;
use App\Entity\Jeton;
use App\Repository\DemandeJetonRepository;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;

class JetonsSubscriber implements EventSubscriberInterface
{


    /**
     * @var DemandeJetonRepository
     */
    private $demandeJetonRepository;

    public  function  __construct(
        DemandeJetonRepository $demandeJetonRepository
        )
    {
        $this->demandeJetonRepository = $demandeJetonRepository;
    }

    public static function getSubscribedEvents()
    {
       return [
           KernelEvents::VIEW => [
               'UpdateDemandeJeton',EventPriorities::PRE_WRITE
           ]
       ];
    }
    public function UpdateDemandeJeton(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();


        if(!$entity instanceof  Jeton  || $method !== Request::METHOD_POST ){
            return;
        }

        if($entity->getDemande()){
            $demande=$this->demandeJetonRepository->find($entity->getDemande()->getId());
            $demande->setIsUse(true);
        }


    }



}