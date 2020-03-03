<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 29/07/2019
 * Time: 11:55
 */

namespace App\Email;


use App\Entity\Abonnement;
use App\Entity\ContactFournisseur;
use App\Entity\DemandeAbonnement;
use App\Entity\DemandeAchat;
use App\Entity\DemandeDevis;
use App\Entity\DiffusionDemande;
use App\Entity\Fournisseur;
use App\Entity\Personnel;
use App\Entity\Produit;
use App\Entity\User;
use App\Repository\BlackListesRepository;
use App\Repository\FournisseurRepository;
use Doctrine\ORM\EntityManagerInterface;

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
    /**
     * @var FournisseurRepository
     */
    private $fournisseurRepository;
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;
    /**
     * @var BlackListesRepository
     */
    private $blackListesRepository;


    public function __construct(
        \Swift_Mailer $mailer,
        \Twig_Environment $twig,
        FournisseurRepository $fournisseurRepository,
        BlackListesRepository $blackListesRepository,
        EntityManagerInterface $entityManager

    )
    {
        $this->mailer = $mailer;
        $this->twig = $twig;
        $this->fournisseurRepository = $fournisseurRepository;
        $this->entityManager = $entityManager;
        $this->blackListesRepository = $blackListesRepository;
    }

    //======================================================================
    // CONFIRMATION EMAIL ACCOUNT
    //======================================================================

    public function sendConfirmationEmail(User $user)
    {

        $body = $this->twig->render(
            'email/confirmation.html.twig', ['user' => $user]
        );

        //send e-mail
        $message = (new \Swift_Message('Vérifiez votre adresse email'))
            ->setFrom('youness.arbouh1@gmail.com')
            ->setTo($user->getEmail())
            ->setBody($body, 'text/html');

        $this->mailer->send($message);

    }



    //======================================================================
    // DIFFUSER RFQ => FOURNISSEURS CONSERNEES
    //======================================================================

    public function alerterFournisseurs(DemandeAchat $demande)
    {

        $body = $this->twig->render(
            'email/alertClients.html.twig', ['demande' => $demande]
        );

        $ids_sous_secteurs = [];

        foreach ($demande->getSousSecteurs() as $sousSecteur) {
            array_push($ids_sous_secteurs, $sousSecteur->getId());
        }
        $fournisseurs = $this->fournisseurRepository->createQueryBuilder('f')
            ->innerJoin('f.sousSecteurs', 's')
            ->where('s.id in (:sous_secteurs_id)')
            ->andWhere('s.del = 0')
            ->andWhere('f.del = 0')
            ->andWhere('f.isactif = 1')
            ->select('f')
            ->setParameter('sous_secteurs_id', $ids_sous_secteurs)
            ->getQuery()
            ->getResult();


        $fournisseurs_blacklists = $this->blackListesRepository->findBy(['acheteur' => $demande->getAcheteur()->getId(), 'etat' => 1]);


        $nbrshare = 0;
        foreach ($fournisseurs as $fournisseur) {

            $trouve = false;

            foreach ($fournisseurs_blacklists as $blacklist) {
                if ($blacklist->getFournisseur() == $fournisseur) {
                    $trouve = true;
                    break;
                }
            }

            if (!$trouve) {
                $message = (new \Swift_Message('Demande de devis'))
                    ->setFrom('youness.arbouh1@gmail.com')
                    ->setTo($fournisseur->getEmail())
                    ->setBody($body, 'text/html');

                if ($demande->getAttachements()) {
                    foreach ($demande->getAttachements() as $item) {
                        $message->attach(\Swift_Attachment::fromPath(ltrim($item->getUrl(), '/')));
                    }
                }
                $this->mailer->send($message);

                $diffusionDemande = new DiffusionDemande();
                $diffusionDemande->setDateDiffusion(new \DateTime());
                $diffusionDemande->setFournisseur($fournisseur);
                $diffusionDemande->setDemande($demande);
                $demande->addDiffusionsdemande($diffusionDemande);
                $nbrshare++;

            }

        }
        $this->entityManager->flush();

    }

    //======================================================================
    // AFFECTATION RFQ => PERSONNEL
    //======================================================================

    // Alerter le personnel

    public function alerterPersonnels(Personnel $personnel, DemandeAchat $demande, Fournisseur $fournisseur)
    {

        $body = $this->twig->render(
            'email/affectation.html.twig', ['demande' => $demande, 'personnel' => $personnel, 'fournisseur' => $fournisseur]
        );

        $message = (new \Swift_Message('Affectation Email'))
            ->setFrom('youness.arbouh1@gmail.com')
            ->setTo($personnel->getEmail())
            ->setCc($fournisseur->getEmail())
            ->setBody($body, 'text/html');

        if ($demande->getAttachements()) {
            foreach ($demande->getAttachements() as $item) {
                $message->attach(\Swift_Attachment::fromPath(ltrim($item->getUrl(), '/')));
            }
        }

        $this->mailer->send($message);

    }

    //======================================================================
    // FOURNISSEUR MESSAGE FICHE ENTREPRISE
    //======================================================================


    // Alerter le fournisseur quand un visiteur public lui envoyé un message

    public function alerteFournisseurMessagePublic(ContactFournisseur $message)
    {

        $body = $this->twig->render(
            'email/messageFournisseur.html.twig', ['message' => $message]
        );

        $message = (new \Swift_Message('Demande d\'information | Les Achats Industriels'))
            ->setFrom('youness.arbouh1@gmail.com')
            ->setTo($message->getFournisseur()->getEmail())
            ->setBody($body, 'text/html');

        $this->mailer->send($message);

    }

    //======================================================================
    // PRODUIT & DEMANDE DEVIS PAR PRODUIT
    //======================================================================


    // Alerter le fournisseur quand un visiteur public a demandé un devis

    public function alerteFournisseurDemandeDevisPublic(DemandeDevis $demandeDevis)
    {

        $body = $this->twig->render(
            'email/demandeDevis.html.twig', ['demandeDevis' => $demandeDevis]
        );

        $message = (new \Swift_Message('Demande de devis | Les Achats Industriels'))
            ->setFrom('youness.arbouh1@gmail.com')
            ->setTo($demandeDevis->getFournisseur()->getEmail())
            ->setBody($body, 'text/html');

        $this->mailer->send($message);

    }

    // Alerter le fournisseur quand son produit et valider par l'admin

    public function alerteFournisseurValidationProduit(Produit $produit)
    {

        $body = $this->twig->render(
            'email/produitValidation.html.twig', ['produit' => $produit]
        );

        $message = (new \Swift_Message('Validation du produit Réf. ' . $produit->getReference()))
            ->setFrom('youness.arbouh1@gmail.com')
            ->setTo($produit->getFournisseur()->getEmail())
            ->setBody($body, 'text/html');

        $this->mailer->send($message);

    }


    //======================================================================
    // ABONNENET & COMMANDE
    //======================================================================


    // Alerter le fournisseur quand son commande d'abonnement et traité ou une activation d'une abonnement par l'admin

    public function alerteFournisseurValidationAbonnement(Abonnement $abonnement)
    {

        $body = $this->twig->render(
            'email/validationAbonnement.html.twig', ['abonnement' => $abonnement]
        );

        $message = (new \Swift_Message('Activation de l\'abonnement  ' . $abonnement->getOffre()->getName()))
            ->setFrom('youness.arbouh1@gmail.com')
            ->setTo($abonnement->getFournisseur()->getEmail())
            ->setBody($body, 'text/html');

        $this->mailer->send($message);

    }

    // Accusé de reception de la commande d'abonnement

    public function alerteFournisseurAccuseeReception(DemandeAbonnement $demande)
    {

        $body = $this->twig->render(
            'email/receptionDmdAbonnement.html.twig', ['demande' => $demande]
        );

        $message = (new \Swift_Message('Commande Réf. ' . $demande->getReference()))
            ->setFrom('youness.arbouh1@gmail.com')
            ->setTo($demande->getFournisseur()->getEmail())
            ->setBody($body, 'text/html');

        $this->mailer->send($message);

    }

    // Send email notification to Zone & Commercial lors d'une commande offre d'abonnement d'un fournisseur

    public function sendEmailNotification(DemandeAbonnement $demandeAbonnement)
    {

        $body = $this->twig->render(
            'email/notificationAbonnement.html.twig', ['demande' => $demandeAbonnement, 'commercial' => $demandeAbonnement->getCommercial()]
        );


        //send e-mail
        $message = (new \Swift_Message('Commande offre d\'abonnement par fournisseur'))
            ->setFrom('youness.arbouh1@gmail.com')
            ->setTo($demandeAbonnement->getCommercial()->getEmail())
            ->setCc($demandeAbonnement->getZone()->getEmail())
            ->setBody($body, 'text/html');

        $this->mailer->send($message);

    }
}