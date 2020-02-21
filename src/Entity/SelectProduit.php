<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\ExistsFilter;
/**
 * @ApiFilter(ExistsFilter::class, properties={"produit"})
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"selectProduit:post"}},
 *              "validation_groups"={"selectProduit:postValidation"},
 *              "normalization_context"={"groups"={"selectProduit:get-all"}}
 *          },
 *          "get"={
 *              "normalization_context"={"groups"={"selectProduit:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *
 *          "get"={
 *              "normalization_context"={"groups"={"selectProduit:get-item","selectProduit:get-all"}}
 *          },
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"selectProduit:put"}},
 *              "validation_groups"={"selectProduit:putValidation"},
 *              "normalization_context"={"groups"={"selectProduit:get-all"}}
 *          },
 *     },
 *      attributes={"pagination_items_per_page"=10,"pagination_client_items_per_page"=true},
 * )
 * @ORM\Entity(repositoryClass="App\Repository\SelectProduitRepository")
 */
class SelectProduit
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"selectProduit:get-all"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Produit")
     * @Assert\NotBlank(groups={"selectProduit:postValidation","selectProduit:putValidation"})
     * @Groups({"selectProduit:post","selectProduit:put","selectProduit:get-all"})
     */
    private $produit;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"selectProduit:get-all"})
     */
    private $updated;



    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUpdated(): ?\DateTimeInterface
    {
        return $this->updated;
    }

    public function setUpdated(\DateTimeInterface $updated): self
    {
        $this->updated = $updated;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getProduit()
    {
        return $this->produit;
    }

    /**
     * @param mixed $produit
     */
    public function setProduit($produit): void
    {
        $this->produit = $produit;
    }


}
