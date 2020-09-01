<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 23/07/2019
 * Time: 14:31
 */

namespace App\EventSubscriber;

use ApiPlatform\Core\EventListener\EventPriorities;
use App\Entity\Categorie;
use App\Exception\ErrorMessageException;
use App\Repository\DemandeAchatRepository;
use App\Repository\FournisseurRepository;
use App\Repository\ProduitRepository;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;

class CategorieSubscriber implements EventSubscriberInterface
{


    /**
     * @var ProduitRepository
     */
    private $produitRepository;
    /**
     * @var FournisseurRepository
     */
    private $fournisseurRepository;
    /**
     * @var DemandeAchatRepository
     */
    private $demandeAchatRepository;


    public function __construct(ProduitRepository $produitRepository ,FournisseurRepository $fournisseurRepository, DemandeAchatRepository $demandeAchatRepository)
    {

        $this->produitRepository = $produitRepository;
        $this->fournisseurRepository = $fournisseurRepository;
        $this->demandeAchatRepository = $demandeAchatRepository;
    }

    public static function getSubscribedEvents()
    {
       return [
           KernelEvents::VIEW => [
               ['PutCategorie',EventPriorities::PRE_WRITE],
           ]
       ];
    }


    public function PutCategorie(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if(!$entity instanceof  Categorie  || $method !== Request::METHOD_PUT ){
            return;
        }

        if($entity->getDel()){
            $produit = $this->produitRepository->findOneBy(['categorie'=>$entity->getId(),'del'=>false]);
            $fournisseur = $this->fournisseurRepository->createQueryBuilder('f')
                ->innerJoin('f.categories','s')
                ->where('s.id = :s_id')
                ->andWhere('f.del = 0')
                ->setParameter('s_id', $entity)
                ->setMaxResults(1)
                ->getQuery()
                ->getOneOrNullResult();
            $demande = $this->demandeAchatRepository->createQueryBuilder('d')
                ->innerJoin('d.categories','s')
                ->where('s.id = :s_id')
                ->andWhere('d.del = 0')
                ->setParameter('s_id', $entity)
                ->setMaxResults(1)
                ->getQuery()
                ->getOneOrNullResult();
            if($produit || $fournisseur || $demande){
                throw new ErrorMessageException("Vous ne pouvez pas supprimer cet enregistrement, car il est en relation avec d'autre(s) objet(s) !");
            }
        }

    }



}