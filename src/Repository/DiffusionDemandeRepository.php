<?php

namespace App\Repository;

use App\Entity\DiffusionDemande;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;


/**
 * @method DiffusionDemande|null find($id, $lockMode = null, $lockVersion = null)
 * @method DiffusionDemande|null findOneBy(array $criteria, array $orderBy = null)
 * @method DiffusionDemande[]    findAll()
 * @method DiffusionDemande[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DiffusionDemandeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, DiffusionDemande::class);
    }

    // /**
    //  * @return DiffusionDemande[] Returns an array of DiffusionDemande objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('d')
            ->andWhere('d.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('d.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?DiffusionDemande
    {
        return $this->createQueryBuilder('d')
            ->andWhere('d.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
