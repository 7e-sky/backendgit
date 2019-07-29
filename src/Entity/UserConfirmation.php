<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 29/07/2019
 * Time: 10:37
 */

namespace App\Entity;
use ApiPlatform\Core\Annotation\ApiResource;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *                  "path"="/users/confirm"
 *               }
 *     },
 *     itemOperations={}
 * )
 */
class UserConfirmation
{

    /**
     * @Assert\NotBlank()
     * @Assert\Length(min=30,max=30)
     */
    public $confirmationToken;

}