<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 23/07/2019
 * Time: 14:31
 */

namespace App\EventSubscriber;

use ApiPlatform\Core\EventListener\EventPriorities;
use App\Entity\Admin;
use App\Entity\Produit;
use App\Entity\Ville;
use App\Repository\AcheteurRepository;
use App\Repository\CommercialRepository;
use App\Repository\FournisseurRepository;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;

class VilleSubscriber implements EventSubscriberInterface
{

    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;
    /**
     * @var FournisseurRepository
     */
    private $fournisseurRepository;
    /**
     * @var AcheteurRepository
     */
    private $acheteurRepository;
    /**
     * @var CommercialRepository
     */
    private $commercialRepository;

    public function __construct(
        TokenStorageInterface $tokenStorage,
        FournisseurRepository $fournisseurRepository,
        AcheteurRepository $acheteurRepository,
        CommercialRepository $commercialRepository
    )
    {
        $this->tokenStorage = $tokenStorage;
        $this->fournisseurRepository = $fournisseurRepository;
        $this->acheteurRepository = $acheteurRepository;
        $this->commercialRepository = $commercialRepository;
    }

    public static function getSubscribedEvents()
    {
        return [
            KernelEvents::VIEW => [
                ['PutVille', EventPriorities::PRE_WRITE],
            ]
        ];
    }

    public function PutVille(GetResponseForControllerResultEvent $event)
    {

        $entity = $event->getControllerResult();
        $method = $event->getRequest()->getMethod();

        if (!$entity instanceof Ville || $method !== Request::METHOD_PUT) {
            return;
        }

        if ($entity->getDel() === true) {
            $acheteur = $this->acheteurRepository->findOneBy(['pays' => $entity, 'del' => false]);
            $fournisseur = $this->fournisseurRepository->findOneBy(['pays' => $entity, 'del' => false]);
            $commercial = $this->commercialRepository->createQueryBuilder('c')
                ->innerJoin('c.villes', 'v')
                ->where('v.id = :v_id')
                ->andWhere('c.del = 0')
                ->setParameter('v_id', $entity)
                ->setMaxResults(1)
                ->getQuery()
                ->getOneOrNullResult();

            if ($fournisseur || $acheteur || $commercial) {
                throw new Exception("Vous ne pouvez pas supprimer cet enregistrement, car il est en relation avec d'autre(s) objet(s) !", 400);
            }
        }

    }




}