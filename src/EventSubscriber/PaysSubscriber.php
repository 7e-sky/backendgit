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
use App\Entity\Admin;
use App\Entity\Pays;
use App\Entity\Produit;
use App\Repository\VilleRepository;
use App\Repository\FournisseurRepository;
use App\Repository\AcheteurRepository;
use App\Repository\ZoneCommercialRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class PaysSubscriber implements EventSubscriberInterface
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
     * @var EntityManagerInterface
     */
    private $entityManager;
    /**
     * @var VilleRepository
     */
    private $villeRepository;
    /**
     * @var FournisseurRepository
     */
    private $fournisseurRepository;
    /**
     * @var AcheteurRepository
     */
    private $acheteurRepository;
    /**
     * @var ZoneCommercialRepository
     */
    private $zoneCommercialRepository;


    public  function  __construct(
        EntityManagerInterface $entityManager,
        VilleRepository $villeRepository,
        FournisseurRepository $fournisseurRepository,
        AcheteurRepository $acheteurRepository,
        ZoneCommercialRepository $zoneCommercialRepository,
        TokenStorageInterface $tokenStorage
        )
    {
        $this->tokenStorage = $tokenStorage;
        $this->entityManager = $entityManager;
        $this->villeRepository = $villeRepository;
        $this->fournisseurRepository = $fournisseurRepository;
        $this->acheteurRepository = $acheteurRepository;
        $this->zoneCommercialRepository = $zoneCommercialRepository;
    }

    public static function getSubscribedEvents()
    {
       return [
           KernelEvents::VIEW => [
               ['PutPays',EventPriorities::PRE_WRITE],
           ]
       ];
    }

    public function PutPays(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if(!$entity instanceof  Pays  || $method !== Request::METHOD_PUT ){
            return;
        }

        // TODO : Check zone
        if($entity->getDel() === true){
            $countVille = $this->villeRepository->count(['pays'=>$entity,'del'=>false]);
            if($countVille){
                throw new \Exception('Vous ne pouvez pas supprimer cet pays car il est en relation avec d\'autre entité');
            }
            $countAcheteur = $this->acheteurRepository->count(['pays'=>$entity,'del'=>false]);
            if($countAcheteur){
                throw new \Exception('Vous ne pouvez pas supprimer cet pays car il est en relation avec d\'autre entité');
            }
            $countFournisseur = $this->fournisseurRepository->count(['pays'=>$entity,'del'=>false]);
            if($countFournisseur){
                throw new \Exception('Vous ne pouvez pas supprimer cet pays car il est en relation avec d\'autre entité');
            }
        }

    }


    public function PutProduit(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if(!$entity instanceof  Produit  || $method !== Request::METHOD_PUT ){
            return;
        }

        /**
         * @var UserInterface $user
         */
        $user = $this->tokenStorage->getToken()->getUser();

        if($user instanceof Admin) {
            if ($entity->getisValid() && is_null($entity->getDateValidation())) {
                $entity->setDateValidation(new \DateTime());
                $this->mailer->alerteFournisseurValidationProduit($entity);
            }
        }

    }



}