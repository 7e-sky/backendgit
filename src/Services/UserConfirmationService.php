<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 29/07/2019
 * Time: 12:08
 */

namespace App\Services;


use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class UserConfirmationService
{

    /**
     * @var UserRepository
     */
    private $userRepository;
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;

    public function __construct(UserRepository $userRepository, EntityManagerInterface $entityManager)
    {
        $this->userRepository = $userRepository;
        $this->entityManager = $entityManager;
    }

    public function confirmUser(string $confirmationToken){

        $user = $this->userRepository->findOneBy(['confirmationToken'=>$confirmationToken]);

        if(!$user){
            throw new NotFoundHttpException();
        }

        $user->setIsActif(true);
        $user->setConfirmationToken(null);
        $this->entityManager->flush();

    }

}