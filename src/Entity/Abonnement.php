<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use App\Interfaces\CreatedEntityInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\ExistsFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\DateFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\BooleanFilter;

/**
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *      "reference": "partial",
 *      "offre.name": "partial",
 *      "fournisseur.societe": "partial",
 *      "mode.name": "partial",
 *      "sousSecteurs.name": "partial",
 *      }
 * )
 * @ApiFilter(BooleanFilter::class, properties={"statut"})
 * @ApiFilter(ExistsFilter::class, properties={"expired"})
 * @ApiFilter(DateFilter::class, properties={"created","expired"})
 * @ApiFilter(OrderFilter::class, properties={"reference","created","expired","statut","sousSecteurs.name"})
 * @ApiResource(
 *      collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"abonnement:post"}},
 *              "validation_groups"={"abonnement:postValidation"},
 *              "normalization_context"={"groups"={"abonnement:get-all"}}
 *          },
 *          "get"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "normalization_context"={"groups"={"abonnement:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *          "get"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "normalization_context"={"groups"={"abonnement:get-item","abonnement:get-all"}}
 *          },
 *          "put"={
 *              "denormalization_context"={"groups"={"abonnement:put"}},
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "validation_groups"={"abonnement:putValidation"}
 *          }
 *     },
 *     subresourceOperations={
 *          "api_fournisseurs_abonnements_get_subresource"={
 *               "normalization_context"={"groups"={"abonnement:get-all"}}
 *          }
 *     },
 *     attributes={
 *     "pagination_items_per_page"=10,
 *     "pagination_client_items_per_page"=true,
 *     "maximum_items_per_page"=100,
 *
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\AbonnementRepository")
 */
class Abonnement implements CreatedEntityInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"abonnement:get-all"})
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Offre")
     * @Groups({"abonnement:get-all","abonnement:post","abonnement:put"})
     * @Assert\NotBlank(groups={"abonnement:postValidation","abonnement:putValidation"})
     */
    private $offre;

    /**
     * @ORM\ManyToOne(targetEntity="DemandeAbonnement")
     * @Groups({"abonnement:get-all","abonnement:post","abonnement:put"})
     *
     */
    private $demande;

    /**
     * @ORM\ManyToOne(targetEntity="Fournisseur")
     * @Groups({"abonnement:get-item","abonnement:get-all","abonnement:post"})
     * @Assert\NotBlank(groups={"abonnement:postValidation"})
     */
    private $fournisseur;


    /**
     * @ORM\ManyToOne(targetEntity="ZoneCommercial")
     * @Groups({"abonnement:get-all"})
     */
    private $zone;

    /**
     * @ORM\ManyToOne(targetEntity="Commercial")
     * @Groups({"abonnement:get-all"})
     */
    private $commercial;

    /**
     * @ORM\ManyToMany(targetEntity="SousSecteur")
     * @ORM\JoinTable(name="abonnement_sous_secteur")
     * @Groups({"abonnement:get-all","abonnement:post","abonnement:put"})
     * @Assert\NotBlank(groups={"abonnement:postValidation","abonnement:putValidation"})
     */
    private $sousSecteurs;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"abonnement:get-all"})
     */
    private $reference;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"abonnement:get-all","abonnement:post","abonnement:put"})
     */
    private $statut;

    /**
     * @ORM\Column(type="float")
     * @Groups({"abonnement:get-all"})
     */
    private $prix;

    /**
     * @ORM\ManyToOne(targetEntity="Paiement")
     * @Groups({"abonnement:get-all","abonnement:post","abonnement:put"})
     * @Assert\NotBlank(groups={"abonnement:postValidation","abonnement:putValidation"})
     */
    private $mode;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"abonnement:get-all"})
     */
    private $created;

    /**
     * @ORM\Column(type="datetime",nullable=true)
     * @Groups({"abonnement:get-all"})
     */
    private $expired;

    /**
     * @ORM\Column(type="datetime",nullable=true)
     * @Groups({"abonnement:get-all"})
     */
    private $datePeiment;

    /**
     * @ORM\Column(type="float")
     * @Groups({"abonnement:get-all","abonnement:put","abonnement:post"})
     */
    private $remise;

    /**
     * @ORM\ManyToOne(targetEntity="Duree")
     * @Groups({"abonnement:get-all","abonnement:post","abonnement:put"})
     * @Assert\NotBlank(groups={"abonnement:postValidation","abonnement:putValidation"})
     */
    private $duree;

    /**
     * @ORM\ManyToOne(targetEntity="Currency")
     * @Groups({"abonnement:get-all","abonnement:post"})
     */
    private $currency;

    /**
     * @ORM\Column(type="string",length=1000,nullable=true)
     * @Groups({"abonnement:get-all","abonnement:post","abonnement:put"})
     */
    private $commentaire;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"abonnement:get-all","abonnement:post"})
     */
    private $type = false;

    public function __construct()
    {
        $this->statut=false;
        $this->remise=0;
    }

    public function getId(): ?int
    {
        return $this->id;
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

    /**
     * @return mixed
     */
    public function getReference()
    {
        return $this->reference;
    }

    /**
     * @param mixed $reference
     */
    public function setReference($reference): void
    {
        $this->reference = $reference;
    }

    /**
     * @return mixed
     */
    public function getStatut()
    {
        return $this->statut;
    }

    /**
     * @param mixed $statut
     */
    public function setStatut($statut): void
    {
        $this->statut = $statut;
    }

    /**
     * @return mixed
     */
    public function getPrix()
    {
        return $this->prix;
    }

    /**
     * @param mixed $prix
     */
    public function setPrix($prix): void
    {
        $this->prix = $prix;
    }

    /**
     * @return mixed
     */
    public function getMode()
    {
        return $this->mode;
    }

    /**
     * @param mixed $mode
     */
    public function setMode($mode): void
    {
        $this->mode = $mode;
    }

    /**
     * @return mixed
     */
    public function getCreated()
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
    public function getExpired()
    {
        return $this->expired;
    }

    /**
     * @param mixed $expired
     */
    public function setExpired($expired): void
    {
        $this->expired = $expired;
    }

    /**
     * @return mixed
     */
    public function getDatePeiment()
    {
        return $this->datePeiment;
    }

    /**
     * @param mixed $datePeiment
     */
    public function setDatePeiment($datePeiment): void
    {
        $this->datePeiment = $datePeiment;
    }

    /**
     * @return mixed
     */
    public function getRemise()
    {
        return $this->remise;
    }

    /**
     * @param mixed $remise
     */
    public function setRemise($remise): void
    {
        $this->remise = $remise;
    }

    /**
     * @return mixed
     */
    public function getDuree()
    {
        return $this->duree;
    }

    /**
     * @param mixed $duree
     */
    public function setDuree($duree): void
    {
        $this->duree = $duree;
    }

    /**
     * @return mixed
     */
    public function getCurrency()
    {
        return $this->currency;
    }

    /**
     * @param mixed $currency
     */
    public function setCurrency($currency): void
    {
        $this->currency = $currency;
    }

    /**
     * @return mixed
     */
    public function getCommentaire()
    {
        return $this->commentaire;
    }

    /**
     * @param mixed $commentaire
     */
    public function setCommentaire($commentaire): void
    {
        $this->commentaire = $commentaire;
    }

    /**
     * @return mixed
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * @param mixed $type
     */
    public function setType($type): void
    {
        $this->type = $type;
    }






}
