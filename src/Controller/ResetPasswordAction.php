<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 26/07/2019
 * Time: 09:29
 */

namespace App\Controller;

use ApiPlatform\Core\Validator\ValidatorInterface;
use App\Entity\Acheteur;
use App\Entity\Fournisseur;
use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class ResetPasswordAction
{

    /**
     * @var ValidatorInterface
     */
    private $validator;
    /**
     * @var UserPasswordEncoderInterface
     */
    private $passwordEncoder;
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;
    /**
     * @var JWTTokenManagerInterface
     */
    private $tokenManager;

    public function __construct(ValidatorInterface $validator,
                                UserPasswordEncoderInterface $passwordEncoder,
                                EntityManagerInterface $entityManager,
                                JWTTokenManagerInterface $tokenManager)
    {
        $this->validator = $validator;
        $this->passwordEncoder = $passwordEncoder;
        $this->entityManager = $entityManager;
        $this->tokenManager = $tokenManager;
    }

    public function __invoke(User $data)
    {
        // $reset = new ResetPassword();
        // $reset();
        $this->validator->validate($data);


        $data->setPassword($this->passwordEncoder->encodePassword($data,$data->getNewPassword()));

        // After password change, old tokens are still valid
        $data->setPasswordChangeDate(time());

        $this->entityManager->flush();
        $token = $this->tokenManager->create($data);

        $currency = '';

        if($data instanceof Fournisseur || $data instanceof Acheteur){
            $currency = $data->getCurrency()?$data->getCurrency()->getName() : '';
        }

        $parent = '';
        if($data instanceof Fournisseur ){
            $parent = $data->getParent() ?$data->getParent()->getId() : '';
        }

        $dataa['token']=$token;
        $dataa['user']=[
            'id'=>$data->getId(),
            'role'=>$data->getRoles()[0],
            'data'=>[
                'displayName'=>$data->getFirstName().' '.$data->getLastName(),
                'photoURL'=> $data->getAvatar() ? $data->getAvatar()->getUrl() : '',
                'email'=>$data->getEmail(),
                'redirect'=>$data->getRedirect(),
                'currency'=>$currency,
                'parent'=>$parent,

            ]
        ];

        return new JsonResponse($dataa);

        // Validator is only called after we return the data from this action!
        // Only hear it checks for user currant password, but we've just modified it!
        // Entity is persisted automatically, only if validation pass

    }
}