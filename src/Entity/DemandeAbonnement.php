<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Annotation\ApiSubresource;
use App\Interfaces\CreatedEntityInterface;
use App\Interfaces\SetFournisseurInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *      collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "denormalization_context"={"groups"={"dmdAbonnement:post"}},
 *              "validation_groups"={"dmdAbonnement:postValidation"},
 *              "normalization_context"={"groups"={"dmdAbonnement:get-all"}}
 *          },
 *          "get"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "normalization_context"={"groups"={"dmdAbonnement:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *          "get"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "normalization_context"={"groups"={"dmdAbonnement:get-item","dmdAbonnement:get-all"}}
 *          },
 *          "put"={
 *              "denormalization_context"={"groups"={"dmdAbonnement:put"}},
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object.getFournisseur() == user)",
 *              "validation_groups"={"dmdAbonnement:putValidation"}
 *          }
 *     },
 *     attributes={
 *     "pagination_items_per_page"=10
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\DemandeAbonnementRepository")
 */
class DemandeAbonnement implements CreatedEntityInterface,SetFournisseurInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"dmdAbonnement:get-all"})
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Offre")
     * @Groups({"dmdAbonnement:get-all","dmdAbonnement:post","dmdAbonnement:put"})
     * @Assert\NotBlank(groups={"dmdAbonnement:postValidation","dmdAbonnement:putValidation"})
     */
    private $offre;

    /**
     * @ORM\ManyToOne(targetEntity="Fournisseur")
     * @Groups({"dmdAbonnement:get-all"})
     */
    private $fournisseur;

    /**
     * @ORM\ManyToOne(targetEntity="ZoneCommercial")
     * @Groups({"dmdAbonnement:get-all"})
     */
    private $zone;

    /**
     * @ORM\ManyToOne(targetEntity="Commercial")
     * @Groups({"dmdAbonnement:get-all"})
     */
    private $commercial;

    /**
     * @ORM\ManyToMany(targetEntity="SousSecteur")
     * @ORM\JoinTable(name="demande_abonnement_sous_secteur")
     * @Groups({"dmdAbonnement:get-all","dmdAbonnement:post","dmdAbonnement:put"})
     * @Assert\NotBlank(groups={"dmdAbonnement:postValidation","dmdAbonnement:putValidation"})
     */
    private $sousSecteurs;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"dmdAbonnement:get-all"})
     */
    private $reference;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"dmdAbonnement:get-all"})
     */
    private $statut;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"dmdAbonnement:get-all"})
     */
    private $created;

    public function __construct()
    {
        $this->statut=false;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getReference()
    {
        return $this->reference;
    }

    public function setReference($reference): self
    {
        $this->reference = $reference;

        return $this;
    }

    public function getStatut()
    {
        return $this->statut;
    }

    public function setStatut($statut): self
    {
        $this->statut = $statut;

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
    public function getOffre()
    {
        return $this->offre;
    }

    /**
     * @param mixed $offre
     */
    public function setOffre($offre): void
    {
        $this->offre = $offre;
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

    /**
     * @return mixed
     */
    public function getZone()
    {
        return $this->zone;
    }

    /**
     * @param mixed $zone
     */
    public function setZone($zone): void
    {
        $this->zone = $zone;
    }

    /**
     * @return mixed
     */
    public function getCommercial()
    {
        return $this->commercial;
    }

    /**
     * @param mixed $commercial
     */
    public function setCommercial($commercial): void
    {
        $this->commercial = $commercial;
    }

    /**
     * @return mixed
     */
    public function getSousSecteurs()
    {
        return $this->sousSecteurs;
    }

    /**
     * @param mixed $sousSecteurs
     */
    public function setSousSecteurs($sousSecteurs): void
    {
        $this->sousSecteurs = $sousSecteurs;
    }


}
