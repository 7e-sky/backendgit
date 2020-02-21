<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 31/10/2019
 * Time: 16:35
 */

namespace App\Controller;


use App\Entity\Produit;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * @Route("/custom")
 */
class ProduitController extends AbstractController
{

    /**
     * @Route("/update_produit/{id}")
     */
    public function UpdatePhoneVu(Produit $produit)
    {
        // Generate response
        $response = new JsonResponse();
        if (!$produit) {
            return $response->setStatusCode(404);
        }
        $produit->setPhoneVu($produit->getPhoneVu()+1);
        $this->getDoctrine()->getManager()->flush();
        // Set headers
        $response->headers->set('Cache-Control', 'private');
        $response->setContent($produit->getFournisseur()->getPhone());
        return $response;

    }

}