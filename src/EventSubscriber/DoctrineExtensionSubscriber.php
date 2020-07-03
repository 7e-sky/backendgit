<?php

namespace App\EventSubscriber;

use Gedmo\Loggable\LoggableListener;
use Gedmo\Blameable\BlameableListener;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpKernel\Event\FinishRequestEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;

class DoctrineExtensionSubscriber implements EventSubscriberInterface
{

    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;
    /**
     * @var LoggableListener
     */
    private $loggableListener;
    /**
     * @var BlameableListener
     */
    private $blameableListener;


    public function __construct(
        BlameableListener $blameableListener,
        TokenStorageInterface $tokenStorage,
        LoggableListener $loggableListener
    ) {
        $this->tokenStorage = $tokenStorage;
        $this->loggableListener = $loggableListener;
        $this->blameableListener = $blameableListener;
    }


    public static function getSubscribedEvents()
    {
        return [
            KernelEvents::REQUEST => 'onKernelRequest',
            KernelEvents::FINISH_REQUEST => 'onLateKernelRequest'
        ];
    }
    public function onKernelRequest(): void
    {
        if ($this->tokenStorage !== null &&
            $this->tokenStorage->getToken() !== null &&
            $this->tokenStorage->getToken()->isAuthenticated() === true
        ) {
            $this->blameableListener->setUserValue($this->tokenStorage->getToken()->getUser());
        }
    }

    public function onLateKernelRequest(FinishRequestEvent $event): void
    {
      //  $this->translatableListener->setTranslatableLocale($event->getRequest()->getLocale());
    }

}