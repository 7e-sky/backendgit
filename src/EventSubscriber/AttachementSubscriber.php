<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 23/07/2019
 * Time: 14:31
 */

namespace App\EventSubscriber;

use ApiPlatform\Core\EventListener\EventPriorities;
use App\Entity\Attachement;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Filesystem\Exception\IOExceptionInterface;
use Symfony\Component\Filesystem\Filesystem;

use Symfony\Component\HttpKernel\KernelInterface;

class AttachementSubscriber implements EventSubscriberInterface
{


    /**
     * @var KernelInterface
     */
    private $kernel;

    public function __construct(KernelInterface $kernel )
    {
        $this->kernel = $kernel;
    }


    public static function getSubscribedEvents()
    {
       return [
           KernelEvents::VIEW => [
               ['DeleteAttachement',EventPriorities::PRE_WRITE],
           ]
       ];
    }


    public function DeleteAttachement(GetResponseForControllerResultEvent $event){

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if(!$entity instanceof  Attachement  || $method !== Request::METHOD_DELETE ){
            return;
        }
        $filesystem = new Filesystem();
        $filesystem->remove( $this->kernel->getProjectDir() . '/public'.$entity->getUrl());

    }



}