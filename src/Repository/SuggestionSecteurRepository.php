<?php

namespace App\Repository;

use App\Entity\SuggestionSecteur;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method SuggestionSecteur|null find($id, $lockMode = null, $lockVersion = null)
 * @method SuggestionSecteur|null findOneBy(array $criteria, array $orderBy = null)
 * @method SuggestionSecteur[]    findAll()
 * @method SuggestionSecteur[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SuggestionSecteurRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, SuggestionSecteur::class);
    }

    // /**
    //  * @return SuggestionSecteur[] Returns an array of SuggestionSecteur objects
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
    public function findOneBySomeField($value): ?SuggestionSecteur
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
