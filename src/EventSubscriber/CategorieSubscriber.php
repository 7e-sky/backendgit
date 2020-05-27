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


    public function __construct(ProduitRepository $produitRepository)
    {

        $this->produitRepository = $produitRepository;
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

            if($produit){
                throw new Exception("Vous ne pouvez pas supprimer cet enregistrement, car il est en relation avec d'autre(s) objet(s) !",400);
            }
        }

    }



}