<?php

namespace App\EventListener;

use App\Email\Mailer;
use App\Entity\DemandeAchat;
use Doctrine\Common\Persistence\Event\LifecycleEventArgs;
use Doctrine\ORM\Mapping as ORM;

class DemandeAchatChangedNotifier{

    /**
     * @var Mailer
     */
    private $mailer;

    public  function  __construct(
        Mailer $mailer
    )
    {

        $this->mailer = $mailer;
    }

    /** @ORM\PostUpdate() */
    public function postUpdate(DemandeAchat $demandeAchat, LifecycleEventArgs $event)
    {
        if( $demandeAchat->getStatut() !== 1 || !$demandeAchat->sendEmail) {
            return;
        }

        $this->mailer->alerterFournisseurs($demandeAchat);
    }

}