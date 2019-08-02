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
 *              "access_control"="is_granted('ROLE_ACHETEUR')"
 *          },
 *          "get"
 *     },
 *     itemOperations={
 *          "get",
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object == user)"
 *          }
 *     },
 *     normalizationContext={
 *      "groups"={"get-from-demande"}
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\DemandeAchatRepository")
 */
class DemandeAchat implements CreatedEntityInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"get-from-demande"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Acheteur")
     * @Groups({"get-from-demande"})
     * @Assert\NotBlank()
     */
    private $acheteur;

    /**
     * @ORM\Column(type="smallint",length=1)
     * @Groups({"get-from-demande"})
     *
     */
    private $statut;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"get-from-demande"})
     * @Assert\NotBlank()
     */
    private $reference;

    /**
     * @ORM\Column(type="text")
     * @Assert\NotBlank()
     * @Groups({"get-from-demande"})
     */
    private $description;

    /**
     * @ORM\Column(type="datetime")
     * @Assert\NotBlank()
     * @Assert\DateTime()
     * @Groups({"get-from-demande"})
     */
    private $dateExpiration;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get-from-demande"})
     * @Assert\NotBlank()
     */
    private $isPublic;

    /**
     * @ORM\Column(type="integer")
     *
     */
    private $nbrVisite;

    /**
     * @ORM\Column(type="datetime")
     */
    private $created;

    /**
     * @ORM\Column(type="datetime")
     */
    private $dateModification;

    /**
     * @ORM\Column(type="boolean")
     */
    private $isAlerted;

    /**
     * @ORM\Column(type="boolean")
     */
    private $isAnonyme;

    /**
     * @ORM\Column(type="text")
     */
    private $descriptionEn;

    /**
     * @ORM\Column(type="text")
     */
    private $descriptionEs;


    public function __construct()
    {
        $this->statut=false;
    }

    public function getId(): ?int
    {
        return $this->id;
    }


    public function getAcheteur()
    {
        return $this->acheteur;
    }


    public function setAcheteur($acheteur): void
    {
        $this->acheteur = $acheteur;
    }



    public function getStatut():? int
    {
        return $this->statut;
    }

    public function setStatut(int $statut): self
    {
        $this->statut = $statut;

        return $this;
    }

    public function getReference(): ?string
    {
        return $this->reference;
    }

    public function setReference(string $reference): self
    {
        $this->reference = $reference;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getDateExpiration(): ?\DateTimeInterface
    {
        return $this->dateExpiration;
    }

    public function setDateExpiration(\DateTimeInterface $dateExpiration): self
    {
        $this->dateExpiration = $dateExpiration;

        return $this;
    }

    public function getIsPublic(): ?bool
    {
        return $this->isPublic;
    }

    public function setIsPublic(bool $isPublic): self
    {
        $this->isPublic = $isPublic;

        return $this;
    }

    public function getNbrVisite(): ?int
    {
        return $this->nbrVisite;
    }

    public function setNbrVisite(int $nbrVisite): self
    {
        $this->nbrVisite = $nbrVisite;

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

    public function getDateModification(): ?\DateTimeInterface
    {
        return $this->dateModification;
    }

    public function setDateModification(\DateTimeInterface $dateModification): self
    {
        $this->dateModification = $dateModification;

        return $this;
    }

    public function getIsAlerted(): ?bool
    {
        return $this->isAlerted;
    }

    public function setIsAlerted(bool $isAlerted): self
    {
        $this->isAlerted = $isAlerted;

        return $this;
    }

    public function getIsAnonyme(): ?bool
    {
        return $this->isAnonyme;
    }

    public function setIsAnonyme(bool $isAnonyme): self
    {
        $this->isAnonyme = $isAnonyme;

        return $this;
    }

    public function getDescriptionEn(): ?string
    {
        return $this->descriptionEn;
    }

    public function setDescriptionEn(string $descriptionEn): self
    {
        $this->descriptionEn = $descriptionEn;

        return $this;
    }

    public function getDescriptionEs(): ?string
    {
        return $this->descriptionEs;
    }

    public function setDescriptionEs(string $descriptionEs): self
    {
        $this->descriptionEs = $descriptionEs;

        return $this;
    }
}
