<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 31/10/2019
 * Time: 16:35
 */

namespace App\Controller;


use App\Entity\Abonnement;
use App\Entity\Acheteur;
use App\Entity\ContactFournisseur;
use App\Entity\DemandeAbonnement;
use App\Entity\DemandeAchat;
use App\Entity\DemandeDevis;
use App\Entity\DemandeJeton;
use App\Entity\DetailVisite;
use App\Entity\Fournisseur;
use App\Entity\FournisseurProvisoire;
use App\Entity\Jeton;
use App\Entity\Offre;
use App\Entity\Produit;
use App\Entity\Ville;
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
     * @Route("/fournisseurs-provisoire")
     */
    public function getCountFournisseursProvisoire()
    {

        $result = $this->getDoctrine()->getManager()->getRepository(FournisseurProvisoire::class)->count(['type' => 0]);
        return $this->json($result);

    }

    /**
     * @Route("/fournisseurs-collaps")
     */
    public function getCountFrsCollapse()
    {

        $result = $this->getDoctrine()->getManager()->getRepository(FournisseurProvisoire::class)->count(['type' => 0]);

        $em = $this->getDoctrine()->getManager()->getRepository(Fournisseur::class);
        $ville = $this->getDoctrine()->getManager()->getRepository(Ville::class)->find(113);

        $qb = $em->createQueryBuilder('f')
            ->where('f.ville = :ville OR f.autreCategories IS NOT NULL')
            ->andWhere('f.del = :false')
            ->setParameter('ville', $ville)
            ->setParameter('false', false)
            ->select('count(f.id)');

        $count = $qb->getQuery()->getSingleScalarResult();

        return $this->json($result + $count);


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


    /***
     * ==================================================
     * ==================================================
     *              WIDGETS DASHBOARS
     * ==================================================
     * ==================================================
     */

    /**
     * @Route("/widget1")
     * Chiffre d'affaire abonnement par année + par mois
     */
    public function getWidget1(Request $request)
    {

        $data = $request->query->all();
        // Year
        $year = $data['year'];

        if(!$year){
            return $this->json([]);
        }

        $months = range(1,12);

        $em = $this->getDoctrine()->getManager()->getRepository(Abonnement::class);

        $dataset= [];

        $total = 0;
        foreach($months as $month){   //Loop through each item of the array months

            //Sum price by month in year (request)
            $qb = $em->createQueryBuilder('a')
                ->andWhere('a.statut = :statut')
                ->andWhere('year(a.created) = :year')
                ->andWhere('month(a.created) = :month')
                ->setParameter('statut', 1)
                ->setParameter('year', $year)
                ->setParameter('month', $month)
                ->select('sum(a.prixAdmin)');

            $query = $qb->getQuery();
            $result = $query->getSingleScalarResult();

            //cummul
            $total += (int)$result;

            array_push($dataset, $result ? (int)$result : 0 );
        }




        $data = [
            'value' => $total,
            'dataset' => $dataset
        ];


        return $this->json($data);

    }


    /**
     * @Route("/widget2")
     * Chiffre d'affaire jetons par année + par mois
     */
    public function getWidget2(Request $request)
    {

        $data = $request->query->all();
        // Year
        $year = $data['year'];

        if(!$year){
            return $this->json([]);
        }

        $months = range(1,12);

        $em = $this->getDoctrine()->getManager()->getRepository(Jeton::class);

        $dataset= [];

        $total = 0;
        foreach($months as $month){   //Loop through each item of the array months

            //Sum price by month in year (request)
            $qb = $em->createQueryBuilder('j')
                ->where('j.isPayed = :statut')
                ->andWhere('j.del = :del')
                ->andWhere('year(j.created) = :year')
                ->andWhere('month(j.created) = :month')
                ->setParameter('del', false)
                ->setParameter('statut', 1)
                ->setParameter('year', $year)
                ->setParameter('month', $month)
                ->select('sum(j.prix)');

            $query = $qb->getQuery();
            $result = $query->getSingleScalarResult();

            //cummul
            $total += (int)$result;

            array_push($dataset, $result ? (int)$result : 0 );
        }




        $data = [
            'value' => $total,
            'dataset' => $dataset
        ];


        return $this->json($data);

    }

    /**
     * @Route("/widget3")
     * Nombre pack vendu par année
     */
    public function getWidget3(Request $request)
    {

        $data = $request->query->all();
        // Year
        $year = $data['year'];

        if(!$year){
            return $this->json([]);
        }

        $em = $this->getDoctrine()->getManager()->getRepository(Abonnement::class);
        $packs = $this->getDoctrine()->getManager()->getRepository(Offre::class)->findAll();

        $datasets= [];

        $total = 0;
        $months = range(1,12);

        foreach ($packs as $pack){

            $obj=[];
            $obj['label']= $pack->getName();
            $obj['fill']= 'start';
            $dataset=[];

            foreach($months as $month){   //Loop through each item of the array months
                //Sum price by month in year (request)
                $qb = $em->createQueryBuilder('a')
                    ->where('a.statut = :statut')
                    ->andWhere('a.offre = :offre')
                    ->andWhere('year(a.created) = :year')
                    ->andWhere('month(a.created) = :month')
                    ->setParameter('offre', $pack)
                    ->setParameter('statut', 1)
                    ->setParameter('year', $year)
                    ->setParameter('month', $month)
                    ->select('count(a.id)');

                $query = $qb->getQuery();
                $result = $query->getSingleScalarResult();

                //cummul
                $total += (int)$result;

                array_push($dataset, $result ? (int)$result : 0 );
            }
            $obj['data']= $dataset;

            array_push($datasets, $obj);
        }


        $data = [
            'value' => $total,
            'datasets' => $datasets
        ];


        return $this->json($data);

    }

    /**
     * @Route("/widget4")
     * Fournisseur Par ville
     */
    public function getWidget4()
    {

        $em = $this->getDoctrine()->getManager()->getRepository(Fournisseur::class);

        $data = $em->createQueryBuilder('f')
            ->innerJoin('f.ville', 'v')
            ->where('f.del = :del')
            ->andWhere('f.isactif = :actif')
            ->groupBy('v')
            ->orderBy('count','desc')
            ->addOrderBy('v.name', 'asc')
            ->setParameter('del', false)
            ->setParameter('actif', true)
            ->select('v.name,count(f.id) as count')
            ->getQuery()
            ->getResult();

        return $this->json($data);

    }

    /**
     * @Route("/widget5")
     * Acheteur Par ville
     */
    public function getWidget5()
    {

        $em = $this->getDoctrine()->getManager()->getRepository(Acheteur::class);

        $data = $em->createQueryBuilder('a')
            ->innerJoin('a.ville', 'v')
            ->where('a.del = :del')
            ->andWhere('a.isactif = :actif')
            ->groupBy('v')
            ->orderBy('count','desc')
            ->addOrderBy('v.name', 'asc')
            ->setParameter('del', false)
            ->setParameter('actif', true)
            ->select('v.name,count(a.id) as count')
            ->getQuery()
            ->getResult();

        return $this->json($data);

    }

    /**
     * @Route("/widget6")
     * TOP 10 Fournisseurs plus consultés
     */
    public function getWidget6()
    {

        $em = $this->getDoctrine()->getManager()->getRepository(Fournisseur::class);

        $data = $em->createQueryBuilder('f')
            ->where('f.del = :del')
            ->andWhere('f.isactif = :actif')
            ->orderBy('f.visite','desc')
            ->addOrderBy('f.phone_vu', 'desc')
            ->addOrderBy('f.societe', 'asc')
            ->setParameter('del', false)
            ->setParameter('actif', true)
            ->setMaxResults(10)
            ->select('f.societe,f.visite,f.phone_vu')
            ->getQuery()
            ->getResult();

        return $this->json($data);

    }


    /**
     * @Route("/widget7")
     * Jetons vendus utilisés
     */
    public function getWidget7(Request $request)
    {
        $data = $request->query->all();
        // Year
        $year = $data['year'];

        if(!$year){
            return $this->json([]);
        }


        $em = $this->getDoctrine()->getManager()->getRepository(Jeton::class);
        $em2 = $this->getDoctrine()->getManager()->getRepository(DetailVisite::class);

        $months = range(1,12);

        $datasetVendus= [];
        $datasetUtilises= [];
        $datasets=[];

        $totalVendus = 0;
        $totalUtilises = 0;

        foreach($months as $month){   //Loop through each item of the array months

            // JETONS VENUDS
            $qb = $em->createQueryBuilder('j')
                ->where('j.isPayed = :statut')
                ->andWhere('j.del = :del')
                ->andWhere('year(j.created) = :year')
                ->andWhere('month(j.created) = :month')
                ->setParameter('del', false)
                ->setParameter('statut', 1)
                ->setParameter('year', $year)
                ->setParameter('month', $month)
                ->select('sum(j.nbrJeton)');

            $query = $qb->getQuery();
            $result = $query->getSingleScalarResult();

            //cummul venuds
            $totalVendus += (int)$result;

            array_push($datasetVendus, $result ? (int)$result : 0 );


            // JETONS UTILISES
            $qb = $em2->createQueryBuilder('d')
                ->where('year(d.created) = :year')
                ->andWhere('month(d.created) = :month')
                ->setParameter('year', $year)
                ->setParameter('month', $month)
                ->select('count(d.id)');


            $query = $qb->getQuery();
            $result = $query->getSingleScalarResult();

            //cummul utilise
            $totalUtilises += (int)$result;

            array_push($datasetUtilises, $result ? $result : 0 );


        }




        $vendu['label']='Venud(s)';
        $vendu['fill']='start';
        $vendu['data']=$datasetVendus;
        array_push($datasets, $vendu);

        $utilise['label']='Utilisé(s)';
        $utilise['fill']='start';
        $utilise['data']=$datasetUtilises;
        array_push($datasets, $utilise);

        $data = [
            'totalVendus' => $totalVendus,
            'totalUtilises' => $totalUtilises,
            'datasets' => $datasets
        ];


        return $this->json($data);

    }

    /**
     * @Route("/widget8")
     * Nombre vendus par pack abonnement
     */
    public function getWidget8(Request $request)
    {

        $data = $request->query->all();
        // Year
        $year = $data['year'];

        if(!$year){
            return $this->json([]);
        }

        $em = $this->getDoctrine()->getManager()->getRepository(Abonnement::class);

        $data = $em->createQueryBuilder('a')
            ->innerJoin('a.offre', 'o')
            ->where('a.statut = :statut')
            ->andWhere('year(a.created) = :year')
            ->groupBy('o')
            ->orderBy('count','desc')
            ->setParameter('statut', true)
            ->setParameter('year', $year)
            ->select('o.name,count(a.id) as count')
            ->getQuery()
            ->getResult();

        return $this->json($data);

    }

    /**
     * @Route("/widget8_1")
     * Nombre vendus par pack jeton
     */
    public function getWidget8_1(Request $request)
    {
        $data = $request->query->all();
        // Year
        $year = $data['year'];
        if(!$year){
            return $this->json([]);
        }
        $em = $this->getDoctrine()->getManager()->getRepository(Jeton::class);

        $data = $em->createQueryBuilder('j')
            ->where('j.isPayed = :statut')
            ->andWhere('j.del = :del')
            ->andWhere('year(j.created) = :year')
            ->groupBy('j.nbrJeton')
            ->orderBy('count','desc')
            ->setParameter('del', false)
            ->setParameter('statut', 1)
            ->setParameter('year', $year)
            ->select('j.nbrJeton,count(j.id) as count')
            ->getQuery()
            ->getResult();

        return $this->json($data);

    }


    /**
     * @Route("/widget12")
     *  Acheteur & fournisseur inscrit par mois ( an en paramètre)
     */
    public function getWidget12(Request $request)
    {
        $data = $request->query->all();
        // Year
        $year = $data['year'];

        if(!$year){
            return $this->json([]);
        }


        $em = $this->getDoctrine()->getManager()->getRepository(Fournisseur::class);
        $em2 = $this->getDoctrine()->getManager()->getRepository(Acheteur::class);

        $months = range(1,12);

        $datasetFournisseurs= [];
        $datasetAcheteurs= [];
        $datasets=[];

        $totalFournisseurs = 0;
        $totalAcheteurs = 0;

        foreach($months as $month){   //Loop through each item of the array months

            // Fournisseur inscrit
            $qb = $em->createQueryBuilder('f')
                ->where('year(f.created) = :year')
                ->andWhere('month(f.created) = :month')
                ->setParameter('year', $year)
                ->setParameter('month', $month)
                ->select('count(f.id)');

            $query = $qb->getQuery();
            $result = $query->getSingleScalarResult();

            //cummul frs
            $totalFournisseurs += (int)$result;

            array_push($datasetFournisseurs, $result ? (int)$result : 0 );


            // Acheteur inscrit
            $qb = $em2->createQueryBuilder('a')
                ->where('year(a.created) = :year')
                ->andWhere('month(a.created) = :month')
                ->setParameter('year', $year)
                ->setParameter('month', $month)
                ->select('count(a.id)');


            $query = $qb->getQuery();
            $result = $query->getSingleScalarResult();

            //cummul acheteur
            $totalAcheteurs += (int)$result;

            array_push($datasetAcheteurs, $result ? $result : 0 );


        }




        $vendu['label']='Fournisseur(s)';
        $vendu['fill']='start';
        $vendu['data']=$datasetFournisseurs;
        array_push($datasets, $vendu);

        $utilise['label']='Acheteur(s)';
        $utilise['fill']='start';
        $utilise['data']=$datasetAcheteurs;
        array_push($datasets, $utilise);

        $data = [
            'totalAcheteurs' => $totalAcheteurs,
            'totalFournisseurs' => $totalFournisseurs,
            'datasets' => $datasets
        ];


        return $this->json($data);

    }

    /**
     * @Route("/widget13")
     *  Acheteur & fournisseur inscrit les dernières 10 ans
     */
    public function getWidget13(Request $request)
    {
        $data = $request->query->all();
        // Year
        $year = (int)$data['year'];

        if(!$year){
            return $this->json([]);
        }

        $em = $this->getDoctrine()->getManager()->getRepository(Fournisseur::class);
        $em2 = $this->getDoctrine()->getManager()->getRepository(Acheteur::class);

        $years = range($year-10,$year);

        $datasetFournisseurs= [];
        $datasetAcheteurs= [];
        $datasets=[];

        $totalFournisseurs = 0;
        $totalAcheteurs = 0;

        foreach($years as $year){   //Loop through each item of the array years

            // Fournisseur inscrit
            $qb = $em->createQueryBuilder('f')
                ->where('year(f.created) = :year')
                ->setParameter('year', $year)
                ->select('count(f.id)');

            $query = $qb->getQuery();
            $result = $query->getSingleScalarResult();

            //cummul frs
            $totalFournisseurs += (int)$result;

            array_push($datasetFournisseurs, $result ? (int)$result : 0 );

            // Acheteur inscrit
            $qb = $em2->createQueryBuilder('a')
                ->where('year(a.created) = :year')
                ->setParameter('year', $year)
                ->select('count(a.id)');


            $query = $qb->getQuery();
            $result = $query->getSingleScalarResult();

            //cummul acheteur
            $totalAcheteurs += (int)$result;

            array_push($datasetAcheteurs, $result ? $result : 0 );

        }


        $vendu['label']='Fournisseur(s)';
        $vendu['fill']='start';
        $vendu['data']=$datasetFournisseurs;
        array_push($datasets, $vendu);

        $utilise['label']='Acheteur(s)';
        $utilise['fill']='start';
        $utilise['data']=$datasetAcheteurs;
        array_push($datasets, $utilise);

        $data = [
            'totalAcheteurs' => $totalAcheteurs,
            'totalFournisseurs' => $totalFournisseurs,
            'datasets' => $datasets,
            'years'=>$years
        ];

        return $this->json($data);

    }

}