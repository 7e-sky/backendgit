<?php

namespace App\Repository;

use App\Entity\DemandeAchat;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method DemandeAchat|null find($id, $lockMode = null, $lockVersion = null)
 * @method DemandeAchat|null findOneBy(array $criteria, array $orderBy = null)
 * @method DemandeAchat[]    findAll()
 * @method DemandeAchat[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DemandeAchatRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, DemandeAchat::class);
    }
    /**
     * @param string[] $criteria format: array('user' => <user_id>, 'name' => <name>)
     */

    // /**
    //  * @return DemandeAchat[] Returns an array of DemandeAchat objects
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
    public function findOneBySomeField($value): ?DemandeAchat
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
