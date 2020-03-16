<?php

namespace App\Repository;

use App\Entity\SelectProduit;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method SelectProduit|null find($id, $lockMode = null, $lockVersion = null)
 * @method SelectProduit|null findOneBy(array $criteria, array $orderBy = null)
 * @method SelectProduit[]    findAll()
 * @method SelectProduit[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SelectProduitRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, SelectProduit::class);
    }

    // /**
    //  * @return SelectProduit[] Returns an array of SelectProduit objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('s.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?SelectProduit
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
