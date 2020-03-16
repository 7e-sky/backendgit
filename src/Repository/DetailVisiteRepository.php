<?php

namespace App\Repository;

use App\Entity\DetailVisite;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method DetailVisite|null find($id, $lockMode = null, $lockVersion = null)
 * @method DetailVisite|null findOneBy(array $criteria, array $orderBy = null)
 * @method DetailVisite[]    findAll()
 * @method DetailVisite[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DetailVisiteRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, DetailVisite::class);
    }

    // /**
    //  * @return DetailVisite[] Returns an array of DetailVisite objects
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
    public function findOneBySomeField($value): ?DetailVisite
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
