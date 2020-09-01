<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 23/07/2019
 * Time: 14:31
 */

namespace App\EventSubscriber;

use ApiPlatform\Core\EventListener\EventPriorities;
use App\Entity\Pays;
use App\Exception\ErrorMessageException;
use App\Repository\VilleRepository;
use App\Repository\FournisseurRepository;
use App\Repository\AcheteurRepository;
use App\Repository\ZoneCommercialRepository;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;

class PaysSubscriber implements EventSubscriberInterface
{


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
        VilleRepository $villeRepository,
        FournisseurRepository $fournisseurRepository,
        AcheteurRepository $acheteurRepository,
        ZoneCommercialRepository $zoneCommercialRepository
        )
    {
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

        if($entity->getDel() === true){
            $ville = $this->villeRepository->findOneBy(['pays'=>$entity,'del'=>false]);
            $acheteur = $this->acheteurRepository->findOneBy(['pays'=>$entity,'del'=>false]);
            $fournisseur = $this->fournisseurRepository->findOneBy(['pays'=>$entity,'del'=>false]);
            $zone = $this->zoneCommercialRepository->createQueryBuilder('z')
                ->innerJoin('z.pays','p')
                ->where('p.id = :p_id')
                ->andWhere('z.del = 0')
                ->setParameter('p_id', $entity)
                ->setMaxResults(1)
                ->getQuery()
                ->getOneOrNullResult();

            if($fournisseur || $acheteur || $ville || $zone){
                throw new ErrorMessageException("Vous ne pouvez pas supprimer cet enregistrement, car il est en relation avec d'autre(s) objet(s) !");
            }
        }

    }



}