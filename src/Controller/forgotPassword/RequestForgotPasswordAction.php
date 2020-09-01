<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 26/07/2019
 * Time: 09:29
 */

namespace App\Controller\forgotPassword;

use ApiPlatform\Core\Validator\ValidatorInterface;
use App\Email\Mailer;
use App\Entity\ForgotPassword;
use App\Exception\ErrorMessageException;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\HttpFoundation\JsonResponse;
use App\Security\TokenGenerator;

class RequestForgotPasswordAction
{

    /**
     * @var ValidatorInterface
     */
    private $validator;
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;
    /**
     * @var TokenGenerator
     */
    private $tokenGenerator;
    /**
     * @var UserRepository
     */
    private $userRepository;
    /**
     * @var Mailer
     */
    private $mailer;


    public function __construct(ValidatorInterface $validator,
                                EntityManagerInterface $entityManager,
                                TokenGenerator $tokenGenerator,
                                UserRepository $userRepository,
                                Mailer $mailer
                               )
    {
        $this->validator = $validator;
        $this->entityManager = $entityManager;
        $this->tokenGenerator = $tokenGenerator;
        $this->userRepository = $userRepository;
        $this->mailer = $mailer;
    }

    public function __invoke(ForgotPassword $data)
    {
        $this->validator->validate($data);

        $user = $this->userRepository->findOneBy(['email'=>$data->getEmail()]);

        if(!$user){
            throw new ErrorMessageException("Adresse mail inexistante");
        }

        $user->setForgotToken($this->tokenGenerator->getRandomSecureToken());

        $this->entityManager->flush();

        $this->mailer->sendForgotPasswordToken($user);
        return new JsonResponse('Success',200);

    }
}