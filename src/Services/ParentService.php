<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 29/07/2019
 * Time: 12:08
 */

namespace App\Services;


use App\Email\Mailer;
use App\Entity\User;
use App\Repository\CommercialRepository;
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

    public function __construct(
        UserRepository $userRepository,
        EntityManagerInterface $entityManager,
        CommercialRepository $commercialRepository,
        ZoneCommercialRepository $zoneCommercialRepository,
        Mailer $mailer)
    {
        $this->userRepository = $userRepository;
        $this->entityManager = $entityManager;
        $this->commercialRepository = $commercialRepository;
        $this->zoneCommercialRepository = $zoneCommercialRepository;
        $this->mailer = $mailer;
    }



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

            }

        }

    }

}