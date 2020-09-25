<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use App\Interfaces\CreatedEntityInterface;
use App\Interfaces\SetFournisseurInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\DateFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\BooleanFilter;
use ApiPlatform\Core\Serializer\Filter\PropertyFilter;

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
 * @ApiFilter(
 *     PropertyFilter::class,
 *     arguments={
 *     "parameterName": "props",
 *     "overrideDefaultProperties": false,
 *     "whitelist": {"id","offre","fournisseur","created","statut"},
 *      }
 * )
 * @ApiFilter(OrderFilter::class, properties={"reference","created","statut","sousSecteurs.name"})
 * @ApiFilter(DateFilter::class, properties={"created"})
 * @ApiFilter(BooleanFilter::class, properties={"statut","type"})
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
 *              "access_control"="is_granted('ROLE_FOURNISSEUR') or ( is_granted('ROLE_FOURNISSEUR') && object.getFournisseur() == user )",
 *              "normalization_context"={"groups"={"dmdAbonnement:get-item","dmdAbonnement:get-all"}}
 *          },
 *          "put"={
 *              "denormalization_context"={"groups"={"dmdAbonnement:put"}},
 *              "access_control"="is_granted('ROLE_ADMIN') or ( is_granted('ROLE_FOURNISSEUR') and object.getFournisseur() == user )",
 *              "validation_groups"={"dmdAbonnement:putValidation"},
 *              "normalization_context"={"groups"={"dmdAbonnement:get-item","dmdAbonnement:get-all"}}
 *          }
 *     },
 *     subresourceOperations={
 *          "api_fournisseurs_demande_abonnements_get_subresource"={
 *              "security"="is_granted('ROLE_FOURNISSEUR')",
 *              "method"="GET",
 *              "normalization_context"={"groups"={"dmdAbonnement:get-all"}}
 *          }
 *     },
 *     attributes={
 *     "pagination_items_per_page"=10,
 *     "pagination_client_items_per_page"=true,
 *     "maximum_items_per_page"=100,
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\DemandeAbonnementRepository")
 */
class DemandeAbonnement implements CreatedEntityInterface, SetFournisseurInterface
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
     * @ORM\ManyToOne(targetEntity="Duree")
     * @Groups({"dmdAbonnement:get-all","dmdAbonnement:post","dmdAbonnement:put"})
     * @Assert\NotBlank(groups={"dmdAbonnement:postValidation","dmdAbonnement:putValidation"})
     */
    private $duree;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"abonnement:get-all","dmdAbonnement:get-all"})
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

    /**
     * @ORM\ManyToOne(targetEntity="Paiement")
     * @Groups({"dmdAbonnement:get-all","dmdAbonnement:post","dmdAbonnement:put"})
     * @Assert\NotBlank(groups={"dmdAbonnement:postValidation","dmdAbonnement:putValidation"})
     */
    private $mode;

    /**
     * @Groups({"put-admin"})
     */
    public $paiement;

    /**
     * @Groups({"put-admin"})
     */
    public $remise;

    /**
     * @ORM\Column(type="float")
     * @Groups({"dmdAbonnement:get-all"})
     */
    private $prix;

    /**
     * @ORM\Column(type="string",length=5)
     * @Groups({"dmdAbonnement:get-all"})
     */
    private $currency;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"dmdAbonnement:get-all","dmdAbonnement:post"})
     */
    private $type = false;

    /**
     * @ORM\Column(type="array",nullable=true)
     * @Groups({"dmdAbonnement:get-all","dmdAbonnement:post","dmdAbonnement:put"})
     */
    private $suggestions;


    public function __construct()
    {
        $this->statut = false;
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

    public function getZone()
    {
        return $this->zone;
    }

    public function setZone($zone): void
    {
        $this->zone = $zone;
    }

    public function getCommercial()
    {
        return $this->commercial;
    }

    public function setCommercial($commercial): void
    {
        $this->commercial = $commercial;
    }

    public function getSousSecteurs()
    {
        return $this->sousSecteurs;
    }

    public function setSousSecteurs($sousSecteurs): void
    {
        $this->sousSecteurs = $sousSecteurs;
    }

    public function getDuree()
    {
        return $this->duree;
    }

    public function setDuree($duree): void
    {
        $this->duree = $duree;
    }

    public function getMode()
    {
        return $this->mode;
    }

    public function setMode($mode): void
    {
        $this->mode = $mode;
    }

    public function getPrix()
    {
        return $this->prix;
    }

    public function setPrix($prix): void
    {
        $this->prix = $prix;
    }

    public function getCurrency()
    {
        return $this->currency;
    }

    public function setCurrency($currency): void
    {
        $this->currency = $currency;
    }

    public function getType()
    {
        return $this->type;
    }

    public function setType($type): void
    {
        $this->type = $type;
    }

    /**
     * @return mixed
     */
    public function getSuggestions()
    {
        return $this->suggestions;
    }

    /**
     * @param mixed $suggestions
     */
    public function setSuggestions($suggestions): void
    {
        $this->suggestions = $suggestions;
    }


}
