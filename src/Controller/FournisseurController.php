<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 31/10/2019
 * Time: 16:35
 */

namespace App\Controller;


use App\Entity\DemandeAchat;
use App\Entity\Fournisseur;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\User\UserInterface;

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
     * @Route("/demandes_prix")
     */
    public function getCountDemandesEnCours(){

        /**
         * @var UserInterface $fournisseur
         */
        $fournisseur = $this->tokenStorage->getToken()->getUser();
        $em = $this->getDoctrine()->getManager()->getRepository(DemandeAchat::class);
        if($fournisseur instanceof Fournisseur){

            $sous_secteurs = $fournisseur->getSousSecteurs();
            $sous_secteurs_id=[];
            foreach ($sous_secteurs as $secteur){
                if($secteur)
                    array_push($sous_secteurs_id,$secteur->getId());
            }
            if (!empty($sous_secteurs_id)) {

                $qb = $em->createQueryBuilder('d')
                    ->innerJoin('d.sousSecteurs','s')
                    ->where('s.id in (:sous_secteurs_id)')
                    ->andWhere('d.statut = :searchTerm')
                    ->andWhere('Date(d.dateExpiration) >= CURRENT_TIMESTAMP()')
                    ->andWhere('d.del = 0')
                    ->setParameter('searchTerm', 1)
                    ->setParameter('sous_secteurs_id', $sous_secteurs_id)
                    ->select('count(d.id)');
                $query = $qb->getQuery();

                return $this->json($query->getSingleScalarResult());

            }

        }

        return 0;


    }


}