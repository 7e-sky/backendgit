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

                $sous_secteurs = $fournisseur->getSousSecteurs();
                $sous_secteurs_id = [];
                foreach ($sous_secteurs as $secteur) {
                    if ($secteur)
                        array_push($sous_secteurs_id, $secteur->getId());
                }
                if (!empty($sous_secteurs_id)) {
                    $queryBuilder->innerJoin('o.sousSecteurs', 's')
                        ->where('s.id in (:sous_secteurs_id)')
                        ->andWhere('o.statut = 1')
                        ->andWhere('s.del = 0')
                        ->setParameter('sous_secteurs_id', $sous_secteurs_id);
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