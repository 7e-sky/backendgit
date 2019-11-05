<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 31/10/2019
 * Time: 16:35
 */

namespace App\Controller;


use App\Entity\Secteur;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/api")
 */
class SecteurController extends AbstractController
{

    /**
     * @Route("/secteurs_p", name="get_secteurs_p")
     */
    public function getAllSecteurs(){

        $em = $this->getDoctrine()->getManager()->getRepository(Secteur::class);
        $qb = $em->createQueryBuilder('s')->select('s.id,s.name');
        $query = $qb->getQuery();
        return $this->json($query->execute());

    }

}