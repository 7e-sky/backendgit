<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Interfaces\CreatedEntityInterface;
use App\Interfaces\SetFournisseurInterface;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Serializer\Filter\PropertyFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\BooleanFilter;
use Gedmo\Mapping\Annotation as Gedmo;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\DateFilter;

/**
 * @ApiFilter(DateFilter::class, properties={"created"})
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "titre": "partial",
 *     "titreLower": "partial",
 *     "description": "partial",
 *     "reference": "partial",
 *     "fournisseur": "exact",
 *     "fournisseur.societe": "partial",
 *     "slug": "exact",
 *     "pu": "exact",
 *     "categorie": "exact",
 *     "categorie.slug": "exact",
 *     "categorie.name": "partial",
 *     "pays.slug": "exact",
 *     "ville.slug": "exact",
 *     "secteur.slug": "exact",
 *     "secteur.name": "partial",
 *     "sousSecteurs.slug": "exact",
 *     "sousSecteurs.name": "partial",
 *
 *      }
 * )
 * @ApiFilter(BooleanFilter::class, properties={"isValid","free"})
 * @ApiFilter(OrderFilter::class, properties={"reference","description","created","pu","isValid","sousSecteurs.name"})
 * @ApiFilter(
 *     PropertyFilter::class,
 *     arguments={
 *     "parameterName": "props",
 *     "overrideDefaultProperties": false,
 *     "whitelist": {"id","slug","categorie","sousSecteurs","secteur","fournisseur","reference","titre","description","pu","currency","featuredImageId"},
 *      }
 * )
 * @ApiResource(
 *      collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "denormalization_context"={"groups"={"produit:post"}},
 *              "validation_groups"={"produit:postValidation"},
 *              "normalization_context"={"groups"={"produit:get-item"}}
 *          },
 *          "get"={
 *              "normalization_context"={"groups"={"produit:get-all"}}
 *           }
 *
 *     },
 *     itemOperations={
 *
 *          "get"={
 *                  "normalization_context"={"groups"={"produit:get-item","produit:get-all"}}
 *                },
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object.getFournisseur() == user)",
 *              "denormalization_context"={"groups"={"produit:put"}},
 *              "validation_groups"={"produit:putValidation"}
 *          }
 *     },
 *
 *     attributes={"pagination_items_per_page"=10,"pagination_client_items_per_page"=true,"maximum_items_per_page"=100},
 *     subresourceOperations={
 *          "api_fournisseurs_produits_get_subresource"={
 *              "method"="GET",
 *              "normalization_context"={"groups"={"produit:get-from-fournisseur"}}
 *          }
 *     }
 * )
 * @ORM\Table(name="produit",indexes={@ORM\Index(name="indexes_p_title", columns={"titre_lower"}),@ORM\Index(name="indexes_produit", columns={"titre"}),@ORM\Index(name="indexes_produit2", columns={"is_valid"}),@ORM\Index(name="indexes_produit3", columns={"del"})})
 * @ORM\Entity(repositoryClass="App\Repository\ProduitRepository")
 */
class Produit implements CreatedEntityInterface,SetFournisseurInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"selectProduit:get-all","produit:get-all","produit:get-from-fournisseur","demandeDevis:get-all"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"selectProduit:get-all","produit:get-all","produit:get-from-fournisseur","produit:post","produit:put","demandeDevis:get-all"})
     * @Assert\NotBlank(groups={"produit:postValidation","produit:putValidation"})
     */
    private $reference;

    /**
     * @ORM\Column(type="string", length=100)
     * @Groups({"selectProduit:get-all","produit:get-all","produit:get-from-fournisseur","produit:post","produit:put","demandeDevis:get-all"})
     * @Assert\NotBlank(groups={"produit:postValidation","produit:putValidation"})
     * @Assert\Length(min=6,max=100,groups={"produit:postValidation","produit:putValidation"})
     */
    private $titre;

    /**
     * @ORM\Column(type="string", length=100)
     */
    private $titreLower;

    /**
     * @ORM\ManyToOne(targetEntity="Secteur",inversedBy="produits")
     * @Groups({"produit:get-all","produit:get-from-fournisseur","produit:post","produit:put","demandeDevis:get-item"})
     */
    private $secteur;

    /**
     * @ORM\ManyToOne(targetEntity="SousSecteur")
     * @Groups({"selectProduit:get-all","produit:get-all","produit:get-from-fournisseur","produit:post","produit:put","demandeDevis:get-item"})
     * @Assert\NotBlank(groups={"produit:postValidation","produit:putValidation"})
     */
    private $sousSecteurs;

    /**
     * @ORM\ManyToOne(targetEntity="Categorie")
     * @Groups({"selectProduit:get-all","produit:get-all","produit:get-from-fournisseur","produit:post","produit:put","demandeDevis:get-item"})
     */
    private $categorie;

    /**
     * @ORM\ManyToOne(targetEntity="Fournisseur")
     * @Groups({"selectProduit:get-all","produit:get-item"})
     */
    private $fournisseur;

    /**
     * @ORM\ManyToOne(targetEntity="Fiche")
     * @Groups({"produit:post","produit:put","demandeDevis:get-item","produit:get-all","selectProduit:get-all"})
     */
    private $ficheTechnique;

    /**
     * @ORM\ManyToMany(targetEntity="ImageProduit")
     * @Groups({"produit:post","produit:put","demandeDevis:get-item","produit:get-all","selectProduit:get-all"})
     * @ORM\JoinTable()
     */
    private $images;

    /**
     * @ORM\Column(type="text")
     * @Groups({"produit:get-all","produit:get-from-fournisseur","selectProduit:get-all","produit:post","produit:put","demandeDevis:get-item"})
     * @Assert\NotBlank(groups={"produit:postValidation"})
     * @Assert\Length(min=10,groups={"produit:postValidation","produit:putValidation"})
     * @Assert\Regex(
     *     pattern="/[a-zA-Z0-9!@#$%^&*(),'.?:{}|<> -_]{10,}/",
     *     message="Description (minimum de 10 caractères alphanumériques, espace ou symbôles)",
     *     groups={"produit:postValidation","produit:putValidation"}
     * )
     */
    private $description;

    /**
     * @ORM\Column(type="float")
     * @Groups({"produit:get-all","selectProduit:get-all","produit:get-from-fournisseur","produit:post","produit:put","demandeDevis:get-item"})
     */
    private $pu;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get-owner","produit:get-from-fournisseur","produit:put"})
     */
    private $del;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get-owner","get-admin","put-admin"})
     */
    private $isSelect;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get-owner","get-admin","produit:get-from-fournisseur","put-admin"})
     */
    private $isValid;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"get-owner","produit:get-from-fournisseur","demandeDevis:get-item"})
     */
    private $created;

    /**
     * @ORM\Column(type="datetime",nullable=true)
     */
    private $dateValidation;

    /**
     * @ORM\Column(type="string", length=255,nullable=true)
     * @Groups({"selectProduit:get-all","produit:post","produit:put","demandeDevis:get-item","produit:get-all"})
     */
    private $videos;

    /**
     * @ORM\ManyToOne(targetEntity="ImageProduit")
     * @Groups({"selectProduit:get-all","produit:get-from-fournisseur","produit:get-all","produit:post","produit:put","demandeDevis:get-item"})
     */
    private $featuredImageId;


    /**
     * @ORM\ManyToOne(targetEntity="Pays")
     * @Groups({"produit:get-all"})
     */
    private $pays;

    /**
     * @ORM\ManyToOne(targetEntity="Ville")
     * @Groups({"produit:get-all"})
     */
    private $ville;

    /**
     * @ORM\ManyToOne(targetEntity="Currency")
     * @Groups({"produit:get-all","selectProduit:get-all","demandeDevis:get-item"})
     */
    private $currency;

    /**
     * @Gedmo\Slug(fields={"titre"})
     * @ORM\Column(length=128, unique=true)
     * @Groups({"produit:get-from-fournisseur","produit:get-all","selectProduit:get-all"})
     */
    private $slug;

    /**
     * @ORM\Column(type="integer")
     * @Groups({"get-owner"})
     */
    private $phone_vu=0;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"produit:get-all","produit:get-from-fournisseur","produit:post"})
     */
    private $free=false;

    public function __construct()
    {
        $this->del=false;
        $this->isSelect=false;
        $this->isValid=false;
        $this->pu=0;
        $this->images = new ArrayCollection();

    }

    public function getId(): ?int
    {
        return $this->id;
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
    public function getTitre()
    {
        return $this->titre;
    }

    /**
     * @param mixed $titre
     */
    public function setTitre($titre): void
    {
        $this->titre = $titre;
    }

    /**
     * @return mixed
     */
    public function getTitreLower()
    {
        return $this->titreLower;
    }

    /**
     * @param mixed $titreLower
     */
    public function setTitreLower($titreLower): void
    {
        $this->titreLower = $titreLower;
    }


    /**
     * @return mixed
     */
    public function getSecteur()
    {
        return $this->secteur;
    }

    /**
     * @param mixed $secteur
     */
    public function setSecteur($secteur): void
    {
        $this->secteur = $secteur;
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
    public function getCategorie()
    {
        return $this->categorie;
    }

    /**
     * @param mixed $categorie
     */
    public function setCategorie($categorie): void
    {
        $this->categorie = $categorie;
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
    public function getFicheTechnique()
    {
        return $this->ficheTechnique;
    }

    /**
     * @param mixed $ficheTechnique
     */
    public function setFicheTechnique($ficheTechnique): void
    {
        $this->ficheTechnique = $ficheTechnique;
    }


    public function getImages() : Collection
    {
        return $this->images;
    }

    public function addImage(ImageProduit $imageProduit){

        $this->images->add($imageProduit);

    }

    public function removeImage(ImageProduit $imageProduit){

        $this->images->removeElement($imageProduit);

    }
    /**
     * @return mixed
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param mixed $description
     */
    public function setDescription($description): void
    {
        $this->description = $description;
    }

    /**
     * @return mixed
     */
    public function getPu()
    {
        return $this->pu;
    }

    /**
     * @param mixed $pu
     */
    public function setPu($pu): void
    {
        $this->pu = $pu;
    }

    /**
     * @return mixed
     */
    public function getDel()
    {
        return $this->del;
    }

    /**
     * @param mixed $del
     */
    public function setDel($del): void
    {
        $this->del = $del;
    }

    /**
     * @return mixed
     */
    public function getisSelect()
    {
        return $this->isSelect;
    }

    /**
     * @param mixed $isSelect
     */
    public function setIsSelect($isSelect): void
    {
        $this->isSelect = $isSelect;
    }

    /**
     * @return mixed
     */
    public function getisValid()
    {
        return $this->isValid;
    }

    /**
     * @param mixed $isValid
     */
    public function setIsValid($isValid): void
    {
        $this->isValid = $isValid;
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
    public function getVideos()
    {
        return $this->videos;
    }

    /**
     * @param mixed $videos
     */
    public function setVideos($videos): void
    {
        $this->videos = $videos;
    }

    /**
     * @return mixed
     */
    public function getFeaturedImageId()
    {
        return $this->featuredImageId;
    }

    /**
     * @param mixed $featuredImageId
     */
    public function setFeaturedImageId($featuredImageId): void
    {
        $this->featuredImageId = $featuredImageId;
    }

    /**
     * @return mixed
     */
    public function getDateValidation()
    {
        return $this->dateValidation;
    }

    /**
     * @param mixed $dateValidation
     */
    public function setDateValidation($dateValidation): void
    {
        $this->dateValidation = $dateValidation;
    }

    /**
     * @return mixed
     */
    public function getPays()
    {
        return $this->pays;
    }

    /**
     * @param mixed $pays
     */
    public function setPays($pays): void
    {
        $this->pays = $pays;
    }

    /**
     * @return mixed
     */
    public function getVille()
    {
        return $this->ville;
    }

    /**
     * @param mixed $ville
     */
    public function setVille($ville): void
    {
        $this->ville = $ville;
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

    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * @return mixed
     */
    public function getPhoneVu()
    {
        return $this->phone_vu;
    }

    /**
     * @param mixed $phone_vu
     */
    public function setPhoneVu($phone_vu): void
    {
        $this->phone_vu = $phone_vu;
    }

    /**
     * @return mixed
     */
    public function getFree()
    {
        return $this->free;
    }

    /**
     * @param mixed $free
     */
    public function setFree($free): void
    {
        $this->free = $free;
    }



}
