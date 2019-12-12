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
 *              "access_control"="is_granted('ROLE ADMIN')",
 *              "denormalization_context"={"groups"={"jeton:post"}},
 *              "validation_groups"={"jeton:postValidation"},
 *              "normalization_context"={"groups"={"jeton:get-item"}}
 *          },
 *          "get"={
 *              "normalization_context"={"groups"={"jeton:get-all"}}
 *           }
 *     },
 *     itemOperations={
 *
 *          "get"={
 *                  "normalization_context"={"groups"={"jeton:get-item"}}
 *                },
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"jeton:put"}},
 *              "validation_groups"={"jeton:putValidation"}
 *          }
 *     },
 *
 *     attributes={"pagination_items_per_page"=10},
 * )
 * @ORM\Entity(repositoryClass="App\Repository\JetonRepository")
 */
class Jeton implements CreatedEntityInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"jeton:get-item","jeton:get-all"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Fournisseur")
     * @Groups({"jeton:get-item","jeton:get-all","jeton:post","jeton:put"})
     * @Assert\NotBlank(groups={"jeton:postValidation","jeton:putValidation"})
     */
    private $fournisseur;

    /**
     * @ORM\ManyToOne(targetEntity="Paiement")
     * @Groups({"jeton:get-item","jeton:get-all","jeton:post","jeton:put"})
     * @Assert\NotBlank(groups={"jeton:postValidation","jeton:putValidation"})
     */
    private $paiement;

    /**
     * @ORM\OneToOne(targetEntity="DemandeJeton")
     * @Groups({"jeton:get-item","jeton:get-all","jeton:post"})
     * @Assert\NotBlank(groups={"jeton:postValidation"})
     */
    private $demande;

    /**
     * @ORM\Column(type="smallint")
     * @Groups({"jeton:get-item","jeton:get-all","jeton:post","jeton:put"})
     * @Assert\NotBlank(groups={"jeton:postValidation","jeton:putValidation"})
     */
    private $nbrJeton;


    /**
     * @ORM\Column(type="float")
     * @Groups({"jeton:get-item","jeton:get-all","jeton:post","jeton:put"})
     * @Assert\NotBlank(groups={"jeton:postValidation","jeton:putValidation"})
     */
    private $prix;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"jeton:get-item","jeton:get-all","jeton:post","jeton:put"})
     */
    private $isPayed;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"jeton:get-item","jeton:get-all"})
     */
    private $created;

    public function __construct()
    {
        $this->isPayed=false;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getFournisseur()
    {
        return $this->fournisseur;
    }

    /**
     * @param mixed $fournisseur
     */
    public function setFournisseur($fournisseur): void
    {
        $this->fournisseur = $fournisseur;
    }

    /**
     * @return mixed
     */
    public function getPaiement()
    {
        return $this->paiement;
    }

    /**
     * @return mixed
     */
    public function getDemande()
    {
        return $this->demande;
    }

    /**
     * @param mixed $demande
     */
    public function setDemande($demande): void
    {
        $this->demande = $demande;
    }


    /**
     * @param mixed $paiement
     */
    public function setPaiement($paiement): void
    {
        $this->paiement = $paiement;
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

    public function getPrix()
    {
        return $this->prix;
    }

    public function setPrix(float $prix): self
    {
        $this->prix = $prix;

        return $this;
    }

    public function getIsPayed()
    {
        return $this->isPayed;
    }

    public function setIsPayed(bool $isPayed): self
    {
        $this->isPayed = $isPayed;

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
