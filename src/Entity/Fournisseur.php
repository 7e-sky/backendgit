<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ApiResource(
 *     collectionOperations={
 *     "post",
 *     "get"
 *      },
 *     itemOperations={
 *     "get"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object == user)",
 *           "normalization_context"={"groups"={"get"}}
 *          },
 *     "put"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object == user)",
 *           "denormalization_context"={"groups"={"put"}}
 *          }
 *     },
 *     normalizationContext={
 *      "groups"={"get"}
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\FournisseurRepository")
 */
class Fournisseur extends User
{

}
