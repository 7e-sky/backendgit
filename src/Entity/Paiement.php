<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"paiement:post"}},
 *              "validation_groups"={"paiement:postValidation"},
 *              "normalization_context"={"groups"={"paiement:get-item"}}
 *          },
 *          "get"={
 *              "normalization_context"={"groups"={"paiement:get-all"}}
 *           }
 *     },
 *     itemOperations={
 *
 *          "get"={
 *                  "normalization_context"={"groups"={"paiement:get-item"}}
 *                },
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"paiement:put"}},
 *              "validation_groups"={"paiement:putValidation"}
 *          }
 *     },
 *
 *     attributes={"pagination_enabled"=false},
 * )
 * @ORM\Entity(repositoryClass="App\Repository\PaiementRepository")
 */
class Paiement
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"jeton:get-item","jeton:get-all","paiement:get-item","paiement:get-all"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"dmdAbonnement:get-all","jeton:get-item","jeton:get-all","paiement:put","paiement:post","paiement:get-item","paiement:get-all"})
     */
    private $name;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }
}
