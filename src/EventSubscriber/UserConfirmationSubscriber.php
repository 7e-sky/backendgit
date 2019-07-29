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
use App\Services\UserConfirmationService;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;

class UserConfirmationSubscriber implements EventSubscriberInterface
{


    /**
     * @var UserConfirmationService
     */
    private $confirmation;

    public function __construct(UserConfirmationService $confirmation)
    {

        $this->confirmation = $confirmation;
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

        $this->confirmation->confirmUser($confirmationToken->confirmationToken);

        $event->setResponse(new JsonResponse(null,Response::HTTP_OK));

    }
}