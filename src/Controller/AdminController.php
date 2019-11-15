<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 31/10/2019
 * Time: 16:35
 */

namespace App\Controller;


use App\Entity\DemandeAchat;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/api")
 */
class AdminController extends AbstractController
{

    /**
     * @Route("/demandes-admin")
     */
    public function getCountDemandesEnAttentes(){

        $em = $this->getDoctrine()->getManager()->getRepository(DemandeAchat::class);
        $qb = $em->createQueryBuilder('d')
            ->where('d.statut = :searchTerm')
            ->andWhere('d.dateExpiration >= CURRENT_TIMESTAMP()')
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
        $qb = $em->createQueryBuilder('d')->where('d.statut = :searchTerm')
            ->setParameter('searchTerm', 1)->select('count(d.id)');
        $query = $qb->getQuery();

        return $this->json($query->getSingleScalarResult());

    }


}