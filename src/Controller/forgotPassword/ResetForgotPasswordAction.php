<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 26/07/2019
 * Time: 09:29
 */

namespace App\Controller\forgotPassword;

use ApiPlatform\Core\Validator\ValidatorInterface;
use App\Entity\ResetPassword;
use App\Exception\ErrorMessageException;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class ResetForgotPasswordAction
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
     * @var UserPasswordEncoderInterface
     */
    private $passwordEncoder;
    /**
     * @var UserRepository
     */
    private $userRepository;


    public function __construct(ValidatorInterface $validator,
                                UserPasswordEncoderInterface $passwordEncoder,
                                EntityManagerInterface $entityManager,
                                UserRepository $userRepository)
    {
        $this->validator = $validator;
        $this->entityManager = $entityManager;
        $this->passwordEncoder = $passwordEncoder;
        $this->userRepository = $userRepository;
    }

    public function __invoke(ResetPassword $data)
    {
        // $reset = new ResetPassword();
        // $reset();
        $this->validator->validate($data);


        $user = $this->userRepository->findOneBy(["forgotToken"=>$data->getToken()]);

        if(!$user){
            throw new ErrorMessageException("Token invalide");
        }

        $user->setPassword($this->passwordEncoder->encodePassword($user,$data->getPassword()));

        // After password change, old tokens are still valid
        $user->setPasswordResetDate(new \DateTime());
        $user->setForgotToken(null);


        $this->entityManager->flush();

        return new JsonResponse('ok');

        // Validator is only called after we return the data from this action!
        // Only hear it checks for user currant password, but we've just modified it!
        // Entity is persisted automatically, only if validation pass

    }
}