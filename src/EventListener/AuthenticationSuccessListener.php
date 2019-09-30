<?php
// src/App/EventListener/AuthenticationSuccessListener.php
namespace App\EventListener;


use Lexik\Bundle\JWTAuthenticationBundle\Event\AuthenticationSuccessEvent;
use Symfony\Component\Security\Core\User\UserInterface;


class AuthenticationSuccessListener{

    /**
     * @param AuthenticationSuccessEvent $event
     */
    public function onAuthenticationSuccessResponse(AuthenticationSuccessEvent $event)
    {
        $data = $event->getData();
        $user = $event->getUser();

        if (!$user instanceof UserInterface) {
            return;
        }

        $data['user']=[
            'id'=>$user->getId(),
            'role'=>$user->getRoles()[0],
            'data'=>[
                'displayName'=>$user->getFirstName().' '.$user->getLastName(),
                'photoURL'=> $user->getAvatar() ? $user->getAvatar()->getUrl() : '',
                'email'=>$user->getEmail()
            ]
        ];

        $event->setData($data);
    }
}