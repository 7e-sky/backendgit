<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 29/07/2019
 * Time: 12:08
 */

namespace App\Services;


use App\Email\Mailer;
use App\Entity\Fournisseur;
use App\Entity\FournisseurProvisoire;
use App\Entity\User;
use App\Repository\CommercialRepository;
use App\Repository\FournisseurRepository;
use App\Repository\UserRepository;
use App\Repository\ZoneCommercialRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class ParentService
{

    /**
     * @var UserRepository
     */
    private $userRepository;
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;
    /**
     * @var CommercialRepository
     */
    private $commercialRepository;
    /**
     * @var ZoneCommercialRepository
     */
    private $zoneCommercialRepository;
    /**
     * @var Mailer
     */
    private $mailer;
    /**
     * @var FournisseurRepository
     */
    private $fournisseurRepository;

    public function __construct(
        UserRepository $userRepository,
        EntityManagerInterface $entityManager,
        CommercialRepository $commercialRepository,
        ZoneCommercialRepository $zoneCommercialRepository,
        Mailer $mailer,
        FournisseurRepository $fournisseurRepository)
    {
        $this->userRepository = $userRepository;
        $this->entityManager = $entityManager;
        $this->commercialRepository = $commercialRepository;
        $this->zoneCommercialRepository = $zoneCommercialRepository;
        $this->mailer = $mailer;
        $this->fournisseurRepository = $fournisseurRepository;
    }


    // SET PARENT POUR LES ACHETEURS / FOURNISSEUR => ZONE ou COMMERCIALE

    public function setParent(User $user,$profile){


        if(!$user){
            throw new NotFoundHttpException();
        }

        $commercial = $this->commercialRepository->createQueryBuilder('c')
            ->innerJoin('c.villes','v')
            ->where('v.id = :ville_id')
            ->andWhere('v.del = 0')
            ->andWhere('c.del = 0')
            ->andWhere('c.isactif = 1')
            ->orderBy('c.created', 'DESC')
            ->select('c.id')
            ->setParameter('ville_id', $user->getVille())
            ->setMaxResults(1)
            ->getQuery()
            ->getScalarResult();

        if($commercial){
            $commercial = $this->userRepository->find($commercial[0]['id']);
            $user->setParent1($commercial);
            $this->mailer->newSociete($user,$commercial,$profile);
        }
        else{
            $zone = $this->zoneCommercialRepository->createQueryBuilder('z')
                ->innerJoin('z.pays','p')
                ->where('p.id = :pays_id')
                ->andWhere('p.del = 0')
                ->andWhere('z.del = 0')
                ->andWhere('z.isactif = 1')
                ->orderBy('z.created', 'DESC')
                ->select('z.id')
                ->setParameter('pays_id', $user->getPays())
                ->setMaxResults(1)
                ->getQuery()
                ->getScalarResult();
            if($zone){
                $zone = $this->userRepository->find($zone[0]['id']);
                $user->setParent1($zone);
                $this->mailer->newSociete($user,$zone,$profile);

            }else{
                $this->mailer->newSocieteAdmin($user,$profile);
            }

        }

    }

    // Vérifier s'il ya déjà une societé avec le meme nom
    public function checkParentFrs(Fournisseur $fournisseur){


        if(!$fournisseur){
            throw new NotFoundHttpException();
        }


        $societe = mb_strtolower($fournisseur->getSociete());
        $societe = trim($societe);
//        $email = $fournisseur->getEmail();

        if(!$societe){
            return null;
        }

        $fournisseurs = $this->fournisseurRepository->createQueryBuilder('f')
            ->where("f.societeLower LIKE CONCAT(:societe, '%%') OR f.societeLower LIKE CONCAT( '%%',:societe)")
            ->andWhere('f.del = 0')
            //->andWhere('f.isactif = 1')
            //->andWhere('f.isComplet=1')
            //->andWhere('f.parent is null')
            ->setParameter('societe', $societe)
            ->getQuery()
            ->getResult();

        if(!$fournisseurs){
            return null;
        }

        $frs_Provesoire = new FournisseurProvisoire();
        $frs_Provesoire->setCivilite($fournisseur->getCivilite());
        $frs_Provesoire->setSociete($fournisseur->getSociete());
        $frs_Provesoire->setFirstName($fournisseur->getFirstName());
        $frs_Provesoire->setLastName($fournisseur->getLastName());
        $frs_Provesoire->setEmail($fournisseur->getEmail());
        $frs_Provesoire->setPhone($fournisseur->getPhone());
        $frs_Provesoire->setPassword($fournisseur->getPassword());
        $frs_Provesoire->setCreated(new \DateTime());
        $frs_Provesoire->setType(0);
        $frs_Provesoire->setFournisseurParent($fournisseurs[0]);
        $this->entityManager->persist($frs_Provesoire);
        $this->entityManager->flush();

       $this->mailer->childTryRegister($frs_Provesoire);
        return $fournisseurs[0];


    }
}