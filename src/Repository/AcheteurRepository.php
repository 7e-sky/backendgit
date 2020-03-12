<?php

namespace App\Repository;

use App\Entity\Acheteur;
use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;


/**
 * @method Acheteur|null find($id, $lockMode = null, $lockVersion = null)
 * @method Acheteur|null findOneBy(array $criteria, array $orderBy = null)
 * @method Acheteur[]    findAll()
 * @method Acheteur[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AcheteurRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Acheteur::class);
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
    //  * @return Acheteur[] Returns an array of Acheteur objects
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
    public function findOneBySomeField($value): ?Acheteur
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
