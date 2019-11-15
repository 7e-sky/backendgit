<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 29/07/2019
 * Time: 11:55
 */

namespace App\Email;


use App\Entity\DemandeAchat;
use App\Entity\DiffusionDemande;
use App\Entity\User;
use App\Repository\AcheteurRepository;
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

    public function alerterFournisseurs(DemandeAchat $demande){

        $body = $this->twig->render(
            'email/alertClients.html.twig',['demande'=>$demande]
        );

        $ids_sous_secteurs = [];

        foreach ($demande->getSousSecteurs() as $sousSecteur){
            array_push($ids_sous_secteurs,$sousSecteur->getId());
        }
        $fournisseurs = $this->fournisseurRepository->createQueryBuilder('f')
            ->innerJoin('f.sousSecteurs','s')
            ->where('s.id in (:sous_secteurs_id)')
            ->andWhere('s.del = 0')
            ->andWhere('f.del = 0')
            ->andWhere('f.isactif = 1')
            ->select('f')
            ->setParameter('sous_secteurs_id', $ids_sous_secteurs)
            ->getQuery()
            ->getResult();


        $fournisseurs_blacklists = $this->blackListesRepository->createQueryBuilder('b')
            ->where('b.acheteur = :acheteur')
            ->select('b')
            ->setParameter('acheteur', $demande->getAcheteur())
            ->getQuery()
            ->getResult();


        $nbrshare = 0;
        foreach ($fournisseurs as $fournisseur){

            $trouve = false;
            foreach ($fournisseurs_blacklists as $blacklist){
                if($blacklist->getFournisseur() == $fournisseur){
                    $trouve=true;
                    break;
                }
            }

            if(!$trouve){
                $message = ( new \Swift_Message('Demande de devis'))
                    ->setFrom('youness.arbouh1@gmail.com')
                    ->setTo($fournisseur->getEmail())
                    ->setBody($body, 'text/html');
                $this->mailer->send($message);

                $diffusionDemande = new DiffusionDemande();
                $diffusionDemande->setDateDiffusion(new \DateTime());
                $diffusionDemande->setFournisseur($fournisseur);
                $diffusionDemande->setDemande($demande);
                $demande->addDiffusionsdemande($diffusionDemande);
                $nbrshare++;

            }

        }
        //return $nbrshare;

    }

}