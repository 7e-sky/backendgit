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
use App\Entity\Admin;
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

class AbonnementSubscriber implements EventSubscriberInterface
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
                ['PostAbonnement', EventPriorities::PRE_WRITE],
                ['PutAbonnement', EventPriorities::PRE_WRITE],
            ]
        ];
    }

    public function PostAbonnement(GetResponseForControllerResultEvent $event)
    {

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();


        if (!$entity instanceof Abonnement || $method !== Request::METHOD_POST) {
            return;
        }

        /**
         * @var UserInterface $user
         */
        $user = $this->tokenStorage->getToken()->getUser();
        if ($user instanceof Admin) {

            $entity->setReference($this->getRefAbonnement());

            $prixOffre = $entity->getOffre()->getPrixMad();

            if ($entity->getFournisseur()->getCurrency() && $entity->getFournisseur()->getCurrency()->getName() !== 'MAD') {
                $entity->setCurrency($this->currencyRepository->findOneBy(['name' => 'EUR']));
                $prixOffre = $entity->getOffre()->getPrixEur();
            } else
                $entity->setCurrency($this->currencyRepository->findOneBy(['name' => 'MAD']));

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
            if ($entity->getRemise()) {
                $entity->setRemise($entity->getRemise());
                $prixHT = $prixHT - ($entity->getRemise());
            }

            //HT + TVA = TTC
            $ttc = $prixHT + ($prixHT * 0.2);

            //Pour commul admin
            $prixAdmin = $ttc;

            if ($entity->getFournisseur()->getCurrency() && $entity->getFournisseur()->getCurrency()->getName() !== 'MAD') {
                $ttc = $prixHT;
                $prixAdmin = $prixHT * 10;

            }

            $entity->setPrix($ttc);
            $entity->setPrixAdmin($prixAdmin);


            if ($entity->getStatut()) {
                $entity->setDatePeiment(new \DateTime());
                if ($entity->getType()) {
                    $old = $this->abonnementRepository->findOneBy(['fournisseur' => $entity->getFournisseur(), 'statut' => true], ['expired' => 'desc']);
                    $entity->setExpired($old->getExpired()->add(new \DateInterval('P' . $entity->getDuree()->getName() . 'M')));

                } else {
                    $entity->setExpired(new \DateTime('+' . $entity->getDuree()->getName() . ' months'));
                }
                $this->mailer->alerteFournisseurValidationAbonnement($entity);
            }

        }

    }


    public function PutAbonnement(GetResponseForControllerResultEvent $event)
    {

        $abonnement = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if (!$abonnement instanceof Abonnement || $method !== Request::METHOD_PUT) {
            return;
        }

        /**
         * @var UserInterface $user
         */
        $user = $this->tokenStorage->getToken()->getUser();

        if ($user instanceof Admin) {


            $abonnement->setOffre($abonnement->getOffre());
            $abonnement->setMode($abonnement->getMode());
            $abonnement->setDuree($abonnement->getDuree());
            $abonnement->setSousSecteurs($abonnement->getSousSecteurs());


            $prixOffre = $abonnement->getOffre()->getPrixMad();
            if ($abonnement->getCurrency() && $abonnement->getCurrency()->getName() !== 'MAD')
                $prixOffre = $abonnement->getOffre()->getPrixEur();

            $remiseOffre = 0;
            if ($abonnement->getDuree()->getRemise()) {
                $remiseOffre = $abonnement->getDuree()->getRemise();
            }

            $prixHT = $prixOffre * $abonnement->getDuree()->getName();

            //Remise par offre
            if ($remiseOffre) {
                $prixHT = $prixHT - ($prixHT * $remiseOffre / 100);
            }

            //Remise par admin
            if ($abonnement->getRemise()) {
                $abonnement->setRemise($abonnement->getRemise());
                $prixHT = $prixHT - ($abonnement->getRemise());
            }

            //HT + TVA = TTC
            $ttc = $prixHT + ($prixHT * 0.2);

            if ($abonnement->getCurrency() && $abonnement->getCurrency()->getName() !== 'MAD')
                $ttc = $prixHT;

            $abonnement->setPrix($ttc);


            if ($abonnement->getStatut() && is_null($abonnement->getDatePeiment())) {
                $abonnement->setDatePeiment(new \DateTime());

                if ($abonnement->getType()) {
                    $old = $this->abonnementRepository->findOneBy(['fournisseur' => $abonnement->getFournisseur(), 'statut' => true], ['expired' => 'desc']);
                    $datenow = new \DateTime();
                    if ($old->getExpired() > $datenow)
                        $abonnement->setExpired($old->getExpired()->add(new \DateInterval('P' . $abonnement->getDuree()->getName() . 'M')));
                    else
                        $abonnement->setExpired(new \DateTime('+' . $abonnement->getDuree()->getName() . ' months'));

                } else {
                    $abonnement->setExpired(new \DateTime('+' . $abonnement->getDuree()->getName() . ' months'));
                }

                $this->mailer->alerteFournisseurValidationAbonnement($abonnement);

            }

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