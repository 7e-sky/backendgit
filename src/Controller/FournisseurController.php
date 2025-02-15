<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 31/10/2019
 * Time: 16:35
 */

namespace App\Controller;


use App\Entity\Abonnement;
use App\Entity\ContactFournisseur;
use App\Entity\DemandeAchat;
use App\Entity\DemandeDevis;
use App\Entity\DetailVisite;
use App\Entity\Fournisseur;
use App\Entity\FournisseurProvisoire;
use App\Entity\Jeton;
use App\Entity\Personnel;
use App\Entity\Produit;
use App\Entity\Ville;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\HttpFoundation\Request;

/**
 * @Route("/api")
 * @IsGranted("ROLE_FOURNISSEUR")
 */
class FournisseurController extends AbstractController
{

    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;

    public function __construct(TokenStorageInterface $tokenStorage)
    {

        $this->tokenStorage = $tokenStorage;
    }

    /**
     * @Route("/abonnement/founrisseur")
     */
    public function getAbonnementByFournisseur()
    {

        /**
         * @var UserInterface $fournisseur
         */
        $fournisseur = $this->tokenStorage->getToken()->getUser();
        $repoAbonnement = $this->getDoctrine()->getManager()->getRepository(Abonnement::class);

        if ($fournisseur instanceof Fournisseur) {
            $abonnement = $repoAbonnement->findBy(['fournisseur' => $fournisseur], ['expired' => 'desc'], 1);
            return $this->json($abonnement);
        }

        return null;


    }

    /**
     * @Route("/fournisseurs-tentatives")
     */
    public function getCountFournisseursProvisoire()
    {

        /**
         * @var UserInterface $fournisseur
         */
        $fournisseur = $this->tokenStorage->getToken()->getUser();
        if ($fournisseur instanceof Fournisseur) {

            $result = $this->getDoctrine()->getManager()->getRepository(FournisseurProvisoire::class)->count(['type' => 0, 'fournisseurParent' => $fournisseur]);

            return $this->json($result);
        }

        return null;

    }

    /**
     * @Route("/fournisseurs-admin")
     */
    public function getCountAutreVilleAcount()
    {

        $em = $this->getDoctrine()->getManager()->getRepository(Fournisseur::class);
        $ville = $this->getDoctrine()->getManager()->getRepository(Ville::class)->find(113);

        $qb = $em->createQueryBuilder('f')
            ->where('f.ville = :ville OR f.autreCategories IS NOT NULL')
            ->andWhere('f.del = :false')
            ->setParameter('ville', $ville)
            ->setParameter('false', false)
            ->select('count(f.id)');

        $count = $qb->getQuery()->getSingleScalarResult();
        return $this->json($count);

    }


    /**
     * @Route("/check_activite_used")
     */
    public function checkIfActiviteIsUsedByCollegue(Request $request)
    {

        /**
         * @var Fournisseur $fournisseur
         */
        $fournisseur = $this->tokenStorage->getToken()->getUser();

        $data = $request->query->all();
        // Activite
        $activite = $data['activite'];

        $em = $this->getDoctrine()->getManager()->getRepository(Produit::class);
        $qb = $em->createQueryBuilder('p')
            ->innerJoin('p.fournisseur', 'f')
            ->where('f.id <> :current AND p.sousSecteurs = :activite and p.del = :false')
            ->setParameter('current', $fournisseur->getId())
            ->setParameter('false', false)
            ->setParameter('activite', $activite);

        if (is_null($fournisseur->getParent()) ) {
            $qb->andWhere('f.parent = :parent')
                ->setParameter('parent', $fournisseur->getId());
        } else {
            $qb->andWhere('f.id = :parent OR (f.parent = :parent)')
                ->setParameter('parent', $fournisseur->getParent());
        }

        $qb->select('count(p.id)');
        $query = $qb->getQuery()->getSingleScalarResult();
        return $this->json(['exist'=>$query ? true : false]);


    }

    /**
     * @Route("/free-products")
     */
    public function getFreeProduits()
    {

        /**
         * @var Fournisseur $fournisseur
         */
        $fournisseur = $this->tokenStorage->getToken()->getUser();

        $em = $this->getDoctrine()->getManager()->getRepository(Produit::class);

        $qb = $em->createQueryBuilder('p')
            ->innerJoin('p.fournisseur', 'f')
            ->innerJoin('p.images', 'm')
            ->where('p.del = :del AND p.free= :free')
            ->setParameter('del', false)
            ->setParameter('free', true);

        if ($fournisseur->getParent()) {
            $qb->andWhere('f.id = :f1 or f.id = :f2')
                ->setParameter('f1', $fournisseur->getId())
                ->setParameter('f2', $fournisseur->getParent()->getId());
        } else {
            $qb->andWhere('f.id = :f1 or f.parent = :f1')
                ->setParameter('f1', $fournisseur->getId());
        }

        $qb->select('count(m.id)');
        $query = $qb->getQuery()->getSingleScalarResult();
        return $this->json($query);


    }

    /**
     * @Route("/messages")
     */
    public function getCountMessageNonVu()
    {

        /**
         * @var UserInterface $fournisseur
         */
        $fournisseur = $this->tokenStorage->getToken()->getUser();

        $result = $this->getDoctrine()->getManager()->getRepository(ContactFournisseur::class)
            ->count(['del' => false, 'statut' => true, "fournisseur" => $fournisseur, "isRead" => false]);

        return $this->json($result);


    }

    /**
     * @Route("/product-devis")
     */
    public function getCountDemandesDevisEnCours()
    {

        /**
         * @var UserInterface $fournisseur
         */
        $fournisseur = $this->tokenStorage->getToken()->getUser();

        $result = $this->getDoctrine()->getManager()->getRepository(DemandeDevis::class)->count(['del' => false, 'statut' => true, "fournisseur" => $fournisseur, "isRead" => false]);


        return $this->json($result);


    }

    /**
     * @Route("/demandes_prix")
     */
    public function getCountDemandesEnCours()
    {

        /**
         * @var UserInterface $fournisseur
         */
        $fournisseur = $this->tokenStorage->getToken()->getUser();
        $em = $this->getDoctrine()->getManager()->getRepository(DemandeAchat::class);
        if ($fournisseur instanceof Fournisseur) {

            $categories = $fournisseur->getCategories();
            $categories_id = [];
            foreach ($categories as $categorie) {
                if ($categorie)
                    array_push($categories_id, $categorie->getId());
            }
            if (!empty($categories_id)) {

                $qb = $em->createQueryBuilder('d')
                    ->innerJoin('d.categories', 's')
                    ->innerJoin('d.acheteur', 'a')
                    ->where('s.id in (:categories_id)')
                    ->andWhere('d.statut = 1')
                    ->andWhere('d.localisation = 1 OR ( d.localisation = 2 AND a.pays = :pays) OR ( d.localisation = 3 AND a.pays <> :pays)')
                    ->andWhere('d.dateExpiration >= CURRENT_TIMESTAMP()')
                    ->andWhere('d.del = 0')
                    ->setParameter('categories_id', $categories_id)
                    ->setParameter('pays', $fournisseur->getPays())
                    ->select('d');
                $query = $qb->getQuery()->getResult();


                $count = 0;
                foreach ($query as $demande) {
                    if ($demande->getHistoriques()) {
                        $trouve = false;
                        foreach ($demande->getHistoriques() as $historique) {
                            if ($historique->getFournisseur() == $fournisseur)
                                $trouve = true;
                        }
                        if (!$trouve) {
                            $count++;
                        }
                    } else {
                        $count++;
                    }
                }
                return $this->json($count);

            }

        }

        return $this->json(0);


    }

    /**
     * @Route("/jetons/founrisseur")
     */
    public function getJetonsByFournisseur()
    {

        /**
         * @var UserInterface $fournisseur
         */
        $fournisseur = $this->tokenStorage->getToken()->getUser();
        $repoJeton = $this->getDoctrine()->getManager()->getRepository(Jeton::class);
        $repoVisite = $this->getDoctrine()->getManager()->getRepository(DetailVisite::class);
        if ($fournisseur instanceof Fournisseur) {

            $qb = $repoJeton->createQueryBuilder('j')
                ->where('j.isPayed = true')
                ->andWhere('j.del = 0')
                ->andWhere('j.fournisseur = :founrisseur')
                ->setParameter('founrisseur', $fournisseur)
                ->select('sum(j.nbrJeton)');
            $query = $qb->getQuery();

            $sommeJetons = $query->getSingleScalarResult();


            $qb = $repoVisite->createQueryBuilder('v')
                ->where('v.fournisseur = :founrisseur')
                ->setParameter('founrisseur', $fournisseur)
                ->select('count(v.id)');
            $query = $qb->getQuery();

            $countVisite = $query->getSingleScalarResult();

            $result = $sommeJetons - $countVisite;

            return $this->json($result);
        }

        return $this->json(0);


    }

    /**
     * @Route("/fournisseur/widgets")
     */
    public function getFournisseurWidgets()
    {

        if ($this->tokenStorage->getToken() instanceof TokenInterface) {

            $user = $this->tokenStorage->getToken()->getUser();

            $em = $this->getDoctrine()->getManager()->getRepository(Produit::class);
            $em2 = $this->getDoctrine()->getManager()->getRepository(DemandeAchat::class);
            $em3 = $this->getDoctrine()->getManager()->getRepository(DetailVisite::class);

            //ProduitsEn attentes
            $qb = $em->createQueryBuilder('p')
                ->where('p.isValid = :searchTerm')
                ->andWhere('p.del = 0')
                ->andWhere('p.fournisseur = :fournisseur')
                ->setParameter('searchTerm', 0)
                ->setParameter('fournisseur', $user)
                ->select('count(p.id)');
            $query = $qb->getQuery();
            $produit_en_attentes = $query->getSingleScalarResult();

            //Produits publiés
            $qb = $em->createQueryBuilder('p')
                ->where('p.isValid = :searchTerm')
                ->andWhere('p.del = 0')
                ->andWhere('p.fournisseur = :fournisseur')
                ->setParameter('searchTerm', 1)
                ->setParameter('fournisseur', $user)
                ->select('count(p.id)');
            $query = $qb->getQuery();
            $produit_en_cours = $query->getSingleScalarResult();


            //Demandes en cours
            $caregories = $user->getCategories();
            $caregorie_id = [];
            $demande_encours = 0;
            foreach ($caregories as $caregorie) {
                if ($caregorie)
                    array_push($caregorie_id, $caregorie->getId());
            }
            if (!empty($caregorie_id)) {

                $qb = $em2->createQueryBuilder('d')
                    ->innerJoin('d.categories', 's')
                    ->innerJoin('d.acheteur', 'a')
                    ->where('s.id in (:caregorie_id)')
                    ->andWhere('d.statut = :searchTerm')
                    ->andWhere('d.dateExpiration >= CURRENT_TIMESTAMP()')
                    ->andWhere('d.del = 0')
                    ->andWhere('d.localisation = 1 OR ( d.localisation = 2 AND a.pays = :pays) OR ( d.localisation = 3 AND a.pays <> :pays)')
                    ->andWhere('d.dateExpiration >= CURRENT_TIMESTAMP()')
                    ->andWhere('d.del = 0')
                    ->setParameter('searchTerm', 1)
                    ->setParameter('caregorie_id', $caregorie_id)
                    ->setParameter('pays', $user->getPays())
                    ->select('d');
                $query = $qb->getQuery()->getResult();

                $demande_encours = count($query);

            }

            //Demandes visite
            $qb = $em3->createQueryBuilder('d')
                ->where('d.fournisseur = :fournisseur')
                ->andWhere('year(d.created) >= YEAR(NOW())')
                ->setParameter('fournisseur', $user)
                ->select('count(d.id)');
            $query = $qb->getQuery();

            $demande_visite = $query->getSingleScalarResult();

            $data = [
                'widget1' => $demande_encours,
                'widget2' => $demande_visite,
                'widget3' => $produit_en_attentes,
                'widget4' => $produit_en_cours,

            ];

        } else {
            $data = [
                'widget1' => 0,
                'widget2' => 0,
                'widget3' => 0,
                'widget4' => 0,
            ];
        }

        return $this->json($data);

    }

    /**
     * @Route("/fournisseur/doughnut")
     */
    public function getDemandesBudgetsParAnnee(Request $request)
    {

        if ($this->tokenStorage->getToken() instanceof TokenInterface) {

            $data = $request->query->all();

            // Year
            $year = $data['year'];

            $user = $this->tokenStorage->getToken()->getUser();

            $em = $this->getDoctrine()->getManager()->getRepository(DetailVisite::class);

            //Nombre demande visitée en cours
            $qb = $em->createQueryBuilder('d')
                ->where('d.fournisseur = :fournisseur')
                ->andWhere('year(d.created) = :year')
                ->andWhere('d.statut = 0')
                ->setParameter('fournisseur', $user)
                ->setParameter('year', $year)
                ->select('count(d.id)');
            $query = $qb->getQuery();
            $demande_cours = $query->getSingleScalarResult();

            //Nombre demande visitée gagner
            $qb = $em->createQueryBuilder('d')
                ->where('d.fournisseur = :fournisseur')
                ->andWhere('year(d.created) = :year')
                ->andWhere('d.statut = 1')
                ->setParameter('fournisseur', $user)
                ->setParameter('year', $year)
                ->select('count(d.id)');
            $query = $qb->getQuery();
            $demande_gagner = $query->getSingleScalarResult();

            //Nombre demande visitée perdue
            $qb = $em->createQueryBuilder('d')
                ->where('d.fournisseur = :fournisseur')
                ->andWhere('year(d.created) = :year')
                ->andWhere('d.statut = 2')
                ->setParameter('fournisseur', $user)
                ->setParameter('year', $year)
                ->select('count(d.id)');
            $query = $qb->getQuery();
            $demande_visite = $query->getSingleScalarResult();


            $data = [
                'labels' => ['En cours', 'Gagnée', 'Perdue'],
                'datasets' => [
                    [
                        'data' => [$demande_cours, $demande_gagner, $demande_visite],
                        'backgroundColor' => [
                            '#f57c00',
                            '#388e3c',
                            '#f44336'
                        ],
                        'hoverBackgroundColor' => [
                            '#ffa726',
                            '#66bb6a',
                            '#f45a4d',
                        ]
                    ]

                ]
            ];


        } else {
            $data = 0;
        }

        return $this->json($data);

    }

    function random_color_part()
    {
        return str_pad(dechex(mt_rand(0, 255)), 2, '0', STR_PAD_LEFT);
    }

    function random_color()
    {
        return $this->random_color_part() . $this->random_color_part() . $this->random_color_part();
    }

    /**
     * Demande devis par produits
     * @Route("/fournisseur/demandeDevisByProduct")
     */
    public function getDemandesDevisByProduct(Request $request)
    {

        if ($this->tokenStorage->getToken() instanceof TokenInterface) {

            $user = $this->tokenStorage->getToken()->getUser();
            $em = $this->getDoctrine()->getManager()->getRepository(Produit::class);
            $products = $em->findBy(['fournisseur' => $user, "del" => 0, "isValid" => 1]);

            $em2 = $this->getDoctrine()->getManager()->getRepository(DemandeDevis::class);

            $dataDevis = [];
            $labels = [];
            $colors = [];
            $rand = array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f');
            foreach ($products as $produit) {
                $count = $em2->count(['produit' => $produit]);
                if ($count) {
                    array_push($dataDevis, $count);
                    array_push($labels, $produit->getReference());
                    $color = '#' . $rand[rand(0, 15)] . $rand[rand(0, 15)] . $rand[rand(0, 15)] . $rand[rand(0, 15)] . $rand[rand(0, 15)] . $rand[rand(0, 15)];
                    array_push($colors, $color);
                }


            }

            $data = [
                'labels' => $labels,
                'datasets' => [
                    [
                        'data' => $dataDevis,
                        'backgroundColor' => $colors,

                    ]

                ]
            ];


        } else {
            $data = 0;
        }

        return $this->json($data);

    }

    /**
     * @Route("/fournisseur/topbudget")
     */
    public function getTopBudgetGagnerParAnnee(Request $request)
    {

        if ($this->tokenStorage->getToken() instanceof TokenInterface) {

            $data = $request->query->all();

            // Year
            $year = $data['year'];

            $user = $this->tokenStorage->getToken()->getUser();

            $em = $this->getDoctrine()->getManager()->getRepository(DetailVisite::class);

            //Sum budget
            $qb = $em->createQueryBuilder('d')
                ->where('d.statut = :searchTerm')
                ->andWhere('d.fournisseur = :fournisseur')
                ->andWhere('year(d.created) = :year')
                ->setParameter('searchTerm', 1)
                ->setParameter('fournisseur', $user)
                ->setParameter('year', $year)
                ->select('max(d.budget)');
            $query = $qb->getQuery();
            $budget = $query->getSingleScalarResult();


            $data = $budget ? $budget : 0;


        } else {
            $data = 0;
        }

        return $this->json($data);

    }

    /**
     * @Route("/fournisseur/potentiel")
     */
    public function getPotentielBudgetParAnnee(Request $request)
    {

        if ($this->tokenStorage->getToken() instanceof TokenInterface) {

            $data = $request->query->all();

            // Year
            $year = $data['year'];

            $user = $this->tokenStorage->getToken()->getUser();

            $em = $this->getDoctrine()->getManager()->getRepository(DetailVisite::class);

            //Main widget
            $widget8 = [];

            //Gagner array init
            $gagner = [];
            $gagner['title'] = "Demandes gagnées";

            //Perdue array init
            $perdue = [];
            $perdue['title'] = "Demandes perdues";

            $data_gagner = [];
            $data_perdue = [];


            $sommeGagnerBudger = 0;
            $sommePerdueBudger = 0;


            for ($i = 1; $i <= 12; $i++) {


                $qb = $em->createQueryBuilder('d')
                    ->where('d.statut = :searchTerm')
                    ->andWhere('d.fournisseur = :fournisseur')
                    ->andWhere('year(d.created) = :year')
                    ->andWhere('month(d.created) = :month')
                    ->setParameter('searchTerm', 1)
                    ->setParameter('fournisseur', $user)
                    ->setParameter('year', $year)
                    ->setParameter('month', $i)
                    ->select('sum(d.budget)');
                $query = $qb->getQuery();

                $budget = $query->getSingleScalarResult();
                $budget = $budget ? $budget : 0;
                $sommeGagnerBudger += $budget;
                array_push($data_gagner, $budget);


                $qb = $em->createQueryBuilder('d')
                    ->where('d.statut = :searchTerm')
                    ->andWhere('d.fournisseur = :fournisseur')
                    ->andWhere('year(d.created) = :year')
                    ->andWhere('month(d.created) = :month')
                    ->setParameter('searchTerm', 2)
                    ->setParameter('fournisseur', $user)
                    ->setParameter('year', $year)
                    ->setParameter('month', $i)
                    ->select('sum(d.budget)');
                $query = $qb->getQuery();

                $budget = $query->getSingleScalarResult();
                $budget = $budget ? $budget : 0;
                $sommePerdueBudger += $budget;
                array_push($data_perdue, $budget);

            }

            $datasets['fill'] = true;
            $datasets['backgroundColor'] = '#42BFF7';
            $datasets['pointRadius'] = 0;
            $datasets['pointHitRadius'] = 20;
            $datasets['borderWidth'] = 20;

            $gagner['somme'] = $sommeGagnerBudger;
            $datasets['data'] = $data_gagner;
            $gagner['datasets'] = [$datasets];

            $perdue['somme'] = $sommePerdueBudger;
            $datasets['data'] = $data_perdue;
            $perdue['datasets'] = [$datasets];

            $widget8['gagner'] = $gagner;
            $widget8['perdue'] = $perdue;
            $widget8['total'] = $sommeGagnerBudger + $sommePerdueBudger;

            $data = $widget8;


        } else {
            $data = 0;
        }

        return $this->json($data);

    }


    /**
     * @Route("/fournisseur/personnelsRank")
     */
    public function getPersonnelPotentielsParAnnee(Request $request)
    {

        if ($this->tokenStorage->getToken() instanceof TokenInterface) {

            $data = $request->query->all();

            // Year
            $year = $data['year'];

            $user = $this->tokenStorage->getToken()->getUser();
            $personnels = $this->getDoctrine()->getManager()->getRepository(Personnel::class)
                ->findBy(['fournisseur' => $user, 'del' => 0]);
            $em = $this->getDoctrine()->getManager()->getRepository(DetailVisite::class);


            $data = [];
            $personnelDatas = [];
            foreach ($personnels as $personnel) {

                $personnelDatas['personnel'] = $personnel;
                //Get count & sum demande affecté
                $qb = $em->createQueryBuilder('d')
                    ->where('d.fournisseur = :fournisseur')
                    ->andWhere('d.personnel = :personnel')
                    ->andWhere('year(d.created) = :year')
                    ->setParameter('fournisseur', $user)
                    ->setParameter('personnel', $personnel)
                    ->setParameter('year', $year)
                    ->select('count(d.id) as count,sum(d.budget) as budget');
                $query = $qb->getQuery();
                $result = $query->getOneOrNullResult();
                $personnelDatas['demandeAffecte'] = $result;

                //Get count & sum demande gagner
                $qb = $em->createQueryBuilder('d')
                    ->where('d.statut = :searchTerm')
                    ->andWhere('d.fournisseur = :fournisseur')
                    ->andWhere('d.personnel = :personnel')
                    ->andWhere('year(d.created) = :year')
                    ->setParameter('searchTerm', 1)
                    ->setParameter('fournisseur', $user)
                    ->setParameter('personnel', $personnel)
                    ->setParameter('year', $year)
                    ->select('count(d.id) as count,sum(d.budget) as budget');
                $query = $qb->getQuery();
                $result = $query->getOneOrNullResult();
                $personnelDatas['demandeGagner'] = $result;


                //Get count & sum demande perdue
                $qb = $em->createQueryBuilder('d')
                    ->where('d.statut = :searchTerm')
                    ->andWhere('d.fournisseur = :fournisseur')
                    ->andWhere('d.personnel = :personnel')
                    ->andWhere('year(d.created) = :year')
                    ->setParameter('searchTerm', 2)
                    ->setParameter('fournisseur', $user)
                    ->setParameter('personnel', $personnel)
                    ->setParameter('year', $year)
                    ->select('count(d.id) as count,sum(d.budget) as budget');
                $query = $qb->getQuery();
                $result = $query->getOneOrNullResult();
                $personnelDatas['demandePerdue'] = $result;

                $budget_gagner_par_mois = [];
                $potentiel_par_mois = [];

                for ($i = 1; $i <= 12; $i++) {

                    //Budget Gagnée
                    $qb = $em->createQueryBuilder('d')
                        ->where('d.statut = :searchTerm')
                        ->andWhere('d.fournisseur = :fournisseur')
                        ->andWhere('d.personnel = :personnel')
                        ->andWhere('year(d.created) = :year')
                        ->andWhere('month(d.created) = :month')
                        ->setParameter('searchTerm', 1)
                        ->setParameter('fournisseur', $user)
                        ->setParameter('personnel', $personnel)
                        ->setParameter('year', $year)
                        ->setParameter('month', $i)
                        ->select('sum(d.budget)');
                    $query = $qb->getQuery();
                    $result = $query->getSingleScalarResult();
                    $result = $result ? $result : 0;
                    array_push($budget_gagner_par_mois, $result);

                    //Potentiel
                    $qb = $em->createQueryBuilder('d')
                        ->where('d.fournisseur = :fournisseur')
                        ->andWhere('d.personnel = :personnel')
                        ->andWhere('year(d.created) = :year')
                        ->andWhere('month(d.created) = :month')
                        ->setParameter('fournisseur', $user)
                        ->setParameter('personnel', $personnel)
                        ->setParameter('year', $year)
                        ->setParameter('month', $i)
                        ->select('sum(d.budget)');
                    $query = $qb->getQuery();
                    $result = $query->getSingleScalarResult();
                    $result = $result ? $result : 0;

                    array_push($potentiel_par_mois, $result);
                }
                $personnelDatas['gagnerParMois'] = $budget_gagner_par_mois;
                $personnelDatas['potentielParMois'] = $potentiel_par_mois;

                array_push($data, $personnelDatas);

            }


        } else {
            $data = [];
        }

        return $this->json($data);

    }


}