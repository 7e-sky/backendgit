<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 29/07/2019
 * Time: 11:55
 */

namespace App\Email;


use App\Entity\User;

class Mailer
{

    /**
     * @var \Swift_Mailer
     */
    private $mailer;
    /**
     * @var \Twig_Environment
     */
    private $twig;

    public function __construct(\Swift_Mailer $mailer, \Twig_Environment $twig)
    {
        $this->mailer = $mailer;
        $this->twig = $twig;
    }

    public function sendConfirmationEmail(User $user){

        $body = $this->twig->render(
            'email/confirmation.html.twig',['user'=>$user]
        );

        //send e-mail
        $message = ( new \Swift_Message('Vérifiez votre adresse email'))
            ->setFrom('youness.arbouh1@gmail.com')
            ->setTo($user->getEmail())
            ->setBody($body, 'text/html');

        $this->mailer->send($message);

    }
}