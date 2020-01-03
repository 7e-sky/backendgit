<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 31/10/2019
 * Time: 16:35
 */

namespace App\Controller;


use App\Entity\DemandeAchat;
use App\Entity\DemandeDevis;
use App\Entity\DemandeJeton;
use App\Entity\Produit;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/api")
 * @IsGranted("ROLE_ADMIN")
 */
class AdminController extends AbstractController
{

    /**
     * @Route("/validation_produits")
     */
    public function getCountProduitsEnAttentes(){

        $em = $this->getDoctrine()->getManager()->getRepository(Produit::class);
        $qb = $em->createQueryBuilder('p')
            ->where('p.isValid = :searchTerm')
            ->andWhere('p.del = 0')
            ->setParameter('searchTerm', 0)
            ->select('count(p.id)');
        $query = $qb->getQuery();

        return $this->json($query->getSingleScalarResult());

    }

    /**
     * @Route("/demandes-admin")
     */
    public function getCountDemandesEnAttentes(){

        $em = $this->getDoctrine()->getManager()->getRepository(DemandeAchat::class);
        $qb = $em->createQueryBuilder('d')
            ->where('d.statut = :searchTerm')
            ->andWhere('d.dateExpiration >= CURRENT_TIMESTAMP()')
            ->andWhere('d.del = 0')
            ->setParameter('searchTerm', 0)
            ->select('count(d.id)');
        $query = $qb->getQuery();

        return $this->json($query->getSingleScalarResult());

    }

    /**
     * @Route("/demandes-devis")
     */
    public function getCountDemandesDevisEnAttentes(){

        $em = $this->getDoctrine()->getManager()->getRepository(DemandeDevis::class);
        $qb = $em->createQueryBuilder('d')
            ->where('d.statut = :searchTerm')
            ->andWhere('d.del = 0')
            ->setParameter('searchTerm', 0)
            ->select('count(d.id)');
        $query = $qb->getQuery();

        return $this->json($query->getSingleScalarResult());

    }

    /**
     * @Route("/example-component")
     */
    public function getCountDemandesEnCours(){

        $em = $this->getDoctrine()->getManager()->getRepository(DemandeAchat::class);
        $qb = $em->createQueryBuilder('d')
            ->where('d.statut = :searchTerm')
            ->andWhere('d.dateExpiration >= CURRENT_TIMESTAMP()')
            ->setParameter('searchTerm', 1)
            ->select('count(d.id)');
        $query = $qb->getQuery();

        return $this->json($query->getSingleScalarResult());

    }


    /**
     * @Route("/commandes-jetons")
     */
    public function getCountCommandeJetonEnAttente(){

        $em = $this->getDoctrine()->getManager()->getRepository(DemandeJeton::class);
        $qb = $em->createQueryBuilder('d')
            ->where('d.isUse = :searchTerm')
            ->setParameter('searchTerm', 0)
            ->select('count(d.id)');
        $query = $qb->getQuery();

        return $this->json($query->getSingleScalarResult());

    }


    /**
     * @Route("/abonnement-fournisseur")
     */
    public function getCountAbonnementFournisseurs(){

        $em = $this->getDoctrine()->getManager()->getRepository(DemandeJeton::class);
        $qb = $em->createQueryBuilder('d')
            ->where('d.isUse = :searchTerm')
            ->setParameter('searchTerm', 0)
            ->select('count(d.id)');
        $query = $qb->getQuery();

        return $this->json($query->getSingleScalarResult());

    }


}