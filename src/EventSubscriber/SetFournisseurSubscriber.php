<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 23/07/2019
 * Time: 14:31
 */

namespace App\EventSubscriber;

use ApiPlatform\Core\EventListener\EventPriorities;
use App\Entity\Admin;
use App\Entity\Fournisseur;
use App\Interfaces\SetFournisseurInterface;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class SetFournisseurSubscriber implements EventSubscriberInterface
{

    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;


    public function __construct(
        TokenStorageInterface $tokenStorage,
        EntityManagerInterface $entityManager
    )
    {
        $this->tokenStorage = $tokenStorage;
        $this->entityManager = $entityManager;
    }

    public
    static function getSubscribedEvents()
    {
        return [
            KernelEvents::VIEW => [
                ['SetFournisseur', EventPriorities::PRE_WRITE,],
                ['GetFournisseur', EventPriorities::PRE_WRITE],
            ]
        ];
    }

    public function SetFournisseur(GetResponseForControllerResultEvent $event)
    {

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        /**
         * @var UserInterface $founrisseur
         */
        $founrisseur = $this->tokenStorage->getToken()->getUser();

        if (!$entity instanceof SetFournisseurInterface || $method !== Request::METHOD_POST) {
            return;
        }

        if ($founrisseur instanceof Fournisseur) {
            $entity->setFournisseur($founrisseur);
        }

    }

    public function GetFournisseur(GetResponseForControllerResultEvent $event)
    {

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();


        /**
         * @var UserInterface $founrisseur
         */
        $user = $this->tokenStorage->getToken()->getUser();

        if (!$entity instanceof Fournisseur || $method !== Request::METHOD_GET) {
            return;
        }

        if (!$user || !$user instanceof Admin) {
            $entity->setVisite($entity->getVisite() + 1);
            $this->entityManager->flush();
        }

    }


}