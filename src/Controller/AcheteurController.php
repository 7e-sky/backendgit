<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 31/10/2019
 * Time: 16:35
 */

namespace App\Controller;


use App\Entity\Acheteur;
use App\Entity\DemandeAchat;
use App\Entity\Team;
use App\Entity\AcheteurProvisoire;  
use App\Entity\BlackListes; 
use App\Entity\Ville;
use App\Repository\DetailVisiteRepository;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\HttpFoundation\Request;
use Psr\Log\LoggerInterface;
use App\Email\Mailer;

/**
 * @Route("/api")
 * @IsGranted("ROLE_ACHETEUR")
 */
class AcheteurController extends AbstractController
{


    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;
    /**
     * @var DetailVisiteRepository
     */
    private $visiteRepository;
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;
    /**
     * @var Mailer
     */
    private $mailer;

     /**
     * @var Logger
     */
    private $logger;

    public function __construct(
        TokenStorageInterface $tokenStorage,
        DetailVisiteRepository $visiteRepository,
        EntityManagerInterface $entityManager,
        Mailer $mailer,
        LoggerInterface $logger
    ) {
        $this->tokenStorage = $tokenStorage;
        $this->visiteRepository = $visiteRepository;
        $this->entityManager = $entityManager;
        $this->mailer = $mailer;
        $this->logger = $logger;
    }

    /**
     * @Route("/demande_achats/{demande_achat}/fournisseur_gagne",methods={"POST"})
     */
    public function saveFournisseurGagne(DemandeAchat $demande_achat, Request $request)
    {

        $data = json_decode($request->getContent(), true);

        if ($data  && $demande_achat) {
            $visites = $this->visiteRepository->findBy(['demande' => $demande_achat]);
            foreach ($visites as $visite) {
                if ($visite){
                    if ($visite->getFournisseur()->getId() == $data['id_fournisseur']) {
                        //Set fournisseur gangé
                        $visite->setStatut(1);
                        $demande_achat->setFournisseurGagne($visite->getFournisseur());
                        $this->mailer->alerterFrsGagner($demande_achat);
                    }else{
                        //Set fournisseur perdu
                        $visite->setStatut(2);
                        $this->mailer->alerterFrsPerdue($demande_achat,$visite->getFournisseur());

                    }
                }
            }
        }

        if($demande_achat){
            //Set demande Adjuger
            $demande_achat->setStatut(3);
            $this->entityManager->flush();
        }

        return $this->json($demande_achat);
    }


    /**
     * @Route("/acheteur-admin")
     */
    public function getCountAutreVilleAcount()
    {


        $ville = $this->getDoctrine()->getManager()->getRepository(Ville::class)->find(113);

        $result = $this->getDoctrine()->getManager()->getRepository(Acheteur::class)->count(['del' => false, 'ville' => $ville]);

        return $this->json($result);


    }

     /**
     * @Route("/acheteurs-tentatives")
     */
    public function getCountAcheteursProvisoire()
    {

        /**
         * @var UserInterface $acheteur
         */
        $acheteur = $this->tokenStorage->getToken()->getUser();
        if ($acheteur instanceof Acheteur) {

            $result = $this->getDoctrine()->getManager()->getRepository(AcheteurProvisoire::class)->count(['type' => 0, 'acheteurParent' => $acheteur]);

            return $this->json($result);
        }

        return null;

    }

     /**
     * @Route("/check_activite_used")
     */
    public function checkIfActiviteIsUsedByCollegue(Request $request)
    {

        /**
         * @var Acheteur $acheteur
         */
        $acheteur = $this->tokenStorage->getToken()->getUser();

        $data = $request->query->all();
        // Activite
        $activite = $data['activite'];

        $em = $this->getDoctrine()->getManager()->getRepository(Produit::class);
        $qb = $em->createQueryBuilder('p')
            ->innerJoin('p.acheteur', 'f')
            ->where('f.id <> :current AND p.sousSecteurs = :activite and p.del = :false')
            ->setParameter('current', $acheteur->getId())
            ->setParameter('false', false)
            ->setParameter('activite', $activite);

        if (is_null($acheteur->getParent2()) ) {
            $qb->andWhere('f.parent2 = :parent2')
                ->setParameter('parent2', $acheteur->getId());
        } else {
            $qb->andWhere('f.id = :parent2 OR (f.parent2 = :parent2)')
                ->setParameter('parent2', $acheteur->getParent2());
        }

        $qb->select('count(p.id)');
        $query = $qb->getQuery()->getSingleScalarResult();
        return $this->json(['exist'=>$query ? true : false]);


    }

    /**
     * @Route("/demandes/widgets")
     */
    public function getDemandesWidgets()
    {

        if ($this->tokenStorage->getToken() instanceof TokenInterface) {

            $user = $this->tokenStorage->getToken()->getUser();

            $em = $this->getDoctrine()->getManager()->getRepository(DemandeAchat::class);

            //En attentes
            $qb = $em->createQueryBuilder('d')
                ->where('d.statut = :searchTerm')
                ->andWhere('d.del = 0')
                ->andWhere('d.acheteur = :acheteur')
                ->andWhere('d.dateExpiration >= CURRENT_TIMESTAMP()')
                ->setParameter('searchTerm', 0)
                ->setParameter('acheteur', $user)
                ->select('count(d.id)');
            $query = $qb->getQuery();
            $en_attentes = $query->getSingleScalarResult();

            //En cours
            $qb = $em->createQueryBuilder('d')
                ->where('d.statut = :searchTerm')
                ->andWhere('d.del = 0')
                ->andWhere('d.acheteur = :acheteur')
                ->andWhere('d.dateExpiration >= CURRENT_TIMESTAMP()')
                ->setParameter('searchTerm', 1)
                ->setParameter('acheteur', $user)
                ->select('count(d.id)');
            $query = $qb->getQuery();
            $en_cours = $query->getSingleScalarResult();

            //Rejetée
            $qb = $em->createQueryBuilder('d')
                ->where('d.statut = :searchTerm')
                ->andWhere('d.del = 0')
                ->andWhere('d.acheteur = :acheteur')
                ->andWhere('d.dateExpiration >= CURRENT_TIMESTAMP()')
                ->setParameter('searchTerm', 2)
                ->setParameter('acheteur', $user)
                ->select('count(d.id)');
            $query = $qb->getQuery();
            $rejetee = $query->getSingleScalarResult();

            //Expirée
            $qb = $em->createQueryBuilder('d')
                ->andWhere('d.acheteur = :acheteur')
                ->andWhere('d.del = 0')
                ->andWhere('d.dateExpiration < CURRENT_TIMESTAMP()')
                ->andWhere('DATE(d.created) = CURRENT_DATE()')
                ->setParameter('acheteur', $user)
                ->select('count(d.id)');
            $query = $qb->getQuery();
            $expiree = $query->getSingleScalarResult();

            $data = [
                'widget1' => $en_cours,
                'widget2' => $expiree,
                'widget3' => $en_attentes,
                'widget4' => $rejetee
            ];


        } else {
            $data = [
                'widget1' => 0,
                'widget2' => 0,
                'widget3' => 0,
                'widget4' => 0
            ];
        }

        return $this->json($data);

    }

    /**
     * @Route("/demandes/charts")
     */
    public function getDemandesCharts(Request $request)
    {
        if ($this->tokenStorage->getToken() instanceof TokenInterface) {
            $data = $request->query->all();

            // Start date
            $date = $data['startDate'];
            // End date
            $end_date = $data['endDate'];


            $em = $this->getDoctrine()->getManager()->getRepository(DemandeAchat::class);

            /* ACHETEUR CONNECTEE */
            $user = $this->tokenStorage->getToken()->getUser();

            //Main widget
            $widget5 = [];

            //set title of main Chart
            $widget5["title"] = "Demandes par jour ";

            // Data main chart
            $data = [];

            // Data en cours demande
            $dataEnCours = [];


            while (strtotime($date) <= strtotime($end_date)) {

                //Nombre de demande par jour
                $qb = $em->createQueryBuilder('d')
                    ->andWhere('d.acheteur = :acheteur')
                    ->andWhere('d.del = 0')
                    ->andWhere('DATE(d.created) = DATE(:date)')
                    ->setParameter('acheteur', $user)
                    ->setParameter('date', $date)
                    ->select('count(d.id)');
                $query = $qb->getQuery();
                $result = $query->getSingleScalarResult();

                array_push($data, $result);


                $date = date("Y-m-d", strtotime("+1 day", strtotime($date)));
            }


            $datasets['label'] = 'Demandes';
            $datasets['fill'] = 'start';
            $datasets['data'] = $data;
            $widget5["mainChart"] = ['datasets' => [$datasets]];


            return $this->json($widget5);
        }
    }


    /**
     * @Route("/demandes/budgets")
     */
    public function getDemandesBudgetsParAnnee(Request $request)
    {

        if ($this->tokenStorage->getToken() instanceof TokenInterface) {

            $data = $request->query->all();

            // Year
            $year = $data['year'];

            $user = $this->tokenStorage->getToken()->getUser();

            $em = $this->getDoctrine()->getManager()->getRepository(DemandeAchat::class);

            //Sum budget
            $qb = $em->createQueryBuilder('d')
                ->where('d.statut <> :searchTerm')
                ->andWhere('d.del = 0')
                ->andWhere('d.acheteur = :acheteur')
                ->andWhere('year(d.created) = :year')
                ->setParameter('searchTerm', 2)
                ->setParameter('acheteur', $user)
                ->setParameter('year', $year)
                ->select('sum(d.budget)');
            $query = $qb->getQuery();
            $budgets = $query->getSingleScalarResult();


            $data = $budgets ? $budgets : 0;


        } else {
            $data = 0;
        }

        return $this->json($data);

    }
 /**
 * @Route("/acheteur/teamsRank")
 */
public function getTeamPotentielsParAnnee(Request $request)
{
    $token = $this->tokenStorage->getToken();
    if (!$token instanceof TokenInterface) {
        return $this->json([], 403);
    }

    $data = $request->query->all();
    $year = $data['year'] ?? date('Y');
    $user = $token->getUser();

    $entityManager = $this->getDoctrine()->getManager();
    $teamRepository = $entityManager->getRepository(Team::class);
    $demandeRepository = $entityManager->getRepository(DemandeAchat::class);

    $teams = $teamRepository->findBy(['acheteur' => $user, 'del' => 0]);

    $result = [];
    foreach ($teams as $team) {
        $result[] = [
            'team' => $team,
            'attentes' => $this->countDemands($demandeRepository, $user, $team, 0, $year),
            'cours' => $this->countDemands($demandeRepository, $user, $team, 1, $year),
            'rejetees' => $this->countDemands($demandeRepository, $user, $team, 2, $year),
            'expirees' => $this->countExpiredDemands($demandeRepository, $user, $team),
            'budgets' => $this->sumBudgets($demandeRepository, $user, $team, $year)
        ];
    }

    return $this->json($result);
}


private function countDemands($repository, $user, $team, $status, $year)
{
    return $repository->createQueryBuilder('d')
        ->select('COUNT(d.id)')
        ->where('d.statut = :status')
        ->andWhere('d.del = 0')
        ->andWhere('d.acheteur = :acheteur')
        ->andWhere('d.team = :team')
        ->andWhere('YEAR(d.created) = :year')
        ->setParameter('status', $status)
        ->setParameter('acheteur', $user)
        ->setParameter('team', $team)
        ->setParameter('year', $year)
        ->getQuery()
        ->getSingleScalarResult();
}


private function countExpiredDemands($repository, $user, $team)
{
    return $repository->createQueryBuilder('d')
        ->select('COUNT(d.id)')
        ->where('d.acheteur = :acheteur')
        ->andWhere('d.team = :team')
        ->andWhere('d.dateExpiration < CURRENT_TIMESTAMP()')
        ->andWhere('d.del = 0')
        ->setParameter('acheteur', $user)
        ->setParameter('team', $team)
        ->getQuery()
        ->getSingleScalarResult();
}


private function sumBudgets($repository, $user, $team, $year)
{
    return $repository->createQueryBuilder('d')
        ->select('SUM(d.budget)')
        ->where('d.statut <> :status')
        ->andWhere('d.del = 0')
        ->andWhere('d.acheteur = :acheteur')
        ->andWhere('d.team = :team')
        ->andWhere('YEAR(d.created) = :year')
        ->setParameter('status', 2)
        ->setParameter('acheteur', $user)
        ->setParameter('team', $team)
        ->setParameter('year', $year)
        ->getQuery()
        ->getSingleScalarResult() ?: 0; // Gérer le cas où la somme peut être NULL
}









}