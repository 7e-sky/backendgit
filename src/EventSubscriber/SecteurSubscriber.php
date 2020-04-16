<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 23/07/2019
 * Time: 14:31
 */

namespace App\EventSubscriber;

use ApiPlatform\Core\EventListener\EventPriorities;
use App\Entity\Secteur;
use App\Repository\AcheteurRepository;
use App\Repository\SousSecteurRepository;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;

class SecteurSubscriber implements EventSubscriberInterface
{

    /**
     * @var AcheteurRepository
     */
    private $acheteurRepository;
    /**
     * @var SousSecteurRepository
     */
    private $sousSecteurRepository;

    public function __construct(AcheteurRepository $acheteurRepository, SousSecteurRepository $sousSecteurRepository)
    {

        $this->acheteurRepository = $acheteurRepository;
        $this->sousSecteurRepository = $sousSecteurRepository;
    }

    public static function getSubscribedEvents()
    {
       return [
           KernelEvents::VIEW => [
               ['PutSecteur',EventPriorities::PRE_WRITE],
           ]
       ];
    }


    public function PutSecteur(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if(!$entity instanceof  Secteur  || $method !== Request::METHOD_PUT ){
            return;
        }

        if($entity->getDel()){
            $acheteurs = $this->acheteurRepository->findBy(['secteur'=>$entity->getId(),'del'=>false]);
            $sousSecteurs = $this->sousSecteurRepository->findBy(['secteur'=>$entity->getId(),'del'=>false]);

            if($acheteurs || $sousSecteurs){
                throw new Exception("Vous ne pouvez pas supprimer cet enregistrement, car il est en relation avec d'autre(s) objet(s) !",400);
            }
        }

    }



}