<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 31/10/2019
 * Time: 16:35
 */

namespace App\Controller;


use App\Entity\Pays;
use App\Entity\Ville;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/api")
 */
class VilleController extends AbstractController
{

    /**
     * @Route("/pays_p/{pays}/villes", name="get_villes_p")
     */
    public function getVilleByPays(Pays $pays){

        $em = $this->getDoctrine()->getManager()->getRepository(Ville::class);
        $qb = $em->createQueryBuilder('v')
            ->where('v.pays = :pays')
            ->setParameter('pays', $pays)
            ->select('v.id,v.name');
        $query = $qb->getQuery();

        return $this->json($query->execute());

    }

}