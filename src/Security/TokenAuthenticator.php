<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 26/07/2019
 * Time: 10:23
 */

namespace App\Security;


use App\Entity\User;
use Lexik\Bundle\JWTAuthenticationBundle\Exception\ExpiredTokenException;
use Lexik\Bundle\JWTAuthenticationBundle\Security\Authentication\Token\PreAuthenticationJWTUserToken;
use Lexik\Bundle\JWTAuthenticationBundle\Security\Guard\JWTTokenAuthenticator;
use Symfony\Component\Security\Core\User\UserProviderInterface;

class TokenAuthenticator extends JWTTokenAuthenticator
{
    /**
     * @param PreAuthenticationJWTUserToken $preAuthToken
     * @param UserProviderInterface $userProvider
     * @return null|\Symfony\Component\Security\Core\User\UserInterface|void
     */
    public function getUser($preAuthToken, UserProviderInterface $userProvider)
    {
        /**
         * @var User $user
         */
        $user = parent::getUser($preAuthToken, $userProvider);

        if ($user->getPasswordChangeDate() && $preAuthToken->getPayload()['iat'] < $user->getPasswordChangeDate() ){
            throw new ExpiredTokenException();
        }

        return $user;

    }


}