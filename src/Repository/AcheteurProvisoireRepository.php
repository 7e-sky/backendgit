<?php

namespace App\Repository;

use App\Entity\AcheteurProvisoire;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method AcheteurProvisoire|null find($id, $lockMode = null, $lockVersion = null)
 * @method AcheteurProvisoire|null findOneBy(array $criteria, array $orderBy = null)
 * @method AcheteurProvisoire[]    findAll()
 * @method AcheteurProvisoire[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AcheteurProvisoireRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AcheteurProvisoire::class);
    }

    // /**
    //  * @return AcheteurProvisoire[] Returns an array of AcheteurProvisoire objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('a.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?AcheteurProvisoire
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
