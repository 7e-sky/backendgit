<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 31/10/2019
 * Time: 16:35
 */

namespace App\Controller;


use App\Entity\SousSecteur;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/api")
 */
class SousSecteurController extends AbstractController
{

    /**
     * @Route("/sous_secteur_p", name="get_sous_secteur_p")
     */
    public function getAllPays(){

        $em = $this->getDoctrine()->getManager()->getRepository(SousSecteur::class);
        $qb = $em->createQueryBuilder('s')->select('s.id,s.name');
        $query = $qb->getQuery();
        return $this->json($query->execute());

    }

}