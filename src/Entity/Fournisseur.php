<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Annotation\ApiSubresource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\BooleanFilter;
use Misd\PhoneNumberBundle\Validator\Constraints\PhoneNumber as AssertPhoneNumber;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Core\Serializer\Filter\PropertyFilter;
use Gedmo\Mapping\Annotation as Gedmo;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\DateFilter;

/**
 * @ApiResource(
 *
 *     collectionOperations={
 *
 *     "post"={
 *              "denormalization_context"={"groups"={"post"}},
 *              "validation_groups"={"postValidation"},
 *
 *     },
 *     "get"={}
 *      },
 *     itemOperations={
 *     "get"={
 *          "normalization_context"={"groups"={"get"}},
 *          "defaults"={"del"="false"}
 *          },
 *     "put"={
 *          "access_control"="is_granted('ROLE_ADMIN') or ((is_granted('ROLE_FOURNISSEUR') or is_granted('ROLE_FOURNISSEUR_PRE')) and object == user)",
 *           "denormalization_context"={"groups"={"put"}},
 *              "validation_groups"={"putValidation"}
 *          }
 *     },
 *     attributes={
 *     "normalization_context"={"groups"={"get"}},
 *     "pagination_client_enabled"=true,
 *     "pagination_items_per_page"=10,
 *     "pagination_client_items_per_page"=true,
 *     "maximum_items_per_page"=100,
 *     "order"={"id":"desc"}
 *     },
 * )
 * @ApiFilter(
 *     BooleanFilter::class,properties={"del","isactif"}
 * )
 * @ApiFilter(DateFilter::class, properties={"created"})
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "societe": "partial",
 *     "societeLower": "start",
 *     "categories.slug": "exact",
 *     "pays.slug": "exact",
 *     "ville.slug": "exact",
 *     "categories.sousSecteurs.secteur.slug": "exact",
 *     "categories.sousSecteurs.slug": "exact",
 *     "phone": "partial",
 *     "email": "partial",
 *     "firstName": "partial",
 *     "lastName": "partial"
 *      }
 * )
 * @ApiFilter(
 *     PropertyFilter::class,
 *     arguments={
 *     "parameterName": "props",
 *     "overrideDefaultProperties": false,
 *     "whitelist": {"id","societe","categories","firstName","lastName","slug","pays","avatar"},
 *      }
 * )
 * @ApiFilter(OrderFilter::class, properties={"id","visite","created","isactif","societe"})
 * @ORM\Table(name="fournisseur",indexes={@ORM\Index(name="indexe_fournisseur", columns={"societe"}),@ORM\Index(name="indexe_societe", columns={"societe_lower"})})
 * @ORM\Entity(repositoryClass="App\Repository\FournisseurRepository")
 *
 */
class Fournisseur extends User
{

    /**
     * @ORM\ManyToOne(targetEntity="Pays",inversedBy="fournisseurs")
     * @Groups({"produit:get-item","abonnement:get-item","dmdAbonnement:get-item","get","post","put"})
     */
    private $pays;

    /**
     * @ORM\ManyToOne(targetEntity="Ville")
     * @Groups({"produit:get-item","abonnement:get-item","dmdAbonnement:get-item","get","post","put"})
     */
    private $ville;

    /**
     * @ORM\OneToMany(targetEntity="Personnel",mappedBy="fournisseur")
     * @ApiSubresource(maxDepth=1)
     */
    private $personnels;


    /**
     * add mapped by if you want to miggrate
     * @ORM\ManyToMany(targetEntity="Categorie", inversedBy="fournisseurs")
     * @ORM\JoinTable(name="fournisseur_categories")
     * @Groups({"abonnement:get-item","dmdAbonnement:get-item","get","put","post"})
     * @Assert\NotBlank(groups={"putValidation"})
     * @ApiSubresource(maxDepth=1)
     */
    private $categories;


    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"produit:get-item","contactFournisseur:get-all","selectProduit:get-all","abonnement:get-item","abonnement:get-all","dmdAbonnement:get-all","demandeDevis:get-all","jeton:get-item","jeton:get-all","d-jeton:get-all","d-jeton:get-item","get","put","post","get-from-demande","get-from-diffusionDemande","get-from-blacklist","get-from-acheteurs_blacklistes"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\Length(min=3,max=255,groups={"postValidation","putValidation"})
     * @Assert\Regex(
     *     pattern="/[a-zA-Z0-9]{3,}/",
     *     message="Raison social (minimum de 3 caractères alphanumériques)",
     *     groups={"postValidation","putValidation"}
     * )
     */
    private $societe;

    /**
     * @ORM\Column(type="string", length=255,nullable=true)
     *
     */
    private $societeLower;

    /**
     * @ORM\Column(type="string", length=5)
     * @Groups({"abonnement:get-item","dmdAbonnement:get-item","get","put","post"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\Length(min=1,max=5,groups={"postValidation","putValidation"})
     */
    private $civilite;


    /**
     * @ORM\Column(type="string", length=15,nullable=true)
     * @Groups({"abonnement:get-item","dmdAbonnement:get-item","get","put","post"})
     * @Assert\Length(min=15,max=15,groups={"postValidation","putValidation"})
     */
    private $ice;

    /**
     * @ORM\Column(type="string", length=30,nullable=true)
     * @Groups({"abonnement:get-item","dmdAbonnement:get-item","get","put","post"})
     * @AssertPhoneNumber(
     *     groups={"postValidation","putValidation"},
     *     message="Veuillez entrer votre numéro en format international (Exemple Maroc) : +212522112244."
     *     )
     * @Assert\Length(min=10,max=15,groups={"postValidation","putValidation"})
     */
    private $fix;

    /**
     * @ORM\Column(type="string", length=30,nullable=true)
     * @Groups({"abonnement:get-item","dmdAbonnement:get-item","get","put","post"})
     */
    private $website;

    /**
     * @ORM\Column(type="text",nullable=true)
     * @Groups({"abonnement:get-item","dmdAbonnement:get-item","get","put","post"})
     * @Assert\Length(min=6,groups={"postValidation","putValidation"})
     */
    private $description;


    /**
     * @ORM\OneToMany(targetEntity="Produit", mappedBy="fournisseur")
     * @ApiSubresource(maxDepth=1)
     */
    private $produits;

    /**
     * @ORM\OneToMany(targetEntity="DemandeDevis", mappedBy="fournisseur")
     * @ApiSubresource(maxDepth=1)
     */
    private $demandes;

    /**
     * @ORM\OneToMany(targetEntity="ContactFournisseur", mappedBy="fournisseur")
     * @ApiSubresource(maxDepth=1)
     */
    private $messages;


    /**
     * @ORM\OneToMany(targetEntity="DemandeJeton", mappedBy="fournisseur")
     * @ApiSubresource(maxDepth=1)
     */
    private $commandes;

    /**
     * @ORM\ManyToOne(targetEntity="Currency")
     * @Groups({"abonnement:get-item","dmdAbonnement:get-item","get","post","put"})
     */
    private $currency;

    /**
     * @ORM\OneToMany(targetEntity="DemandeAbonnement",mappedBy="fournisseur")
     * @ApiSubresource(maxDepth=1)
     */
    private $demandeAbonnement;

    /**
     * @ORM\OneToMany(targetEntity="Abonnement",mappedBy="fournisseur")
     * @ApiSubresource(maxDepth=1)
     */
    private $abonnements;

    /**
     * @Gedmo\Slug(fields={"societe"})
     * @ORM\Column(length=128, unique=true)
     * @Groups({"produit:get-item","get"})
     */
    private $slug;

    /**
     * @ORM\Column(type="integer")
     * @Groups({"get","put","post"})
     */
    private $step;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get"})
     */
    protected $isComplet;

    /**
     * @ORM\Column(type="integer")
     */
    private $phone_vu=0;

    /**
     * @ORM\Column(type="integer")
     */
    private $visite=0;

    public function __construct()
    {
        parent::__construct();
        $this->categories = new ArrayCollection();
        $this->personnels = new ArrayCollection();
        $this->commandes = new ArrayCollection();
        $this->demandes = new ArrayCollection();
        $this->demandeAbonnement = new ArrayCollection();
        $this->abonnements = new ArrayCollection();
        $this->isComplet = false;
        $this->step = 1;
    }


    public function getPays()
    {
        return $this->pays;
    }


    public function setPays($pays): void
    {
        $this->pays = $pays;
    }


    public function getVille()
    {
        return $this->ville;
    }


    public function setVille($ville): void
    {
        $this->ville = $ville;
    }

    public function getPersonnels() : Collection
    {
        return $this->personnels;
    }

    public function getCommandes() : Collection
    {
        return $this->commandes;
    }

    /**
     * @return mixed
     */
    public function getCategories()
    {
        return $this->categories;
    }

    /**
     * @param mixed $categories
     */
    public function setCategories($categories): void
    {
        $this->categories = $categories;
    }




    /**
     * @return mixed
     */
    public function getSociete()
    {
        return $this->societe;
    }

    /**
     * @param mixed $societe
     */
    public function setSociete($societe): void
    {
        $this->societe = $societe;
    }

    /**
     * @return mixed
     */
    public function getSocieteLower()
    {
        return $this->societeLower;
    }

    /**
     * @param mixed $societeLower
     */
    public function setSocieteLower($societeLower): void
    {
        $this->societeLower = $societeLower;
    }


    /**
     * @return mixed
     */
    public function getCivilite()
    {
        return $this->civilite;
    }

    /**
     * @param mixed $civilite
     */
    public function setCivilite($civilite): void
    {
        $this->civilite = $civilite;
    }

    /**
     * @return mixed
     */
    public function getIce()
    {
        return $this->ice;
    }

    /**
     * @param mixed $ice
     */
    public function setIce($ice): void
    {
        $this->ice = $ice;
    }

    /**
     * @return mixed
     */
    public function getFix()
    {
        return $this->fix;
    }

    /**
     * @param mixed $fix
     */
    public function setFix($fix): void
    {
        $this->fix = $fix;
    }

    /**
     * @return mixed
     */
    public function getWebsite()
    {
        return $this->website;
    }

    /**
     * @param mixed $website
     */
    public function setWebsite($website): void
    {
        $this->website = $website;
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
    public function getProduits()
    {
        return $this->produits;
    }

    /**
     * @return mixed
     */
    public function getDemandes() : Collection
    {
        return $this->demandes;
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
    public function getDemandeAbonnement() : Collection
    {
        return $this->demandeAbonnement;
    }

    /**
     * @return mixed
     */
    public function getAbonnements() : Collection
    {
        return $this->abonnements;
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
    public function getMessages()
    {
        return $this->messages;
    }

    /**
     * @return mixed
     */
    public function getVisite()
    {
        return $this->visite;
    }

    /**
     * @param mixed $visite
     */
    public function setVisite($visite): void
    {
        $this->visite = $visite;
    }

    /**
     * @return mixed
     */
    public function getStep()
    {
        return $this->step;
    }

    /**
     * @param mixed $step
     */
    public function setStep($step): void
    {
        $this->step = $step;
    }

    /**
     * @return mixed
     */
    public function getisComplet()
    {
        return $this->isComplet;
    }

    /**
     * @param mixed $isComplet
     */
    public function setIsComplet($isComplet): void
    {
        $this->isComplet = $isComplet;
    }





}
