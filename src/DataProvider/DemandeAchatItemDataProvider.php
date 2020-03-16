<?php
// api/src/DataProvider/BlogPostItemDataProvider.php

namespace App\DataProvider;

use ApiPlatform\Core\DataProvider\ItemDataProviderInterface;
use ApiPlatform\Core\DataProvider\RestrictedDataProviderInterface;
use Doctrine\Common\Persistence\ManagerRegistry;
use App\Entity\DemandeAchat;

final class DemandeAchatItemDataProvider implements ItemDataProviderInterface, RestrictedDataProviderInterface
{
    /**
     * @var ManagerRegistry
     */
    private $managerRegistry;

    public function __construct(ManagerRegistry $managerRegistry)
    {
        $this->managerRegistry = $managerRegistry;
    }
    public function supports(string $resourceClass, string $operationName = null, array $context = []): bool
    {
        return DemandeAchat::class === $resourceClass;
    }

    public function getItem(string $resourceClass, $id, string $operationName = null, array $context = []): ?DemandeAchat
    {
        $manager = $this->managerRegistry->getManagerForClass($resourceClass);
        $repository = $manager->getRepository($resourceClass);
        $demande = $repository->findOneBy(['id'=>$id,'statut'=>1,'isPublic'=>true]);
        // Retrieve the blog post item from somewhere then return it or null if not found
        return $demande;
    }
}