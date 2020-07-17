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


    private  $AdminMailer;
    private  $AdherentMailer;
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


    private $admin_email = 'administrateur@lesachatsindustriels.com';
    private $adherent_email = 'adherent@lesachatsindustriels.com';
    private $achats_email = 'achats@lesachatsindustriels.com';



    public function __construct(
        $AdherentMailer,
        $AdminMailer,
        $twig,
        FournisseurRepository $fournisseurRepository,
        BlackListesRepository $blackListesRepository,
        EntityManagerInterface $entityManager

    )
    {
        $this->twig = $twig;
        $this->fournisseurRepository = $fournisseurRepository;
        $this->entityManager = $entityManager;
        $this->blackListesRepository = $blackListesRepository;
        $this->AdherentMailer = $AdherentMailer;
        $this->AdminMailer = $AdminMailer;
    }

    //======================================================================
    // ACHETEURS & FOURNISSEUR INSCRIPTION ALERT ADMIN
    //======================================================================
    public function newRegister(User $user, $profile)
    {

        $body = $this->twig->render(
            'email/alertAdminNewRegister.html.twig', ['user' => $user, 'profile' => $profile]
        );

        //send e-mail
        $message = (new \Swift_Message('Inscription ' . $profile . ' sur lesachatsindustriels.com'))
            ->setFrom($this->adherent_email,'Les Achats Industriels')
            ->setTo($this->admin_email)
            ->setBody($body, 'text/html');

        $this->AdherentMailer->send($message);

    }

    public function newSociete(User $user, User $parent, $profile)
    {

        $body = $this->twig->render(
            'email/newSocieteAlert.html.twig', ['user' => $user, 'profile' => $profile]
        );
        $cc = [];
        array_push($cc, $this->admin_email);
        if ($parent->getParent1())
            array_push($cc, $parent->getParent1()->getEmail());

        //send e-mail
        $message = (new \Swift_Message('Inscription ' . $profile . ' sur lesachatsindustriels.com'))
            ->setFrom($this->adherent_email,'Les Achats Industriels')
            ->setTo($parent->getEmail())
            ->setCc($cc)
            ->setBody($body, 'text/html');

        $this->AdherentMailer->send($message);

    }

    public function newSocieteAdmin(User $user, $profile)
    {

        $body = $this->twig->render(
            'email/newSocieteAlert.html.twig', ['user' => $user, 'profile' => $profile]
        );

        //send e-mail
        $message = (new \Swift_Message('Inscription ' . $profile . ' sur lesachatsindustriels.com'))
            ->setFrom($this->adherent_email,'Les Achats Industriels')
            ->setTo($this->admin_email)
            ->setBody($body, 'text/html');

        $this->AdherentMailer->send($message);

    }

    //======================================================================
    // FORGOT PASSWORD
    //======================================================================

    public function sendForgotPasswordToken(User $user)
    {

        $body = $this->twig->render(
            'email/forgotPassword.html.twig', ['user' => $user]
        );

        //send e-mail
        $message = (new \Swift_Message('Réinitialiser votre mot de passe'))
            ->setFrom($this->admin_email,'Les Achats Industriels')
            ->setTo($user->getEmail())
            ->setBody($body, 'text/html');

        $this->AdminMailer->send($message);

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
            ->setFrom($this->adherent_email,'Les Achats Industriels')
            ->setTo($user->getEmail())
            ->setBody($body, 'text/html');

        try {
            $result = $this->AdherentMailer->send($message);
        }
        catch (\Swift_TransportException $e) {
            echo $e->getMessage();
        }


    }

    public function bienvenueEmail(User $user)
    {

        $body = $this->twig->render(
            'email/bienvenue.html.twig', ['user' => $user]
        );
        //send e-mail
        $message = (new \Swift_Message('Bienvenue sur lesachatsindustriels.com'))
            ->setFrom($this->adherent_email,'Les Achats Industriels')
            ->setTo($user->getEmail())
            ->setBody($body, 'text/html');

        $this->AdherentMailer->send($message);

    }

    //======================================================================
    // DIFFUSER RFQ => Alerter l'Acheteur lorsque la demande est validée
    //======================================================================
    public function alerterAcheteur(DemandeAchat $demande)
    {

        $body = $this->twig->render(
            'email/alerterAcheteur.html.twig', ['demande' => $demande]
        );
        //send e-mail
        $message = (new \Swift_Message('Votre demande est validée | Les Achats Industriels'))
            ->setFrom($this->admin_email,'Les Achats Industriels')
            ->setTo($demande->getAcheteur()->getEmail())
            ->setBody($body, 'text/html');

        $this->AdminMailer->send($message);

    }

    //======================================================================
    // DIFFUSER RFQ => Alerter l'Acheteur lorsque la demande est refusée
    //======================================================================
    public function DemandeRefuserAcheteur(DemandeAchat $demande)
    {

        $body = $this->twig->render(
            'email/RfqRefusee.html.twig', ['demande' => $demande]
        );
        //send e-mail
        $message = (new \Swift_Message('Votre demande est refusée | Les Achats Industriels'))
            ->setFrom($this->admin_email,'Les Achats Industriels')
            ->setTo($demande->getAcheteur()->getEmail())
            ->setBody($body, 'text/html');

        $this->AdminMailer->send($message);

    }


    //======================================================================
    // FOURNISSEURS GAGNE & PERDUE
    //======================================================================

    public function alerterFrsGagner(DemandeAchat $demande)
    {

        $body = $this->twig->render(
            'email/alerterFrsGagne.html.twig', ['demande' => $demande]
        );

        //send e-mail
        $message = (new \Swift_Message('🏆 Félicitation ! vous êtes l\'heureux gagnant de la demande Réf. [ RFQ-'.$demande->getReference().' ]'))
            ->setFrom($this->admin_email,'Les Achats Industriels')
            ->setTo($demande->getFournisseurGagne()->getEmail())
            ->setBody($body, 'text/html');

        $this->AdminMailer->send($message);

    }

    public function alerterFrsPerdue(DemandeAchat $demande,Fournisseur $fournisseur)
    {

        $body = $this->twig->render(
            'email/alerterFrsPerdue.html.twig', ['fournisseur' => $fournisseur,'demande' => $demande]
        );

        //send e-mail
        $message = (new \Swift_Message('Vous avez raté l\'occasion de la demande d\'achat Réf. [ RFQ-'.$demande->getReference().' ]'))
            ->setFrom($this->admin_email,'Les Achats Industriels')
            ->setTo($fournisseur->getEmail())
            ->setBody($body, 'text/html');

        $this->AdminMailer->send($message);

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

        foreach ($demande->getCategories() as $sousSecteur) {
            array_push($ids_sous_secteurs, $sousSecteur->getId());
        }

        $qb = $this->fournisseurRepository->createQueryBuilder('f')
            ->innerJoin('f.categories', 's')
            ->where('s.id in (:sous_secteurs_id)')
            ->andWhere('s.del = 0')
            ->andWhere('f.del = 0')
            ->andWhere('f.isactif = 1');

        if ($demande->getLocalisation() === 2) {
            $qb->andWhere('f.pays = :pays')->setParameter('pays', $demande->getAcheteur()->getPays());
        }

        $qb->setParameter('sous_secteurs_id', $ids_sous_secteurs)
            ->select('f');
        $query = $qb->getQuery();
        $fournisseurs = $query->getResult();

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
                    ->setFrom($this->admin_email,'Les Achats Industriels')
                    ->setTo($fournisseur->getEmail())
                    ->setBody($body, 'text/html');

                if ($demande->getAttachements()) {
                    foreach ($demande->getAttachements() as $item) {
                        $message->attach(\Swift_Attachment::fromPath(ltrim($item->getUrl(), '/')));
                    }
                }
                $this->AdminMailer->send($message);
                $diffusionDemande = new DiffusionDemande();
                $diffusionDemande->setDateDiffusion(new \DateTime());
                $diffusionDemande->setFournisseur($fournisseur);
                $diffusionDemande->setDemande($demande);
                $demande->addDiffusionsdemande($diffusionDemande);
                $nbrshare++;
            }
        }

        $message = (new \Swift_Message('Demande de devis'))
            ->setFrom($this->admin_email,'Les Achats Industriels')
            ->setTo($this->achats_email)
            ->setBody($body, 'text/html');

        if ($demande->getAttachements()) {
            foreach ($demande->getAttachements() as $item) {
                $message->attach(\Swift_Attachment::fromPath(ltrim($item->getUrl(), '/')));
            }
        }

        $this->AdminMailer->send($message);
        $this->entityManager->flush();

    }

    public function alerterFournisseursUpdateExpiration(DemandeAchat $demande,$interval,$etat =1/*1 = Pronlongé , 2 = Ecourté*/,$dateExpiration,$oldDate)
    {



        $ids_sous_secteurs = [];

        foreach ($demande->getCategories() as $sousSecteur) {
            array_push($ids_sous_secteurs, $sousSecteur->getId());
        }
        $qb = $this->fournisseurRepository->createQueryBuilder('f')
            ->innerJoin('f.categories', 's')
            ->where('s.id in (:sous_secteurs_id)')
            ->andWhere('s.del = 0')
            ->andWhere('f.del = 0')
            ->andWhere('f.isactif = 1');
        if ($demande->getLocalisation() === 2) {
            $qb->andWhere('f.pays = :pays')->setParameter('pays', $demande->getAcheteur()->getPays());
        }
        $qb->setParameter('sous_secteurs_id', $ids_sous_secteurs)
            ->select('f');
        $query = $qb->getQuery();
        $fournisseurs = $query->getResult();

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
                $body = $this->twig->render(
                    'email/UpdateExpirationRfs.html.twig', ['oldDate'=>$oldDate,'fournisseur' => $fournisseur,'demande' => $demande,"interval"=>$interval,"etat"=>$etat,"dateExpiration"=>$dateExpiration]
                );

                $message = (new \Swift_Message("Demande de devis Ref.".$demande->getReference()))
                    ->setFrom($this->admin_email,'Les Achats Industriels')
                    ->setTo($fournisseur->getEmail())
                    ->setBody($body, 'text/html');

                if ($demande->getAttachements()) {
                    foreach ($demande->getAttachements() as $item) {
                        $message->attach(\Swift_Attachment::fromPath(ltrim($item->getUrl(), '/')));
                    }
                }
                $this->AdminMailer->send($message);

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
            ->setFrom($this->admin_email,'Les Achats Industriels')
            ->setTo($personnel->getEmail())
            ->setCc($fournisseur->getEmail())
            ->setBody($body, 'text/html');

        if ($demande->getAttachements()) {
            foreach ($demande->getAttachements() as $item) {
                $message->attach(\Swift_Attachment::fromPath(ltrim($item->getUrl(), '/')));
            }
        }

        $this->AdminMailer->send($message);

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
            ->setFrom($this->admin_email,'Les Achats Industriels')
            ->setTo($message->getFournisseur()->getEmail())
            ->setBody($body, 'text/html');

        $this->AdminMailer->send($message);

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
            ->setFrom($this->admin_email,'Les Achats Industriels')
            ->setTo($demandeDevis->getFournisseur()->getEmail())
            ->setBody($body, 'text/html');

        $this->AdminMailer->send($message);

    }

    // Alerter le fournisseur quand son produit et valider par l'admin

    public function alerteFournisseurValidationProduit(Produit $produit)
    {

        $body = $this->twig->render(
            'email/produitValidation.html.twig', ['produit' => $produit]
        );

        $message = (new \Swift_Message('Validation du produit Réf. ' . $produit->getReference()))
            ->setFrom($this->admin_email,'Les Achats Industriels')
            ->setTo($produit->getFournisseur()->getEmail())
            ->setBody($body, 'text/html');

        $this->AdminMailer->send($message);

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
            ->setFrom($this->admin_email,'Les Achats Industriels')
            ->setTo($abonnement->getFournisseur()->getEmail())
            ->setBody($body, 'text/html');

        $this->AdminMailer->send($message);

    }

    // Accusé de reception de la commande d'abonnement

    public function alerteFournisseurAccuseeReception(DemandeAbonnement $demande)
    {

        $body = $this->twig->render(
            'email/receptionDmdAbonnement.html.twig', ['demande' => $demande]
        );

        $message = (new \Swift_Message('Commande Réf. ' . $demande->getReference()))
            ->setFrom($this->admin_email,'Les Achats Industriels')
            ->setTo($demande->getFournisseur()->getEmail())
            ->setBody($body, 'text/html');

        $this->AdminMailer->send($message);

    }

    // Send email notification to Zone & Commercial lors d'une commande offre d'abonnement d'un fournisseur

    public function sendEmailNotification(DemandeAbonnement $demandeAbonnement)
    {

        $body = $this->twig->render(
            'email/notificationAbonnement.html.twig', ['demande' => $demandeAbonnement, 'commercial' => $demandeAbonnement->getCommercial()]
        );


        //send e-mail
        $message = (new \Swift_Message('Commande offre d\'abonnement par fournisseur'))
            ->setFrom($this->admin_email,'Les Achats Industriels')
            ->setTo($demandeAbonnement->getCommercial()->getEmail())
            ->setCc([$demandeAbonnement->getZone()->getEmail(), $this->admin_email])
            ->setBody($body, 'text/html');

        $this->AdminMailer->send($message);

    }

    // Send email notification to Zone  lors d'une commande offre d'abonnement d'un fournisseur

    public function sendEmailNotificationZone(DemandeAbonnement $demandeAbonnement)
    {

        $body = $this->twig->render(
            'email/notificationAbonnement2one.html.twig', ['demande' => $demandeAbonnement, 'commercial' => $demandeAbonnement->getZone()]
        );


        //send e-mail
        $message = (new \Swift_Message('Commande offre d\'abonnement par fournisseur'))
            ->setFrom($this->admin_email,'Les Achats Industriels')
            ->setTo($demandeAbonnement->getZone()->getEmail())
            ->setCc($this->admin_email)
            ->setBody($body, 'text/html');

        $this->AdminMailer->send($message);

    }

    // Send email notification to Admin  lors d'une commande offre d'abonnement d'un fournisseur

    public function sendEmailNotificationAdmin(DemandeAbonnement $demandeAbonnement)
    {

        $body = $this->twig->render(
            'email/notificationAbonnementAdmin.html.twig', ['demande' => $demandeAbonnement]
        );

        //send e-mail
        $message = (new \Swift_Message('Commande offre d\'abonnement par fournisseur'))
            ->setFrom($this->admin_email,'Les Achats Industriels')
            ->setTo($this->admin_email)
            ->setBody($body, 'text/html');

        $this->AdminMailer->send($message);

    }
}