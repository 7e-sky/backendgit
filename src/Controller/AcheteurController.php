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
use App\Entity\Ville;
use App\Repository\DetailVisiteRepository;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\HttpFoundation\Request;
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

    public function __construct(TokenStorageInterface $tokenStorage, DetailVisiteRepository $visiteRepository,EntityManagerInterface $entityManager,Mailer $mailer )
    {

        $this->tokenStorage = $tokenStorage;
        $this->visiteRepository = $visiteRepository;
        $this->entityManager = $entityManager;
        $this->mailer = $mailer;
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
                    }else{
                        //Set fournisseur perdu
                        $visite->setStatut(2);
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


}