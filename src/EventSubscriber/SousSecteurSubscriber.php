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
use App\Exception\ErrorMessageException;
use App\Repository\CategorieRepository;
use App\Repository\DemandeAchatRepository;
use App\Repository\FournisseurRepository;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;

class SousSecteurSubscriber implements EventSubscriberInterface
{

    /**
     * @var CategorieRepository
     */
    private $categorieRepository;


    public function __construct(CategorieRepository $categorieRepository)
    {


        $this->categorieRepository = $categorieRepository;
    }


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

        if($entity->getDel()){

            $categorie = $this->categorieRepository->createQueryBuilder('d')
                ->innerJoin('d.sousSecteurs','s')
                ->where('s.id = :s_id')
                ->andWhere('d.del = 0')
                ->setParameter('s_id', $entity)
                ->setMaxResults(1)
                ->getQuery()
                ->getOneOrNullResult();

            if($categorie){
                throw new ErrorMessageException("Vous ne pouvez pas supprimer cet enregistrement, car il est en relation avec d'autre(s) objet(s) !");
            }
        }

    }



}