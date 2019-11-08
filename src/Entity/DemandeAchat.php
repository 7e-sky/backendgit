<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiProperty;
use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Annotation\ApiSubresource;
use App\Interfaces\CreatedEntityInterface;
use App\Interfaces\SetAcheteurInterface;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ACHETEUR')",
 *              "denormalization_context"={"groups"={"post"}},
 *              "validation_groups"={"postValidation"},
 *              "normalization_context"={"groups"={"get-from-demande"}}
 *          },
 *          "get"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "normalization_context"={"groups"={"get-from-demande"}}
 *           }
 *     },
 *     itemOperations={
 *          "get"={
 *                  "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object.getAcheteur() == user)",
 *                   "normalization_context"={"groups"={"get-from-demande"}}

 *                },
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object.getAcheteur() == user)",
 *              "denormalization_context"={"groups"={"put"}},
 *              "validation_groups"={"putValidation"}
 *          },
 *          "delete"={"access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object.getAcheteur() == user)"}
 *     },
 *
 *     attributes={"order"={"created":"desc"}},
 *     subresourceOperations={
 *          "api_acheteurs_demandes_get_subresource"={
 *              "security"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object.getAcheteur() == user)",
 *              "method"="GET",
 *              "normalization_context"={"groups"={"get-from-acheteur_demandes"}}
 *          }
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\DemandeAchatRepository")
 * @UniqueEntity("reference", groups={"postValidation","putValidation"})
 */
class DemandeAchat implements CreatedEntityInterface,SetAcheteurInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"get-from-demande","get-from-acheteur_demandes"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Acheteur",inversedBy="demandes")
     * @Groups({"get-from-demande"})
     */
    private $acheteur;

    /**
     * @ORM\Column(type="smallint",length=1)
     * @Groups({"get-from-demande","put-admin","get-from-acheteur_demandes"})
     *
     */
    private $statut;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"get-from-demande","post","get-from-acheteur_demandes"})
     * @Assert\NotBlank(groups={"postValidation"})
     */
    private $reference;

    /**
     * @ORM\Column(type="text")
     * @Assert\NotBlank(groups={"postValidation"})
     * @Groups({"get-from-demande","post","put","get-from-acheteur_demandes"})
     */
    private $description;

    /**
     * @ORM\Column(type="datetime")
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\DateTime(groups={"postValidation","putValidation"})
     * @Groups({"get-from-demande","post","put","get-from-acheteur_demandes"})
     */
    private $dateExpiration;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get-from-demande","post","put","get-from-acheteur_demandes"})
     */
    private $isPublic;

    /**
     * @ORM\Column(type="integer",nullable=true)
     * @Groups({"get-from-demande","get-from-acheteur_demandes"})
     */
    private $nbrVisite;

    /**
     * @ORM\Column(type="integer",nullable=true)
     * @Groups({"get-from-demande","get-from-acheteur_demandes"})
     */
    private $nbrShare;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"get-from-demande","get-from-acheteur_demandes"})
     */
    private $created;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"get-from-demande","get-from-acheteur_demandes"})
     */
    private $dateModification;

    /**
     * @ORM\Column(type="boolean")
     */
    private $isAlerted;

    /**
     * @Groups({"put-admin"})
     */
    public $sendEmail;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get-from-demande","post","put","get-from-acheteur_demandes"})
     */
    private $isAnonyme;

    /**
     * @ORM\Column(type="string", length=4,nullable=true)
     * @Groups({"get-from-demande","post","put","get-from-acheteur_demandes"})
     */
    private $langueP;

    /**
     * @ORM\Column(type="text",nullable=true)
     * @Groups({"get-from-demande","post","put","get-from-acheteur_demandes"})
     */
    private $descriptionEn;

    /**
     * @ORM\Column(type="text",nullable=true)
     * @Groups({"get-from-demande","post","put","get-from-acheteur_demandes"})
     */
    private $descriptionEs;

    /**
     * @ORM\ManyToMany(targetEntity="Attachement")
     * @ORM\JoinTable()
     * @Groups({"put","post"})
     * @Assert\NotBlank()
     * @ApiSubresource()
     */
    private $attachements;

    /**
     * @ORM\ManyToMany(targetEntity="SousSecteur")
     * @ORM\JoinTable(name="demande_ha_sous_secteur")
     * @Groups({"get-from-demande","put","post","get-from-acheteur_demandes"})
     * @Assert\NotBlank()
     * @ApiSubresource()
     */
    private $sousSecteurs;


    /**
     * @ORM\OneToMany(targetEntity="DiffusionDemande", mappedBy="demande")
     * @ApiSubresource()
     */
    private $diffusionsdemandes;


    public function __construct()
    {
        $this->statut=false;
        $this->isAnonyme=false;
        $this->isAlerted=false;
        $this->isPublic=false;
        $this->nbrVisite=0;
        $this->nbrShare=0;
        $this->attachements = new ArrayCollection();
        $this->diffusionsdemandes = new ArrayCollection();
        $this->sousSecteurs = new ArrayCollection();
        $this->dateModification = new \DateTime();

    }

    public function getId(): ?int
    {
        return $this->id;
    }


    public function getAcheteur()
    {
        return $this->acheteur;
    }


    public function setAcheteur(Acheteur $acheteur): SetAcheteurInterface
    {
        $this->acheteur = $acheteur;
        return $this;
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

    public function getAttachements() : Collection
    {
        return $this->attachements;
    }

    public function addAttachement(Attachement $attachement){

        $this->attachements->add($attachement);

    }

    public function removeAttachement(Attachement $attachement){

        $this->attachements->removeElement($attachement);

    }

    public function getSousSecteurs() : Collection
    {
        return $this->sousSecteurs;
    }

    public function addSousSecteur(SousSecteur $sousSecteur){

        $this->sousSecteurs->add($sousSecteur);

    }

    public function removeSousSecteur(SousSecteur $sousSecteur){

        $this->sousSecteurs->removeElement($sousSecteur);

    }


    /**
     * @return mixed
     */
    public function getNbrShare()
    {
        return $this->nbrShare;
    }

    /**
     * @param mixed $nbrShare
     */
    public function setNbrShare($nbrShare): void
    {
        $this->nbrShare = $nbrShare;
    }


    public function getDiffusionsdemandes() : Collection
    {
        return $this->diffusionsdemandes;
    }

    /**
     * @return mixed
     */
    public function getLangueP()
    {
        return $this->langueP;
    }

    /**
     * @param mixed $langueP
     */
    public function setLangueP($langueP): void
    {
        $this->langueP = $langueP;
    }







}
