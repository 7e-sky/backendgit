<?php

namespace App\Repository;

use App\Entity\ZoneCommercial;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method ZoneCommercial|null find($id, $lockMode = null, $lockVersion = null)
 * @method ZoneCommercial|null findOneBy(array $criteria, array $orderBy = null)
 * @method ZoneCommercial[]    findAll()
 * @method ZoneCommercial[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ZoneCommercialRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, ZoneCommercial::class);
    }

    // /**
    //  * @return ZoneCommercial[] Returns an array of ZoneCommercial objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('z')
            ->andWhere('z.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('z.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ZoneCommercial
    {
        return $this->createQueryBuilder('z')
            ->andWhere('z.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
