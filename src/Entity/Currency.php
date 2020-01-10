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
 *              "denormalization_context"={"groups"={"currency:post"}},
 *              "validation_groups"={"currency:postValidation"},
 *              "normalization_context"={"groups"={"currency:get-all"}}
 *          },
 *          "get"={
 *              "normalization_context"={"groups"={"currency:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *
 *          "get"={
 *              "normalization_context"={"groups"={"currency:get-item","currency:get-all"}}
 *          },
 *          "put"={
 *              "denormalization_context"={"groups"={"currency:put"}},
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "validation_groups"={"currency:putValidation"}
 *          },
 *          "delete"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *          }
 *     },
 *     attributes={"pagination_enabled"=false},
 *
 * )
 * @ORM\Entity(repositoryClass="App\Repository\CurrencyRepository")
 */
class Currency
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"currency:get-all"})
     */
    private $id;

    /**
     * @ORM\Column(type="string",name="currency", length=5)
     * @Groups({"dmdAbonnement:get-item","get","fournisseur:get-item-from-demande","visit:get-all","fournisseur:get-from-demande","currency:get-all","produit:get-all","demandeDevis:get-item","get-from-acheteur_demandes","get-from-demande"})
     * @Assert\NotBlank(groups={"currency:postValidation","currency:putValidation"})
     * @Assert\Length(min=2,max=5,groups={"currency:postValidation","currency:putValidation"})
     */
    private $name;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"currency:get-all"})
     */
    private $del;

    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param mixed $name
     */
    public function setName($name): void
    {
        $this->name = $name;
    }



    public function getDel()
    {
        return $this->del;
    }

    public function setDel(bool $del): self
    {
        $this->del = $del;

        return $this;
    }
}
