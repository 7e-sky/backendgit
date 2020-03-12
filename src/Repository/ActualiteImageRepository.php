<?php

namespace App\Repository;

use App\Entity\ActualiteImage;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ActualiteImage|null find($id, $lockMode = null, $lockVersion = null)
 * @method ActualiteImage|null findOneBy(array $criteria, array $orderBy = null)
 * @method ActualiteImage[]    findAll()
 * @method ActualiteImage[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ActualiteImageRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ActualiteImage::class);
    }

    // /**
    //  * @return ActualiteImage[] Returns an array of ActualiteImage objects
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
    public function findOneBySomeField($value): ?ActualiteImage
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
