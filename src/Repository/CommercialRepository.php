<?php

namespace App\Repository;

use App\Entity\Commercial;
use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Commercial|null find($id, $lockMode = null, $lockVersion = null)
 * @method Commercial|null findOneBy(array $criteria, array $orderBy = null)
 * @method Commercial[]    findAll()
 * @method Commercial[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CommercialRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Commercial::class);
    }

    /**
     * @param string[] $criteria format: array('user' => <user_id>, 'name' => <name>)
     */
    public function findByUniqueCriteria(array $criteria)
    {
        // would use findOneBy() but Symfony expects a Countable object
        return $this->_em->getRepository(User::class)->findBy($criteria);
    }

    // /**
    //  * @return Commercial[] Returns an array of Commercial objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Commercial
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
