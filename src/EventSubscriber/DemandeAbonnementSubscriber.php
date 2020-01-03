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
use App\Entity\DemandeAbonnement;
use App\Entity\Admin;
use App\Entity\ZoneCommercial;
use App\Entity\Commercial;
use App\Entity\Fournisseur;
use App\Entity\Produit;
use App\Repository\DemandeAbonnementRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class DemandeAbonnementSubscriber implements EventSubscriberInterface
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
     * @var DemandeAbonnementRepository
     */
    private $repository;


    public function __construct(
        Mailer $mailer,
        EntityManagerInterface $entityManager,
        DemandeAbonnementRepository $repository,
        TokenStorageInterface $tokenStorage
    )
    {
        $this->tokenStorage = $tokenStorage;
        $this->mailer = $mailer;
        $this->entityManager = $entityManager;
        $this->repository = $repository;
    }

    public static function getSubscribedEvents()
    {
        return [
            KernelEvents::VIEW => [
                ['PostDemandeAbonnement', EventPriorities::PRE_WRITE],
                ['PutProduit', EventPriorities::PRE_WRITE],
            ]
        ];
    }

    public function PostDemandeAbonnement(GetResponseForControllerResultEvent $event)
    {

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();


        if (!$entity instanceof DemandeAbonnement || $method !== Request::METHOD_POST) {
            return;
        }

        /**
         * @var UserInterface $user
         */
        $user = $this->tokenStorage->getToken()->getUser();
        if ($user instanceof Fournisseur) {


            $parent1 = $user->getParent1();
            $parent2 = null;
            if ($parent1) {
                $parent2 = $parent1->getParent1();
            }
            if ($parent2 instanceof ZoneCommercial) {
                $entity->setZone($parent2);
                if ($parent1 instanceof Commercial)
                    $entity->setCommercial($parent1);

            } else {
                if ($parent1 instanceof ZoneCommercial) {
                    $entity->setZone($parent1);
                }
            }
            $entity->setReference($this->getRef());
        }

    }

    /** GENERETE REFERENCE DEMANDE ABONNEMENT **/

    public function getRef()
    {

        $qb = $this->repository->createQueryBuilder('d')
            ->andWhere('year(d.created) = :year')
            ->setParameter('year', date("Y"))
            ->select('count(d.id)');
        $query = $qb->getQuery();
        $result = $query->getSingleScalarResult();
        $result++;
        return date("Y") . '-' . $result;

    }

    public function PutProduit(GetResponseForControllerResultEvent $event)
    {

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if (!$entity instanceof Produit || $method !== Request::METHOD_PUT) {
            return;
        }

        /**
         * @var UserInterface $user
         */
        $user = $this->tokenStorage->getToken()->getUser();

        if ($user instanceof Admin) {
            if ($entity->getisValid() && is_null($entity->getDateValidation())) {
                $entity->setDateValidation(new \DateTime());
                $this->mailer->alerteFournisseurValidationProduit($entity);
            }
        }

    }


}