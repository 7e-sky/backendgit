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
use App\Entity\Abonnement;
use App\Entity\DemandeAbonnement;
use App\Entity\Admin;
use App\Entity\ZoneCommercial;
use App\Entity\Commercial;
use App\Entity\Fournisseur;
use App\Repository\AbonnementRepository;
use App\Repository\CurrencyRepository;
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
    /**
     * @var AbonnementRepository
     */
    private $abonnementRepository;
    /**
     * @var CurrencyRepository
     */
    private $currencyRepository;


    public function __construct(
        Mailer $mailer,
        EntityManagerInterface $entityManager,
        DemandeAbonnementRepository $repository,
        AbonnementRepository $abonnementRepository,
        TokenStorageInterface $tokenStorage,
        CurrencyRepository $currencyRepository
    )
    {
        $this->tokenStorage = $tokenStorage;
        $this->mailer = $mailer;
        $this->entityManager = $entityManager;
        $this->repository = $repository;
        $this->abonnementRepository = $abonnementRepository;
        $this->currencyRepository = $currencyRepository;
    }

    public static function getSubscribedEvents()
    {
        return [
            KernelEvents::VIEW => [
                ['PostDemandeAbonnement', EventPriorities::PRE_WRITE],
                ['PutDemandeAbonnement', EventPriorities::PRE_WRITE],
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

            $entity->setFournisseur($user);

            $entity->setReference($this->getRef());
            $prixOffre = $entity->getOffre()->getPrixMad();

            $entity->setCurrency('MAD');
            if ($entity->getFournisseur()->getCurrency() && $entity->getFournisseur()->getCurrency()->getName() !== 'MAD') {
                $prixOffre = $entity->getOffre()->getPrixEur();
                $entity->setCurrency('EUR');
            }

            $remiseOffre = 0;
            if ($entity->getDuree()->getRemise()) {
                $remiseOffre = $entity->getDuree()->getRemise();
            }

            $prixHT = $prixOffre * $entity->getDuree()->getName();

            //Remise par offre
            if ($remiseOffre) {
                $prixHT = $prixHT - ($prixHT * $remiseOffre / 100);
            }

            //HT + TVA = TTC
            $ttc = $prixHT + ($prixHT * 0.2);

            if ($entity->getFournisseur()->getCurrency() && $entity->getFournisseur()->getCurrency()->getName() !== 'MAD') {
                $ttc = $prixHT;
            }

            $entity->setPrix($ttc);

            //Set Commercial && zone Commercial
            $parent1 = $user->getParent1();
            $parent2 = null;
            if (!$parent1) {
                $this->mailer->sendEmailNotificationAdmin($entity);
            }
            if ($parent1) {
                $parent2 = $parent1->getParent1();
            }
            if ($parent2 instanceof ZoneCommercial) {
                $entity->setZone($parent2);
                if ($parent1 instanceof Commercial) {
                    $entity->setCommercial($parent1);
                    //Alerter La zone & commercial
                    $this->mailer->sendEmailNotification($entity);
                }

            } else {
                if ($parent1 instanceof ZoneCommercial) {
                    $entity->setZone($parent1);
                    $this->mailer->sendEmailNotificationZone($entity);
                }
            }
            //Accuser de réception
            $this->mailer->alerteFournisseurAccuseeReception($entity);


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
        return 'Dab-' . date("Y") . '-' . $result;

    }

    public function PutDemandeAbonnement(GetResponseForControllerResultEvent $event)
    {

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if (!$entity instanceof DemandeAbonnement || $method !== Request::METHOD_PUT) {
            return;
        }

        /**
         * @var UserInterface $user
         */
        $user = $this->tokenStorage->getToken()->getUser();

        if ($user instanceof Admin) {

            $abonnement = new Abonnement();
            $abonnement->setFournisseur($entity->getFournisseur());
            $abonnement->setDemande($entity);
            $abonnement->setOffre($entity->getOffre());
            $abonnement->setMode($entity->getMode());
            $abonnement->setDuree($entity->getDuree());
            $abonnement->setType($entity->getType());
            $abonnement->setSousSecteurs($entity->getSousSecteurs());
            $abonnement->setCreated(new \DateTime());

            if ($entity->getFournisseur()->getCurrency() && $entity->getFournisseur()->getCurrency()->getName() !== 'MAD')
                $abonnement->setCurrency($this->currencyRepository->findOneBy(['name' => 'EUR']));
            else
                $abonnement->setCurrency($this->currencyRepository->findOneBy(['name' => 'MAD']));


            if ($entity->getFournisseur()->getCurrency())
                $abonnement->setCurrency($entity->getFournisseur()->getCurrency());

            $prixOffre = $entity->getOffre()->getPrixMad();

            if ($entity->getFournisseur()->getCurrency() && $entity->getFournisseur()->getCurrency()->getName() !== 'MAD')
                $prixOffre = $entity->getOffre()->getPrixEur();

            $remiseOffre = 0;
            if ($entity->getDuree()->getRemise()) {
                $remiseOffre = $entity->getDuree()->getRemise();
            }

            $prixHT = $prixOffre * $entity->getDuree()->getName();

            //Remise par offre
            if ($remiseOffre) {
                $prixHT = $prixHT - ($prixHT * $remiseOffre / 100);
            }

            //Remise par admin
            if ($entity->remise) {
                $abonnement->setRemise($entity->remise);
                $prixHT = $prixHT - ($entity->remise);
            }


            //HT + TVA = TTC
            $ttc = $prixHT + ($prixHT * 0.2);

            if ($entity->getFournisseur()->getCurrency() && $entity->getFournisseur()->getCurrency()->getName() !== 'MAD')
                $ttc = $prixHT;

            $abonnement->setPrix($ttc);
            $abonnement->setReference($this->getRefAbonnement());
            $abonnement->setType($entity->getType());


            if ($entity->paiement && is_null($abonnement->getDatePeiment())) {
                $abonnement->setDatePeiment(new \DateTime());
                $abonnement->setStatut(true);

                if ($entity->getType()) {
                    $old = $this->abonnementRepository->findOneBy(['fournisseur' => $entity->getFournisseur(), 'statut' => true], ['expired' => 'desc']);
                    $datenow = new \DateTime();
                    if ($old->getExpired() > $datenow)
                        $abonnement->setExpired($old->getExpired()->add(new \DateInterval('P' . $entity->getDuree()->getName() . 'M')));
                    else
                        $abonnement->setExpired(new \DateTime('+' . $entity->getDuree()->getName() . ' months'));

                } else {
                    $abonnement->setExpired(new \DateTime('+' . $entity->getDuree()->getName() . ' months'));
                }
                $abonnement->setExpired(new \DateTime('+' . $entity->getDuree()->getName() . ' months'));
                $this->mailer->alerteFournisseurValidationAbonnement($abonnement);
            }

            $this->entityManager->persist($abonnement);

            $entity->setStatut(true);
        }

    }

    /** GENERETE REFERENCE ABONNEMENT **/

    public function getRefAbonnement()
    {

        $qb = $this->abonnementRepository->createQueryBuilder('d')
            ->andWhere('year(d.created) = :year')
            ->setParameter('year', date("Y"))
            ->select('count(d.id)');
        $query = $qb->getQuery();
        $result = $query->getSingleScalarResult();
        $result++;
        return 'Ab-' . date("Y") . '-' . $result;

    }


}