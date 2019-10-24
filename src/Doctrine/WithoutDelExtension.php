<?php
// api/src/Doctrine/CurrentUserExtension.php

namespace App\Doctrine;

use ApiPlatform\Core\Bridge\Doctrine\Orm\Extension\QueryCollectionExtensionInterface;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Extension\QueryItemExtensionInterface;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Util\QueryNameGeneratorInterface;
use App\Entity\Acheteur;
use App\Entity\Admin;
use App\Entity\Commercial;
use App\Entity\Fournisseur;
use App\Entity\Pays;
use App\Entity\Secteur;
use App\Entity\SousSecteur;
use App\Entity\User;
use App\Entity\Ville;
use App\Entity\ZoneCommercial;
use Doctrine\ORM\QueryBuilder;
use Symfony\Component\Security\Core\User\UserInterface;

final class WithoutDelExtension implements QueryCollectionExtensionInterface, QueryItemExtensionInterface
{


    public function applyToCollection(QueryBuilder $queryBuilder, QueryNameGeneratorInterface $queryNameGenerator, string $resourceClass, string $operationName = null)
    {
        $this->addWhere($queryBuilder, $resourceClass);
    }

    public function applyToItem(QueryBuilder $queryBuilder, QueryNameGeneratorInterface $queryNameGenerator, string $resourceClass, array $identifiers, string $operationName = null, array $context = [])
    {
        $this->addWhere($queryBuilder, $resourceClass);
    }

    private function addWhere(QueryBuilder $queryBuilder, string $resourceClass): void
    {

        if
        (
            Pays::class !== $resourceClass &&
            Ville::class !== $resourceClass &&
            Secteur::class !== $resourceClass &&
            SousSecteur::class !== $resourceClass &&
            ZoneCommercial::class !== $resourceClass &&
            Commercial::class !== $resourceClass &&
            Acheteur::class !== $resourceClass &&
            Fournisseur::class !== $resourceClass &&
            Admin::class !== $resourceClass
        )
        {
            return;
        }
        $queryBuilder->andWhere('o.del = :searchTerm')
                     ->setParameter('searchTerm', 0);



    }
}