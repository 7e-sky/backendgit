<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;

/**
 *
 * @ApiResource(
 *     attributes={"order"={"created":"desc"}},
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"post"}},
 *              "validation_groups"={"postValidation"}
 *          },
 *          "get"={
 *               "access_control"="is_granted('ROLE_ADMIN')"
 *          }
 *
 *     },
 *     itemOperations={
 *          "put"={
 *               "access_control"="is_granted('ROLE_ADMIN')",
 *                "denormalization_context"={"groups"={"put"}},
 *                  "validation_groups"={"putValidation"}
 *              },
 *         "get"={
 *               "access_control"="is_granted('ROLE_ADMIN')"
 *          }
 *
 *
 *     },
 *
 *     normalizationContext={
 *      "groups"={"get"}
 *     },
 *     attributes={
 *          "validation_groups"={"putResetPasswordValidation", "putValidation","postValidation"},
 *          "order"={"created":"desc"}
 *
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\AdminRepository")
 */
class Admin extends User
{

}
