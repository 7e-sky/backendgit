<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Interfaces\CreatedEntityInterface;
use App\Interfaces\SetFournisseurInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "denormalization_context"={"groups"={"d-jeton:post"}},
 *              "validation_groups"={"d-jeton:postValidation"},
 *              "normalization_context"={"groups"={"d-jeton:get-item"}}
 *          },
 *          "get"={
 *              "normalization_context"={"groups"={"d-jeton:get-all"}}
 *           }
 *     },
 *     itemOperations={
 *
 *          "get"={
 *                  "normalization_context"={"groups"={"d-jeton:get-item"}}
 *                },
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object.getFournisseur() == user)",
 *              "denormalization_context"={"groups"={"d-jeton:put"}},
 *              "validation_groups"={"d-jeton:putValidation"}
 *          },
 *          "delete"={
 *              "access_control"="is_granted('ROLE_ADMIN')"
 *          }
 *     },
 *
 *     attributes={
 *     "pagination_items_per_page"=10,
 *     "pagination_client_enabled"=true
 *     },
 * )
 * @ORM\Entity(repositoryClass="App\Repository\DemandeJetonRepository")
 */
class DemandeJeton implements CreatedEntityInterface,SetFournisseurInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"d-jeton:get-all","d-jeton:get-item"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Fournisseur",inversedBy="commandes")
     */
    private $fournisseur;


    /**
     * @ORM\Column(type="smallint")
     * @Groups({"d-jeton:post","d-jeton:put","d-jeton:get-all","d-jeton:get-item"})
     * @Assert\NotBlank(groups={"d-jeton:postValidation","d-jeton:putValidation"})
     */
    private $nbrJeton;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"d-jeton:get-all","d-jeton:get-item"})
     */
    private $is_use;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"d-jeton:get-all","d-jeton:get-item"})
     */
    private $created;

    public function __construct()
    {
        $this->is_use=false;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNbrJeton()
    {
        return $this->nbrJeton;
    }

    public function setNbrJeton(string $nbrJeton): self
    {
        $this->nbrJeton = $nbrJeton;

        return $this;
    }

    public function getIsUse()
    {
        return $this->is_use;
    }

    public function setIsUse(bool $is_use): self
    {
        $this->is_use = $is_use;

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

    /**
     * @return mixed
     */
    public function getFournisseur()
    {
        return $this->fournisseur;
    }

    public function setFournisseur(Fournisseur $fournisseur): SetFournisseurInterface
    {
        $this->fournisseur = $fournisseur;
        return $this;
    }


}
