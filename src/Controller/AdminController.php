<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 31/10/2019
 * Time: 16:35
 */

namespace App\Controller;


use App\Entity\ContactFournisseur;
use App\Entity\DemandeAbonnement;
use App\Entity\DemandeAchat;
use App\Entity\DemandeDevis;
use App\Entity\DemandeJeton;
use App\Entity\Produit;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

/**
 * @Route("/api")
 * @IsGranted("ROLE_ADMIN")
 */
class AdminController extends AbstractController
{

    /**
     * @Route("/fournisseurselected")
     */
    public function GetAllFournisseurPublierProduit()
    {

        $em = $this->getDoctrine()->getManager()->getRepository(Produit::class);
        $qb = $em->createQueryBuilder('p')
            ->innerJoin('p.fournisseur', 'f')
            ->groupBy('p.fournisseur')
            ->select('f.id,f.societe');
        $query = $qb->getQuery();

        return $this->json($query->getResult());

    }

    /**
     * @Route("/fournisseurcategories")
     */
    public function GetAllCategorieByFournisseur(Request $request)
    {

        $data = $request->query->all();
        // id
        $id = $data['id'];


        $em = $this->getDoctrine()->getManager()->getRepository(Produit::class);
        $qb = $em->createQueryBuilder('p')
            ->innerJoin('p.categorie', 'c')
            ->innerJoin('p.fournisseur', 'f')
            ->where('f.id  = :searchTerm')
            ->groupBy('p.categorie')
            ->setParameter('searchTerm', $id)
            ->select('c.id,c.name');
        $query = $qb->getQuery();

        return $this->json($query->getResult());

    }


    /**
     * @Route("/validation_produits")
     */
    public function getCountProduitsEnAttentes()
    {

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
    public function getCountDemandesEnAttentes()
    {

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
    public function getCountDemandesDevisEnAttentes()
    {

        $result = $this->getDoctrine()->getManager()->getRepository(DemandeDevis::class)->count(['del' => false, 'statut' => false, "isRead" => false]);
        return $this->json($result);
    }

    /**
     * @Route("/message-fournisseur")
     */
    public function getCountMessageNonVu()
    {
        $result = $this->getDoctrine()->getManager()->getRepository(ContactFournisseur::class)->count(['del' => false, 'statut' => false, "isRead" => false]);
        return $this->json($result);

    }

    /**
     * @Route("/example-component")
     */
    public function getCountDemandesEnCours()
    {

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
    public function getCountCommandeJetonEnAttente()
    {

        $em = $this->getDoctrine()->getManager()->getRepository(DemandeJeton::class);
        $qb = $em->createQueryBuilder('d')
            ->where('d.isUse = :searchTerm')
            ->setParameter('searchTerm', 0)
            ->select('count(d.id)');
        $query = $qb->getQuery();

        return $this->json($query->getSingleScalarResult());

    }

    /**
     * @Route("/commandes-abonnements")
     */
    public function getCountCommandeAbonnementEnAttente()
    {

        $em = $this->getDoctrine()->getManager()->getRepository(DemandeAbonnement::class);
        $qb = $em->createQueryBuilder('d')
            ->where('d.statut = :searchTerm')
            ->setParameter('searchTerm', 0)
            ->select('count(d.id)');
        $query = $qb->getQuery();

        return $this->json($query->getSingleScalarResult());

    }

    /**
     * @Route("/abonnement-fournisseur")
     */
    public function getCountAbonnementFournisseurs()
    {

        $em = $this->getDoctrine()->getManager()->getRepository(DemandeJeton::class);
        $qb = $em->createQueryBuilder('d')
            ->where('d.isUse = :searchTerm')
            ->setParameter('searchTerm', 0)
            ->select('count(d.id)');
        $query = $qb->getQuery();
        $demadeJetons = $query->getSingleScalarResult();

        $em = $this->getDoctrine()->getManager()->getRepository(DemandeAbonnement::class);
        $qb = $em->createQueryBuilder('d')
            ->where('d.statut = :searchTerm')
            ->setParameter('searchTerm', 0)
            ->select('count(d.id)');
        $query = $qb->getQuery();
        $demadeAbonnement = $query->getSingleScalarResult();

        return $this->json($demadeJetons + $demadeAbonnement);

    }


}