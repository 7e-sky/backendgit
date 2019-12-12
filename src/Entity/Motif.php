<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"motif:post"}},
 *              "validation_groups"={"motif:postValidation"},
 *              "normalization_context"={"groups"={"motif:get-all"}}
 *          },
 *          "get"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "normalization_context"={"groups"={"motif:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *
 *          "get"={
 *              "access_control"="is_granted('ROLE_ACHETEUR'))",
 *              "normalization_context"={"groups"={"motif:get-item","motif:get-all"}}
 *          },
 *          "put"={
 *              "denormalization_context"={"groups"={"motif:put"}},
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "validation_groups"={"motif:putValidation"}
 *          },
 *          "delete"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *          }
 *     },
 *     attributes={"pagination_enabled"=false},
 *
 * )
 * @ORM\Entity(repositoryClass="App\Repository\MotifRepository")
 */
class Motif
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"motif:get-all","get-from-demande","get-from-acheteur_demandes"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"motif:get-all","motif:post","motif:put","get-from-demande","get-from-acheteur_demandes"})
     * @Assert\NotBlank(groups={"motif:postValidation","motif:putValidation"})
     * @Assert\Length(min=4,max=255,groups={"motif:postValidation","motif:putValidation"})
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
