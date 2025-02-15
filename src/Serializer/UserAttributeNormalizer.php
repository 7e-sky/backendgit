<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 25/07/2019
 * Time: 15:51
 */

namespace App\Serializer;


use App\Entity\User;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Serializer\Exception\CircularReferenceException;
use Symfony\Component\Serializer\Exception\ExceptionInterface;
use Symfony\Component\Serializer\Exception\InvalidArgumentException;
use Symfony\Component\Serializer\Exception\LogicException;
use Symfony\Component\Serializer\Normalizer\ContextAwareNormalizerInterface;
use Symfony\Component\Serializer\Normalizer\NormalizerInterface;
use Symfony\Component\Serializer\SerializerAwareInterface;
use Symfony\Component\Serializer\SerializerAwareTrait;
use Symfony\Component\Serializer\SerializerInterface;

class UserAttributeNormalizer implements  ContextAwareNormalizerInterface,SerializerAwareInterface
{

    use SerializerAwareTrait;

    const USER_ATTRIBUTE_NORMALIZE_ALREADY_CALLED = 'USER_ATTRIBUTE_NORMALIZE_ALREADY_CALLED';
    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;

    public function __construct(TokenStorageInterface $tokenStorage)
    {
        $this->tokenStorage = $tokenStorage;
    }

    public function supportsNormalization($data, $format = null, array $context = [])
    {
        if(isset($context[self::USER_ATTRIBUTE_NORMALIZE_ALREADY_CALLED])){
            return false;
        }
        return $data instanceof User;
    }


    public function normalize($object, $format = null, array $context = [])
    {
        if($this->isUserHimself($object)){
            $context['groups'][]='get-owner';
        }
        
        //Now Continue with serialization
        return $this->passOn($object,$format,$context);
    }

    private function isUserHimself($object)
    {

        return $object->getUsername() === $this->tokenStorage->getToken()->getUsername();

    }

    private function passOn($object,$format,$context)
    {
        if(!$this->serializer instanceof NormalizerInterface){
            throw new \LogicException(printf('Cannot normalize object "%s" becouse the injected serialize is not a normalizer.',$object));
        }

        $context[self::USER_ATTRIBUTE_NORMALIZE_ALREADY_CALLED]=true;

        return $this->serializer->normalize($object,$format,$context);
    }


}