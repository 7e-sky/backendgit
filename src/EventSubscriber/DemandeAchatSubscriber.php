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
use App\Entity\Acheteur;
use App\Entity\DemandeAchat;
use App\Entity\User;
use App\Exception\DisableToDelete;
use App\Repository\DemandeAchatRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Symfony\Component\Security\Core\Exception\DisabledException;
use Symfony\Component\Security\Core\User\UserInterface;

class DemandeAchatSubscriber implements EventSubscriberInterface
{

    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;
    /**
     * @var DemandeAchatRepository
     */
    private $repository;

    public  function  __construct(
        TokenStorageInterface $tokenStorage,
        EntityManagerInterface $entityManager,
        DemandeAchatRepository $repository
        )
    {
        $this->tokenStorage = $tokenStorage;
        $this->entityManager = $entityManager;
        $this->repository = $repository;
    }

    public static function getSubscribedEvents()
    {
       return [
           KernelEvents::VIEW => [
               ['visiteDemandeAchat',EventPriorities::PRE_WRITE ],
               ['deleteDemeandeAchat',EventPriorities::PRE_WRITE ],
            //   ['AccessControll',EventPriorities::PRE_WRITE ],
               ['putDemandeAchat',EventPriorities::PRE_WRITE ],
              // ['sendEmails',EventPriorities::POST_WRITE ]
           ]
       ];
    }

    public function putDemandeAchat(GetResponseForControllerResultEvent $event){

        $demande = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();


        if(!$demande instanceof  DemandeAchat  || $method !== Request::METHOD_PUT ){
            return;
        }

        $demande->setDateModification(new \DateTime());

        /**
         * @var UserInterface $acheteur
         */
        $user = $this->tokenStorage->getToken()->getUser();

        if($user->getRoles()[0] === 'ROLE_ACHETEUR'){
            $demande->setStatut(0);
        }

        if($user->getRoles()[0] === 'ROLE_ADMIN'){
            if(!$demande->getReference() || is_null($demande->getReference())){
                if($demande->getStatut() === 1){
                    $demande->setReference($this->getRfq());
                }
            }
        }

//        if($demande->getStatut() === 1 && $demande->sendEmail){
//            $demande->setNbrShare($this->mailer->alerterFournisseurs($demande));
//        }
        if($demande->getStatut() !== 2 ){
            $demande->setMotifRejet(null);
        }
        if($demande->sendEmail){
            $demande->setIsAlerted(true);
        }

    }

    public function getRfq(){

        $qb =$this->repository->createQueryBuilder('d')
            ->where('d.statut = :searchTerm')
            ->andWhere('year(d.created) = :year')
            ->setParameter('searchTerm', 1)
            ->setParameter('year', date("Y"))
            ->select('count(d.id)');
        $query = $qb->getQuery();
        $result = $query->getSingleScalarResult();
        $result++;
        return date("Y").'-'.$result;

    }

    public function sendEmails(GetResponseForControllerResultEvent $event){

        $demande = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        //$demande->setNbrShare(5);

        if(!$demande instanceof  DemandeAchat  || $method !== Request::METHOD_PUT ){
            return;
        }


        if( $demande->getStatut() !== 1 || !$demande->sendEmail) {
           return;
        }

        $this->mailer->alerterFournisseurs($demande);
        $this->entityManager->flush();


    }
    public function visiteDemandeAchat(GetResponseForControllerResultEvent $event){

        $demande = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        /**
         * @var UserInterface $acheteur
         */
        $user = $this->tokenStorage->getToken()->getUser();

        if(!$demande instanceof  DemandeAchat  || $method !== Request::METHOD_GET ){
            return;
        }

        if(!$user instanceof User){
            $nbrVisite = $demande->getNbrVisite();

            $nbrVisite +=1;

            $demande->setNbrVisite($nbrVisite);

            $this->entityManager->flush();
        }


    }
    public function deleteDemeandeAchat(GetResponseForControllerResultEvent $event){

        $demande = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();


        if(!$demande instanceof  DemandeAchat  || $method !== Request::METHOD_DELETE ){
            return;
        }

        if($demande->getStatut() === 1 || $demande->getStatut() === 3){
            throw new DisableToDelete();
        }

    }

    /*public function AccessControll(GetResponseForControllerResultEvent $event){

        $request = $event->getRequest();

        /**
         * @var UserInterface $acheteur
         */
    /* $acheteur = $this->tokenStorage->getToken()->getUser();


     if('api_acheteurs_demandes_get_subresource' !== $request->get('_route')){
         return;
     }
     $lists = $event->getControllerResult();

     if($acheteur instanceof Acheteur){

         $trouve = false;
         if($lists->getTotalItems()){
             foreach ($lists as $list){
                 if($list->getAcheteur() == $acheteur){
                     $trouve =true;
                     break;
                 }
             }
         }else{
             $trouve = true;
         }

         if(!$trouve){
             throw new AccessDeniedException();
         }
     }


 }*/
}