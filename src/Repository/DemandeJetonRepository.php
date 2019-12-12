<?php

namespace App\Repository;

use App\Entity\DemandeJeton;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method DemandeJeton|null find($id, $lockMode = null, $lockVersion = null)
 * @method DemandeJeton|null findOneBy(array $criteria, array $orderBy = null)
 * @method DemandeJeton[]    findAll()
 * @method DemandeJeton[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DemandeJetonRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, DemandeJeton::class);
    }

    // /**
    //  * @return DemandeJeton[] Returns an array of DemandeJeton objects
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
    public function findOneBySomeField($value): ?DemandeJeton
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
