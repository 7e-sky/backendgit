<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ApiResource(
 *     collectionOperations={
 *      "post"={
 *          "access_control"="is_granted('ROLE_ADMIN')"
 *          },
 *      "get"={
 *          "access_control"="is_granted('ROLE_ADMIN')"
 *          }
 * },
 *     itemOperations={
 *      "get"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ZONE') and object == user) or ( is_granted('IS_AUTHENTICATED_FULLY') and object == user->getParent1())"
 *          },
 *      "put"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ZONE') and object == user)",
 *           "denormalization_context"={"groups"={"put"}}
 *          }
 *      },
 *     normalizationContext={
 *      "groups"={"get"}
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\ZoneCommercialRepository")
 */
class ZoneCommercial extends User
{

}
