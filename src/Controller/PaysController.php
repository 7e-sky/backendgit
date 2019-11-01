<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 31/10/2019
 * Time: 16:35
 */

namespace App\Controller;


use App\Entity\Pays;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/api")
 */
class PaysController extends AbstractController
{

    /**
     * @Route("/pays_p", name="get_pays_p")
     */
    public function getAllPays(){

        $em = $this->getDoctrine()->getManager()->getRepository(Pays::class);
        $qb = $em->createQueryBuilder('p')->select('p.id,p.name');
        $query = $qb->getQuery();

        return $this->json($query->execute());

    }

}