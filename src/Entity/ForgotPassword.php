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
use App\Controller\forgotPassword\RequestForgotPasswordAction;

/**
 * @ApiResource(
 *     collectionOperations={
 *          "request"={
 *               "method"="POST",
 *               "path"="/request-forgot",
 *               "controller"=RequestForgotPasswordAction::class,
 *               "denormalization_context"={"groups"={"request"}},
 *               "validation_groups"={"Default","postRequest"}
 *           },
 *     },
 *     itemOperations={}
 * )
 */
class ForgotPassword
{

    /**
     * @Assert\NotBlank(groups={"Default","postRequest"})
     * @Assert\Email(groups={"Default","postRequest"})
     * @Groups({"request"})
     */
    private $email;


    /**
     * @return mixed
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @param mixed $email
     */
    public function setEmail($email): void
    {
        $this->email = $email;
    }



}