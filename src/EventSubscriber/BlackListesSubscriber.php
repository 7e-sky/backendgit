<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 29/07/2019
 * Time: 10:43
 */

namespace App\EventSubscriber;


use ApiPlatform\Core\EventListener\EventPriorities;
use App\Entity\Acheteur;
use App\Entity\BlackListes;
use App\Repository\BlackListesRepository;
use Doctrine\DBAL\Exception\UniqueConstraintViolationException;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;

class BlackListesSubscriber implements EventSubscriberInterface
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
     * @var BlackListesRepository
     */
    private $blackListesRepository;

    public function __construct(TokenStorageInterface $tokenStorage,
                                BlackListesRepository $blackListesRepository,
                                EntityManagerInterface $entityManager
)
    {

        $this->tokenStorage = $tokenStorage;
        $this->entityManager = $entityManager;
        $this->blackListesRepository = $blackListesRepository;
    }

    public static function getSubscribedEvents()
    {
        return [
            KernelEvents::VIEW => [
             //   ['AccessControll',EventPriorities::PRE_WRITE],
                ['postBlackListe',EventPriorities::PRE_WRITE],
                ]
        ];
    }

    public function AccessControll(GetResponseForControllerResultEvent $event){

        $request = $event->getRequest();

        /**
         * @var UserInterface $acheteur
         */
        $acheteur = $this->tokenStorage->getToken()->getUser();


        if('api_acheteurs_blacklistes_get_subresource' !== $request->get('_route')){
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


    }
    public function postBlackListe(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();
        /**
         * @var UserInterface $acheteur
         */
        $acheteur = $this->tokenStorage->getToken()->getUser();

        if(!$entity instanceof  BlackListes  || !in_array($method,[Request::METHOD_POST,Request::METHOD_PUT])  ){
            return;
        }
        if(!$acheteur instanceof Acheteur){
            return;
        }

        $entities= $this->blackListesRepository->findByUniqueCriteria(['acheteur'=>$acheteur,'fournisseur'=>$entity->getFournisseur()]);

        if($entities && $method === Request::METHOD_PUT){
            if($entity->getId() !== $entities->getId()){
                throw new Exception('Cette société déjà black listé');
            }
        }
        elseif($entities && $method === Request::METHOD_POST){
                throw new Exception('Cette société déjà black listé');
        }

        if(!$entity->getEtat()){
            $entity->setDeblacklister(new \DateTime());
        }


    }
}