<?php
// src/App/EventListener/AuthenticationSuccessListener.php
namespace App\EventListener;


use App\Entity\Acheteur;
use App\Entity\Fournisseur;
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


        $currency = '';

        if($user instanceof Fournisseur || $user instanceof Acheteur){
            $currency = $user->getCurrency()?$user->getCurrency()->getName() : '';
        }


        $data['user']=[
            'id'=>$user->getId(),
            'role'=>$user->getRoles()[0],
            'data'=>[
                'displayName'=>$user->getFirstName().' '.$user->getLastName(),
                'photoURL'=> $user->getAvatar() ? $user->getAvatar()->getUrl() : '',
                'email'=>$user->getEmail(),
                'redirect'=>$user->getRedirect(),
                'currency'=>$currency,
            ]
        ];

        $event->setData($data);
    }
}