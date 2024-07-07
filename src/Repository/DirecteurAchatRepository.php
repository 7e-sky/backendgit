<?php
namespace App\Repository;

use App\Entity\DirecteurAchat;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method DirecteurAchat|null find($id, $lockMode = null, $lockVersion = null)
 * @method DirecteurAchat|null findOneBy(array $criteria, array $orderBy = null)
 * @method DirecteurAchat[]    findAll()
 * @method DirecteurAchat[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DirecteurAchatRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, DirecteurAchat::class);
    }
}