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
use App\Entity\DemandeJeton;
use App\Entity\Jeton;
use App\Repository\DemandeJetonRepository;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;

class JetonsSubscriber implements EventSubscriberInterface
{


    /**
     * @var DemandeJetonRepository
     */
    private $demandeJetonRepository;
    /**
     * @var Mailer
     */
    private $mailer;

    public  function  __construct(
        DemandeJetonRepository $demandeJetonRepository,
        Mailer $mailer
        )
    {
        $this->demandeJetonRepository = $demandeJetonRepository;
        $this->mailer = $mailer;
    }

    public static function getSubscribedEvents()
    {
       return [
           KernelEvents::VIEW => [
               ['UpdateDemandeJeton',EventPriorities::PRE_WRITE],
               ['SendNotifToAdmin', EventPriorities::POST_WRITE],
           ]
       ];
    }

    public function SendNotifToAdmin(GetResponseForControllerResultEvent $event)
    {
        $demande = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if (!$demande instanceof DemandeJeton || $method !== Request::METHOD_POST) {
            return;
        }
        $this->mailer->alertAdminNvJeton($demande);

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