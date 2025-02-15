<?php

namespace App\Repository;

use App\Entity\BlackListes;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method BlackListes|null find($id, $lockMode = null, $lockVersion = null)
 * @method BlackListes|null findOneBy(array $criteria, array $orderBy = null)
 * @method BlackListes[]    findAll()
 * @method BlackListes[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BlackListesRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, BlackListes::class);
    }

    public function findByUniqueCriteria(array $criteria)
    {
        // would use findOneBy() but Symfony expects a Countable object
        return $this->_em->getRepository(BlackListes::class)->findOneBy($criteria);
    }
    // /**
    //  * @return BlackListes[] Returns an array of BlackListes objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('b')
            ->andWhere('b.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('b.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?BlackListes
    {
        return $this->createQueryBuilder('b')
            ->andWhere('b.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
