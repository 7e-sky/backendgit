<?php

namespace App\Filter;

use ApiPlatform\Core\Api\IriConverterInterface;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\AbstractContextAwareFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Util\QueryNameGeneratorInterface;
use Doctrine\ORM\QueryBuilder;
use ApiPlatform\Core\Bridge\Doctrine\Common\Filter\SearchFilterTrait;
use Symfony\Component\PropertyAccess\PropertyAccessorInterface;

final class OrSearchFilter extends AbstractContextAwareFilter
{
    use SearchFilterTrait;

    protected function filterProperty(string $property, $value, QueryBuilder $queryBuilder, QueryNameGeneratorInterface $queryNameGenerator, string $resourceClass, string $operationName = null)
    {
        // otherwise filter is applied to order and page as well

        if (
            !$this->isPropertyEnabled($property, $resourceClass) ||
            !$this->isPropertyMapped($property, $resourceClass,true)
        ) {
            return;
        }

        $alias = $queryBuilder->getRootAliases()[0];
        $field = $property;

        $associations = [];
        if ($this->isPropertyNested($property, $resourceClass)) {
            [$alias, $field, $associations] = $this->addJoinsForNestedProperty($property, $alias, $queryBuilder, $queryNameGenerator, $resourceClass);
        }

        $values = $this->normalizeValues((array) $value, $property);
        if (null === $values) {
            return;
        }
        $valueParameter = $queryNameGenerator->generateParameterName($field);

        $queryBuilder
            ->orWhere(sprintf('%s.%s = :%s AND o.isValid = true AND o.del = false', $alias, $field, $valueParameter))
            ->setParameter($valueParameter,  $values[0] );

        //var_dump($queryBuilder->getQuery()->getSQL());exit;
    }

    // This function is only used to hook in documentation generators (supported by Swagger and Hydra)
    public function getDescription(string $resourceClass): array
    {
        if (!$this->properties) {
            return [];
        }

        $description = [];
        foreach ($this->properties as $property => $strategy) {
            $description["frs_$property"] = [
                'property' => $property,
                'type' => 'string',
                'required' => false,
                'swagger' => [
                    'description' => 'Filter using OR in fournisseur Parent!',
                    'name' => 'Custom name to use in the Swagger documentation',
                    'type' => 'Will appear below the name in the Swagger documentation',
                ],
            ];
        }

        return $description;
    }

    /**
     * Converts a Doctrine type in PHP type.
     */
    protected function getType(string $doctrineType): string
    {
        // TODO: Implement getType() method.
    }

    protected function getIriConverter(): IriConverterInterface
    {
        // TODO: Implement getIriConverter() method.
    }

    protected function getPropertyAccessor(): PropertyAccessorInterface
    {
        // TODO: Implement getPropertyAccessor() method.
    }
}