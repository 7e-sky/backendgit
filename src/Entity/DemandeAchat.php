<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
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
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\DateFilter;
use Gedmo\Mapping\Annotation as Gedmo;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\BooleanFilter;
use ApiPlatform\Core\Serializer\Filter\PropertyFilter;
/**
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "description": "partial",
 *     "reference": "partial",
 *     "titre": "partial",
 *     "budget": "exact",
 *     "statut": "exact",
 *     "isPublic": "exact",
 *     "categories.slug": "exact",
 *     "categories.name": "partial",
 *     "acheteur.societe": "partial",
 *     "acheteur.pays.slug": "exact",
 *     "acheteur.ville.slug": "exact",
 *     "categories.sousSecteurs.secteur.slug": "exact",
 *     "categories.sousSecteurs.slug": "exact",
 *     "historiques.fournisseur.id": "exact",
 *      }
 * )
 * @ApiFilter(
 *     BooleanFilter::class,properties={"isPublic"}
 * )
 * @ApiFilter(
 *     PropertyFilter::class,
 *     arguments={
 *     "parameterName": "props",
 *     "overrideDefaultProperties": false,
 *     "whitelist": {"id","slug","reference","titre","attachements","categories","description","pays","ville","dateExpiration","created"},
 *      }
 * )
 * @ApiFilter(OrderFilter::class, properties={"reference","description","dateExpiration","created","budget","isPublic","categories.name"})
 * @ApiFilter(DateFilter::class, properties={"dateExpiration","created"})
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ACHETEUR')",
 *              "denormalization_context"={"groups"={"post"}},
 *              "validation_groups"={"postValidation"},
 *              "normalization_context"={"groups"={"get-from-demande"}}
 *          },
 *          "get"={
 *              "normalization_context"={"groups"={"get-from-demande"}}
 *           },
 *          "get_by_fournisseur"={
 *              "method"="GET",
 *              "path"="/demande_achats/fournisseur",
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "normalization_context"={"groups"={"fournisseur:get-from-demande"}}
 *          }
 *     },
 *     itemOperations={
 *          "get"={
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object.getAcheteur() == user)",
 *              "normalization_context"={"groups"={"get-from-demande","item:get-from-demande"}}
 *           },
 *          "get_item_by_fournisseur"={
 *              "method"="GET",
 *              "path"="/demande_achats/{id}/fournisseur",
 *              "normalization_context"={"groups"={"fournisseur:get-item-from-demande"}}
 *          },
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object.getAcheteur() == user)",
 *              "denormalization_context"={"groups"={"put"}},
 *              "validation_groups"={"putValidation"}
 *          },
 *          "delete"={"access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object.getAcheteur() == user)"}
 *     },
 *
 *     attributes={"pagination_items_per_page"=10,"pagination_client_items_per_page"=true,"maximum_items_per_page"=100},
 *     subresourceOperations={
 *          "api_acheteurs_demandes_get_subresource"={
 *              "security"="is_granted('ROLE_ACHETEUR')",
 *              "method"="GET",
 *              "normalization_context"={"groups"={"get-from-acheteur_demandes"}}
 *          }
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\DemandeAchatRepository")
 * @ORM\EntityListeners({"App\EventListener\DemandeAchatChangedNotifier"})
 * @ORM\Table(name="demande_achat",
 *     indexes={
 *     @ORM\Index(name="statut_Index", columns={"statut"}),
 *     @ORM\Index(name="del_Index", columns={"del"}),
 *     @ORM\Index(name="desc_Index", columns={"description"}, flags={"fulltext"})
 * })
 * @Gedmo\Loggable
 */
class DemandeAchat implements CreatedEntityInterface, SetAcheteurInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"fournisseur:get-item-from-demande","get-from-demande","get-from-acheteur_demandes","fournisseur:get-from-demande"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Acheteur",inversedBy="demandes")
     * @Groups({"get-from-demande","get-from-acheteur_demandes","visit:get-item","visit:get-all"})
     */
    private $acheteur;

     /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Team")
     * @ORM\JoinColumn(nullable=false)
     */
    private $team;

    /**
     * @ORM\ManyToOne(targetEntity="Fournisseur")
     * @Groups({"item:get-from-demande"})
     */
    private $fournisseurGagne;

    /**
     * @ORM\ManyToOne(targetEntity="Currency")
     * @Groups({"fournisseur:get-item-from-demande","fournisseur:get-from-demande","visit:get-item","visit:get-all","item:get-from-demande","get-from-acheteur_demandes"})
     */
    private $currency;

    /**
     * 0 = En atttente, 1 = En cours , 2 = Refusée , 3 = Adjugée
     * @ORM\Column(type="smallint",length=1)
     * @Groups({"visit:get-all","get-from-demande","put-admin","get-from-acheteur_demandes","fournisseur:get-from-demande","fournisseur:get-item-from-demande"})
     *
     */
    private $statut;

    /**
     * @ORM\Column(type="smallint",length=1)
     * @Groups({"visit:get-all","item:get-from-demande","post","put","get-from-acheteur_demandes","fournisseur:get-from-demande","fournisseur:get-item-from-demande"})
     *
     */
    private $localisation=1;

    /**
     * @ORM\Column(type="string", length=50,nullable=true)
     * @Groups({"visit:get-item","visit:get-all","get-from-demande","get-from-acheteur_demandes","fournisseur:get-from-demande","fournisseur:get-item-from-demande"})
     *
     */
    private $reference;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank(groups={"postValidation"})
     * @Groups({"visit:get-item","visit:get-all","get-from-demande","post","put","get-from-acheteur_demandes","fournisseur:get-from-demande","fournisseur:get-item-from-demande"})
     *
     */
    private $titre;

    /**
     * @ORM\Column(type="text")
     * @Assert\NotBlank(groups={"postValidation"})
     * @Groups({"visit:get-item","visit:get-all","get-from-demande","post","put","get-from-acheteur_demandes","fournisseur:get-from-demande","fournisseur:get-item-from-demande"})
     */
    private $description;

    /**
     * @Gedmo\Versioned
     * @ORM\Column(type="datetime")
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\DateTime(groups={"postValidation","putValidation"})
     * @Assert\GreaterThan("+2 days",groups={"postValidation"},message="La date d'expiration doit être supérieure à {{ compared_value }}")
     * @Groups({"visit:get-item","visit:get-all","get-from-demande","post","put","get-from-acheteur_demandes","fournisseur:get-from-demande","fournisseur:get-item-from-demande"})
     */
    private $dateExpiration;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get-from-demande","post","put","get-from-acheteur_demandes"})
     */
    private $isPublic;

    /**
     * @ORM\Column(type="integer",nullable=true)
     * @Groups({"item:get-from-demande","get-from-acheteur_demandes"})
     */
    private $nbrVisite;

    /**
     * @ORM\Column(type="integer",nullable=true)
     * @Groups({"get-from-acheteur_demandes"})
     */
    private $nbrShare;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"visit:get-item","get-from-demande","get-from-acheteur_demandes","fournisseur:get-from-demande","fournisseur:get-item-from-demande"})
     */
    private $created;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"item:get-from-demande","get-from-acheteur_demandes"})
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
     * @Groups({"item:get-from-demande","post","put","get-from-acheteur_demandes","fournisseur:get-item-from-demande"})
     */
    private $isAnonyme;


    /**
     * @ORM\ManyToMany(targetEntity="Attachement")
     * @ORM\JoinTable()
     * @Groups({"get-from-demande","item:get-from-demande","visit:get-item","put","post","fournisseur:get-item-from-demande"})
     * @Assert\NotBlank()
     * @ApiSubresource(maxDepth=1)
     */
    private $attachements;

    /**
     * add mapped by if you want to miggrate
     * @ORM\ManyToMany(targetEntity="Categorie")
     * @ORM\JoinTable(name="demande_ha_categories")
     * @Groups({"visit:get-item","get-from-demande","put-admin","put","post","get-from-acheteur_demandes","fournisseur:get-from-demande","fournisseur:get-item-from-demande"})
     */
    private $categories;


    /**
     * @ORM\OneToMany(targetEntity="DiffusionDemande", mappedBy="demande",cascade={"persist"})
     * @Groups({"item:get-from-demande","get-from-acheteur_demandes"})
     * @ApiSubresource(maxDepth=1)
     */
    private $diffusionsdemandes;


    /**
     * @ORM\OneToMany(targetEntity="DetailVisite", mappedBy="demande",cascade={"persist"})
     * @ApiSubresource(maxDepth=1)
     */
    private $visites;


    /**
     * @ORM\ManyToOne(targetEntity="Motif")
     * @Groups({"item:get-from-demande","put","get-from-acheteur_demandes"})
     */
    private $motifRejet;


    /**
     * @ORM\Column(type="float")
     * @Assert\NotBlank()
     * @Groups({"visit:get-item","get-from-demande","post","put","get-from-acheteur_demandes","fournisseur:get-from-demande","fournisseur:get-item-from-demande"})
     */
    private $budget;


    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get-from-demande","post","put","get-from-acheteur_demandes"})
     * @Assert\NotNull()
     */
    private $del;

    /**
     * @ORM\OneToMany(targetEntity="HistoriqueVisite", mappedBy="demande",cascade={"persist"})
     * @Groups({"fournisseur:get-from-demande"})
     */
    private $historiques;


    /**
     * @ORM\Column(type="string",nullable=true)
     * @Groups({"visit:get-item","get-from-demande","post","put","get-from-acheteur_demandes","fournisseur:get-from-demande","fournisseur:get-item-from-demande"})
     */
    private $pays;

    /**
     * @ORM\Column(type="string",nullable=true)
     * @Groups({"visit:get-item","get-from-demande","post","put","get-from-acheteur_demandes","fournisseur:get-from-demande","fournisseur:get-item-from-demande"})
     */
    private $ville;

    /**
     * @Gedmo\Slug(fields={"titre"})
     * @ORM\Column(length=128, unique=true)
     * @Groups({"get-from-demande"})
     */
    private $slug;

    /**
     * @Groups({"put"})
     */
    public $updated;

    /**
     * @Groups({"put"})
     */
    public $updateExpiration;


    /**
     * @Groups({"put"})
     */
    public $annulation;

    /**
     * @ORM\Column(type="string", length=250,nullable=true)
     * @Groups({"item:get-from-demande","put","post"})
     */
    private $autreCategories;



    public function __construct()
    {
        $this->statut = false;
        $this->del = false;
        $this->isAnonyme = false;
        $this->isAlerted = false;
        $this->isPublic = false;
        $this->nbrVisite = 0;
        $this->nbrShare = 0;
        $this->attachements = new ArrayCollection();
        $this->historiques = new ArrayCollection();
        $this->diffusionsdemandes = new ArrayCollection();
        $this->visites = new ArrayCollection();
        $this->categories = new ArrayCollection();
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


    public function getTeam(): ?Team
    {
        return $this->team;
    }

    public function setTeam(?Team $team): self
    {
        $this->team = $team;

        return $this;
    }


    /**
     * @return mixed
     */
    public function getFournisseurGagne()
    {
        return $this->fournisseurGagne;
    }

    /**
     * @param mixed $fournisseurGagne
     */
    public function setFournisseurGagne($fournisseurGagne): void
    {
        $this->fournisseurGagne = $fournisseurGagne;
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

    public function getStatut(): ? int
    {
        return $this->statut;
    }

    public function setStatut(int $statut): self
    {
        $this->statut = $statut;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getLocalisation()
    {
        return $this->localisation;
    }

    /**
     * @param mixed $localisation
     */
    public function setLocalisation($localisation): void
    {
        $this->localisation = $localisation;
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


    public function setDescriptionEs(string $descriptionEs): self
    {
        $this->descriptionEs = $descriptionEs;

        return $this;
    }

    public function getAttachements(): Collection
    {
        return $this->attachements;
    }

    public function addAttachement(Attachement $attachement)
    {

        $this->attachements->add($attachement);

    }

    public function removeAttachement(Attachement $attachement)
    {

        $this->attachements->removeElement($attachement);

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


    public function getDiffusionsdemandes(): Collection
    {
        return $this->diffusionsdemandes;
    }

    public function addDiffusionsdemande(DiffusionDemande $diffusionDemande)
    {

        $this->diffusionsdemandes->add($diffusionDemande);

    }

    /**
     * @return mixed
     */
    public function getMotifRejet()
    {
        return $this->motifRejet;
    }

    /**
     * @param mixed $motifRejet
     */
    public function setMotifRejet($motifRejet): void
    {
        $this->motifRejet = $motifRejet;
    }

    /**
     * @return mixed
     */
    public function getBudget()
    {
        return $this->budget;
    }

    /**
     * @param mixed $budget
     */
    public function setBudget($budget): void
    {
        $this->budget = $budget;
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


    public function getHistoriques(): Collection
    {
        return $this->historiques;
    }

    public function addHistorique(HistoriqueVisite $historiqueVisite)
    {

        $this->historiques->add($historiqueVisite);

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
    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * @return mixed
     */
    public function getVisites()
    {
        return $this->visites;
    }

    /**
     * @return mixed
     */
    public function getAutreCategories()
    {
        return $this->autreCategories;
    }

    /**
     * @param mixed $autreCategories
     */
    public function setAutreCategories($autreCategories): void
    {
        $this->autreCategories = $autreCategories;
    }




}
