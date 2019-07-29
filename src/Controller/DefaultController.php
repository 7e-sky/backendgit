<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 22/07/2019
 * Time: 12:27
 */

namespace App\Controller;


use App\Entity\Acheteur;
use App\Entity\User;
use App\Services\UserConfirmationService;
use http\Env\Response;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/")
 */
class DefaultController extends  AbstractController
{

    /**
     * @var UserConfirmationService
     */
    private $confirmationService;

    public function __construct(UserConfirmationService $confirmationService)
    {
        $this->confirmationService = $confirmationService;
    }

    /**
     * @Route("/all",name="defaultIndex",methods={"GET"})
     */
    public function index()
    {

        $em = $this->getDoctrine()->getManager();
        $users = $em->getRepository(User::class)->find(14);

        return $this->json($users->getCodePostal());
    }

    /**
     * @Route("/confrim-user/{token}", name="default_confirm_token")
     */
    public function confirm(string $token){

        $this->confirmationService->confirmUser($token);

        return $this->redirectToRoute('defaultIndex');
    }

}