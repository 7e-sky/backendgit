<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ApiResource(
 *     collectionOperations={
 *      "post"={
 *          "access_control"="is_granted('ROLE_ZONE')"
 *          },
 *      "get"={
 *          "access_control"="is_granted('ROLE_ZONE')"
 *          }
 * },
 *     itemOperations={
 *      "get"={
 *          "access_control"="is_granted('ROLE_ADMIN') or  (is_granted('ROLE_COMMERCIAL') and object == user) or ( is_granted('IS_AUTHENTICATED_FULLY') and object == user->getParent1())"
 *          },
 *      "put"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ZONE') and object->getParent1() == user) or (is_granted('ROLE_COMMERCIAL') and object == user) ",
 *           "denormalization_context"={"groups"={"put"}}
 *          }
 *      },
 *     normalizationContext={
 *      "groups"={"get"}
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\CommercialRepository")
 */
class Commercial extends User
{

}
