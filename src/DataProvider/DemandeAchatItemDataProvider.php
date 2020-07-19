<?php
// api/src/DataProvider/BlogPostItemDataProvider.php

namespace App\DataProvider;

use ApiPlatform\Core\DataProvider\ItemDataProviderInterface;
use ApiPlatform\Core\DataProvider\RestrictedDataProviderInterface;
use Doctrine\Common\Persistence\ManagerRegistry;
use App\Entity\DemandeAchat;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\User\UserInterface;


final class DemandeAchatItemDataProvider implements ItemDataProviderInterface, RestrictedDataProviderInterface
{
    /**
     * @var ManagerRegistry
     */
    private $managerRegistry;
    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;

    public function __construct(ManagerRegistry $managerRegistry,TokenStorageInterface $tokenStorage)
    {
        $this->managerRegistry = $managerRegistry;
        $this->tokenStorage = $tokenStorage;
    }
    public function supports(string $resourceClass, string $operationName = null, array $context = []): bool
    {
        return DemandeAchat::class === $resourceClass;
    }

    public function getItem(string $resourceClass, $id, string $operationName = null, array $context = []): ?DemandeAchat
    {
        $manager = $this->managerRegistry->getManagerForClass($resourceClass);
        $repository = $manager->getRepository($resourceClass);
        if ($operationName === 'get_item_by_fournisseur') {
            $queryBuilder = $repository->createQueryBuilder('o');
            /**
             * @var UserInterface $fournisseur
             */
            $fournisseur = $this->tokenStorage->getToken()->getUser();

            $demande = $queryBuilder->andWhere('o.id =:id')
                ->andWhere('o.statut = 1 OR o.statut = 3')
                ->andWhere('o.isPublic = 1')
                ->andWhere('o.del = 0')
                ->setParameter('id', $id)
                ->getQuery()
                ->getOneOrNullResult();
            // Retrieve the blog post item from somewhere then return it or null if not found
            return $demande;
        }
        $demande = $repository->find($id);
        // Retrieve the blog post item from somewhere then return it or null if not found
        return $demande;

    }
}