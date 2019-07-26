<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 25/07/2019
 * Time: 12:15
 */

namespace App\Serializer;

use ApiPlatform\Core\Exception\RuntimeException;
use ApiPlatform\Core\Serializer\SerializerContextBuilderInterface;
use App\Entity\Acheteur;
use App\Entity\Commercial;
use App\Entity\Fournisseur;
use App\Entity\User;
use App\Entity\ZoneCommercial;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Authorization\AuthorizationCheckerInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class UserContextBuilder implements SerializerContextBuilderInterface
{

    /**
     * @var SerializerContextBuilderInterface
     */
    private $decorated;
    /**
     * @var AuthorizationCheckerInterface
     */
    private $authorizationChecker;


    public function __construct(
        SerializerContextBuilderInterface $decorated,
        AuthorizationCheckerInterface $authorizationChecker
    )
    {

        $this->decorated = $decorated;
        $this->authorizationChecker = $authorizationChecker;
    }

    /**
     * Creates a serialization context from a Request.
     *
     * @throws RuntimeException
     */
    public function createFromRequest(Request $request, bool $normalization, array $extractedAttributes = null): array
    {
        $context= $this->decorated->createFromRequest(
            $request,$normalization,$extractedAttributes
        );

        // Class being serialized/deserialized
        $resourceClass= $context['resource_class'] ?? null ; //Default to null if not set

        if(
            (
                User::class === $resourceClass ||
                Acheteur::class === $resourceClass ||
                Fournisseur::class === $resourceClass ||
                Commercial::class === $resourceClass ||
                ZoneCommercial::class === $resourceClass
            ) &&
            isset($context['groups']) &&
            $normalization === true &&
            $this->authorizationChecker->isGranted(User::ROLE_ADMIN)
        ){
            $context['groups'][]="get-admin";
        }
        return $context;
    }
}