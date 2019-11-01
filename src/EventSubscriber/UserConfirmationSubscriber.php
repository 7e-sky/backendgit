<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 29/07/2019
 * Time: 10:43
 */

namespace App\EventSubscriber;


use ApiPlatform\Core\EventListener\EventPriorities;
use App\Entity\UserConfirmation;
use App\Repository\UserRepository;
use App\Services\UserConfirmationService;
use Doctrine\ORM\EntityManagerInterface;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpKernel\KernelEvents;

class UserConfirmationSubscriber implements EventSubscriberInterface
{


    /**
     * @var UserConfirmationService
     */
    private $confirmation;
    /**
     * @var UserRepository
     */
    private $userRepository;
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;
    /**
     * @var JWTTokenManagerInterface
     */
    private $tokenManager;

    public function __construct(UserConfirmationService $confirmation,
                                UserRepository $userRepository,
                                EntityManagerInterface $entityManager,
                                JWTTokenManagerInterface $tokenManager)
    {

        $this->confirmation = $confirmation;
        $this->userRepository = $userRepository;
        $this->entityManager = $entityManager;
        $this->tokenManager = $tokenManager;
    }

    public static function getSubscribedEvents()
    {
        return [
            KernelEvents::VIEW => ['confirmUser',EventPriorities::POST_VALIDATE]
        ];
    }

    public function confirmUser(GetResponseForControllerResultEvent $event){

        $request = $event->getRequest();

        if('api_user_confirmations_post_collection' !== $request->get('_route')){
            return;
        }

        /**
         * @var UserConfirmation $confirmationToken
         */
        $confirmationToken = $event->getControllerResult();


        $user = $this->userRepository->findOneBy(['confirmationToken'=>$confirmationToken->confirmationToken]);

        if(!$user){
            throw new NotFoundHttpException('Code d\'activation expiré');
        }

        $user->setIsActif(true);
        $user->setConfirmationToken(null);

        $this->entityManager->flush();


        $token = $this->tokenManager->create($user);

        $dataa['token']=$token;
        $dataa['user']=[
            'id'=>$user->getId(),
            'role'=>$user->getRoles()[0],
            'data'=>[
                'displayName'=>$user->getFirstName().' '.$user->getLastName(),
                'photoURL'=> $user->getAvatar() ? $user->getAvatar()->getUrl() : '',
                'email'=>$user->getEmail(),
                'redirect'=>$user->getRedirect(),
            ]
        ];


        $event->setResponse(new JsonResponse($dataa));

    }
}