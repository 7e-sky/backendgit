<?php

namespace App\DataProvider;

use ApiPlatform\Core\Bridge\Doctrine\Orm\Extension\QueryResultCollectionExtensionInterface;
use ApiPlatform\Core\DataProvider\CollectionDataProviderInterface;
use ApiPlatform\Core\DataProvider\RestrictedDataProviderInterface;
use App\Entity\DemandeAchat;
use App\Entity\Fournisseur;
use Doctrine\Common\Persistence\ManagerRegistry;
use Psr\Log\LoggerInterface;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Util\QueryNameGenerator;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\User\UserInterface;

final class DemandeAchatCollectionDataProvider implements CollectionDataProviderInterface, RestrictedDataProviderInterface
{

    /**
     * @var LoggerInterface
     */
    private $logger;
    /**
     * @var ManagerRegistry
     */
    private $managerRegistry;
    /**
     * @var iterable
     */
    private $collectionExtensions;
    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;


    public function __construct(TokenStorageInterface $tokenStorage, ManagerRegistry $managerRegistry, iterable $collectionExtensions, LoggerInterface $logger)
    {

        $this->logger = $logger;
        $this->managerRegistry = $managerRegistry;
        $this->collectionExtensions = $collectionExtensions;
        $this->tokenStorage = $tokenStorage;
    }

    public function supports(string $resourceClass, string $operationName = null, array $context = []): bool
    {
        return DemandeAchat::class === $resourceClass;
    }

    public function getCollection(string $resourceClass, string $operationName = null, array $context = [])
    {
        // Retrieve the blog post collection from somewhere
        $manager = $this->managerRegistry->getManagerForClass($resourceClass);
        $repository = $manager->getRepository($resourceClass);
        $queryBuilder = $repository->createQueryBuilder('o');
        $queryNameGenerator = new QueryNameGenerator();

        if ($operationName === 'get_by_fournisseur') {

            /**
             * @var UserInterface $fournisseur
             */
            $fournisseur = $this->tokenStorage->getToken()->getUser();

            if ($fournisseur instanceof Fournisseur) {

                $categories = $fournisseur->getCategories();
                $categories_id = [];
                foreach ($categories as $categorie) {
                    if ($categorie)
                        array_push($categories_id, $categorie->getId());
                }
                if (!empty($categories_id)) {
                    $queryBuilder->innerJoin('o.categories', 's')->innerJoin('o.acheteur', 'a')
                        ->where('s.id in (:categories_id)')
                        ->andWhere('o.statut = 1 OR o.statut = 3')
                        ->andWhere('o.isPublic = 1')
                        ->andWhere('o.del = 0')
                        ->andWhere('o.localisation = 1 OR ( o.localisation = 2 AND a.pays = :pays) OR ( o.localisation = 3 AND a.pays <> :pays) ')
                        ->andWhere('s.del = 0')
                        ->setParameter('categories_id', $categories_id)
                        ->setParameter('pays', $fournisseur->getPays());
                } else {
                    throw new NotFoundHttpException();
                }

            }

//            $this->logger->info("*****************HHHHHHHHHHHHHHHHHHHHHHHHHHHHH******************");

        }

        foreach ($this->collectionExtensions as $extension) {

            $extension->applyToCollection($queryBuilder, $queryNameGenerator, $resourceClass, $operationName, $context);

            if ($extension instanceof QueryResultCollectionExtensionInterface && $extension->supportsResult($resourceClass, $operationName, $context)) {
                return $extension->getResult($queryBuilder, $resourceClass, $operationName, $context);
            }
        }


        return $queryBuilder->getQuery()->getResult();

    }


}