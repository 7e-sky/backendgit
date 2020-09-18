<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Interfaces\CreatedEntityInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"duree:post"}},
 *              "validation_groups"={"duree:postValidation"},
 *              "normalization_context"={"groups"={"duree:get-all"}}
 *          },
 *          "get"={
 *              "access_control"="is_granted('IS_AUTHENTICATED_FULLY')",
 *              "normalization_context"={"groups"={"duree:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *
 *          "get"={
 *              "access_control"="is_granted('IS_AUTHENTICATED_FULLY'))",
 *              "normalization_context"={"groups"={"duree:get-item","duree:get-all"}}
 *          },
 *          "put"={
 *              "denormalization_context"={"groups"={"duree:put"}},
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "validation_groups"={"duree:putValidation"}
 *          },
 *          "delete"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *          }
 *     },
 *     attributes={"pagination_enabled"=false},
 * )
 * @ORM\Entity(repositoryClass="App\Repository\DureeRepository")
 */
class Duree implements CreatedEntityInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"abonnement:get-item","dmdAbonnement:get-all","duree:get-all"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="smallint")
     * @Groups({"abonnement:get-all","dmdAbonnement:get-all","duree:get-all","duree:put","duree:post"})
     * @Assert\NotBlank(groups={"duree:postValidation","duree:putValidation"})
     */
    private $name;

    /**
     * @ORM\Column(type="smallint")
     * @Groups({"abonnement:get-all","dmdAbonnement:get-all","duree:get-all","duree:put","duree:post"})
     * @Assert\NotBlank(groups={"duree:postValidation","duree:putValidation"})
     */
    private $remise;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"duree:get-all"})
     */
    private $created;


    public function __construct()
    {
        $this->remise=0;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getRemise(): ?int
    {
        return $this->remise;
    }

    public function setRemise(int $remise): self
    {
        $this->remise = $remise;

        return $this;
    }

    public function getCreated(): ?\DateTimeInterface
    {
        return $this->created;
    }

    public function setCreated(\DateTimeInterface $created): CreatedEntityInterface
    {
        $this->created = $created;

        return $this;
    }
}
