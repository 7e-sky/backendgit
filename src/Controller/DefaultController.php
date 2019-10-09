<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 22/07/2019
 * Time: 12:27
 */

namespace App\Controller;


use App\Entity\User;
use App\Services\UserConfirmationService;
use App\Services\UserService;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @Route("/")
 */
class DefaultController extends  AbstractController
{

    /**
     * @var UserConfirmationService
     */
    private $confirmationService;
    /**
     * @var UserService
     */
    private $userService;
    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;
    /**
     * @var JWTTokenManagerInterface
     */
    private $jwtManager;


    public function __construct(UserConfirmationService $confirmationService, UserService $userService,TokenStorageInterface $tokenStorage, JWTTokenManagerInterface $jwtManager)
    {
        $this->confirmationService = $confirmationService;
        $this->userService = $userService;
        $this->tokenStorage = $tokenStorage;
        $this->jwtManager = $jwtManager;
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

    /**
     * @Route("/api/currentUser", name="get_current_user")
     */
    public function getCurrentUser(){

        if($this->tokenStorage->getToken() instanceof TokenInterface){



            $user = $this->tokenStorage->getToken()->getUser();

            $tokenupdate = $this->jwtManager->create($user);


            $dataa['token']=$tokenupdate;
            $dataa['user']=[
                'id'=>$user->getId(),
                'role'=>$user->getRoles()[0],
                'data'=>[
                    'displayName'=>$user->getFirstName().' '.$user->getLastName(),
                    'photoURL'=> $user->getAvatar() ? $user->getAvatar()->getUrl() : '',
                    'email'=>$user->getEmail()
                ]
            ];
        }else{
            $dataa=null;
        }


        return new JsonResponse($dataa);

    }

}