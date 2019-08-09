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
use App\Entity\User;
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

    public function __construct(TokenStorageInterface $tokenStorage)
    {

        $this->tokenStorage = $tokenStorage;
    }

    public static function getSubscribedEvents()
    {
        return [
            KernelEvents::VIEW => ['AccessControll',EventPriorities::PRE_WRITE]
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
}