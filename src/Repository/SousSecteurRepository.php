<?php

namespace App\Repository;

use App\Entity\SousSecteur;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method SousSecteur|null find($id, $lockMode = null, $lockVersion = null)
 * @method SousSecteur|null findOneBy(array $criteria, array $orderBy = null)
 * @method SousSecteur[]    findAll()
 * @method SousSecteur[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SousSecteurRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, SousSecteur::class);
    }

    // /**
    //  * @return SousSecteur[] Returns an array of SousSecteur objects
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
    public function findOneBySomeField($value): ?SousSecteur
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
