<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 30/09/2019
 * Time: 18:10
 */

namespace App\Services;


use App\Entity\User;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class UserService
{


    /**
     * @var TokenStorageInterface
     */
    private $storage;

    public function __construct(TokenStorageInterface $storage)
    {

        $this->storage = $storage;
    }


    public function getCurrentUser()
    {
        $token = $this->storage->getToken();
        if ($token instanceof TokenInterface) {

            /** @var User $user */
            $user = $token->getUser();
            return $user;

        } else {
            return null;
        }
    }
}