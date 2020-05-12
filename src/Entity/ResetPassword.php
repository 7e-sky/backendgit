<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 29/07/2019
 * Time: 10:37
 */

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use App\Controller\forgotPassword\ResetForgotPasswordAction;


/**
 * @ApiResource(
 *     collectionOperations={
 *          "reset"={
 *               "method"="POST",
 *               "path"="/reset-password",
 *               "controller"=ResetForgotPasswordAction::class,
 *               "denormalization_context"={"groups"={"reset"}},
 *               "validation_groups"={"Default","postReset"}
 *           }
 *     },
 *     itemOperations={}
 * )
 */
class ResetPassword
{


    /**
     * @Assert\NotBlank(groups={"Default","postReset"})
     * @Groups({"reset"})
     */
    private $token;

    /**
     * @Assert\NotBlank(groups={"Default","postReset"})
     * @Groups({"reset"})
     * @Assert\Regex(
     *     pattern="/(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{7,}/",
     *     message="Le mot de passe doit être de 6 caractères minimum et contenir un lettre majuscules et des lettres minuscules et au moins un chiffre",
     *     groups={"Default","postReset"}
     * )
     */
    private $password;


    /**
     * @return mixed
     */
    public function getToken()
    {
        return $this->token;
    }

    /**
     * @param mixed $token
     */
    public function setToken($token): void
    {
        $this->token = $token;
    }

    /**
     * @return mixed
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * @param mixed $password
     */
    public function setPassword($password): void
    {
        $this->password = $password;
    }




}