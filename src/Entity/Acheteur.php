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
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\DateFilter;

/**
 * @ApiResource(
 *     attributes={
 *     "pagination_client_enabled"=true,
 *     "pagination_items_per_page"=10,
 *     "pagination_client_items_per_page"=true,
 *     "maximum_items_per_page"=100,
 *     "order"={"created":"desc"}},
 *     collectionOperations={
 *          "post"={
 *               "denormalization_context"={"groups"={"post"}},
 *                "validation_groups"={"postValidation"}
 *            },
 *     "get"={
 *          "access_control"="is_granted('ROLE_ADMIN')"}
 *      },
 *     itemOperations={
 *      "get"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object == user)"
 *          },
 *      "put"={
 *          "access_control"="is_granted('ROLE_ADMIN') or ((is_granted('ROLE_ACHETEUR') or is_granted('ROLE_ACHETEUR_PRE')) and object == user)",
 *           "denormalization_context"={"groups"={"put"}},
 *             "validation_groups"={"putValidation"}
 *          }
 *      },
 *
 *     normalizationContext={
 *      "groups"={"get"}
 *     },
 *
 *
 * )
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "societe": "partial",
 *     "phone": "partial",
 *     "email": "partial",
 *     "firstName": "partial",
 *     "lastName": "partial"
 *      }
 * )
 * @ApiFilter(
 *     BooleanFilter::class,properties={"del","isactif"}
 * )
 * @ApiFilter(DateFilter::class, properties={"created"})
 * @ApiFilter(OrderFilter::class, properties={"id","created","isactif","societe"})
 * @ORM\Entity(repositoryClass="App\Repository\AcheteurRepository")
 */
class Acheteur extends User
{

    /**
     * @ORM\ManyToOne(targetEntity="Pays", inversedBy="acheteurs")
     * @Groups({"get-from-demande","visit:get-all","get","post","put"})
     */
    private $pays;

    /**
     * @ORM\ManyToOne(targetEntity="Ville")
     * @Groups({"get-from-demande","visit:get-all","get","post","put"})
     */
    private $ville;

    /**
     * @ORM\ManyToOne(targetEntity="Currency")
     * @Groups({"get-from-acheteur_demandes","get-from-demande","visit:get-all","get","post","put"})
     */
    private $currency;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"sugg-secteur:get-all","visit:get-all","get","put","post","get-from-demande"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\Length(min=3,max=255,groups={"postValidation","putValidation"})
     * @Assert\Regex(
     *     pattern="/[a-zA-Z0-9]{2,}/",
     *     message="Raison social (minimum de 2 caractères alphanumériques)",
     *     groups={"postValidation","putValidation"}
     * )
     */
    private $societe;

    /**
     * @ORM\Column(type="string", length=5)
     * @Groups({"get-from-demande","visit:get-all","get","put","post"})
     */
    private $civilite;


    /**
     * @ORM\Column(type="string", length=15,nullable=true)
     * @Groups({"get-from-demande","visit:get-all","get","put","post"})
     * @Assert\Length(min=15,max=15,groups={"postValidation","putValidation"})
     */
    private $ice;

    /**
     * @ORM\Column(type="string", length=30,nullable=true)
     * @Groups({"get-from-demande","visit:get-all","get","put","post"})
     *  @AssertPhoneNumber(
     *     groups={"postValidation","putValidation"},
     *     message="Veuillez entrer votre numéro en format international (Exemple Maroc) : +212522112244."
     *     )
     * @Assert\Length(min=10,max=15,groups={"postValidation","putValidation"})
     */
    private $fix;


    /**
     * @ORM\Column(type="string", length=30,nullable=true)
     * @Groups({"get-from-demande","visit:get-all","get","put","post"})

     */
    private $website;

    /**
     * @ORM\Column(type="text",nullable=true)
     * @Groups({"get-from-demande","visit:get-all","get","put","post"})
     * @Assert\Length(min=6,groups={"postValidation","putValidation"})
     */
    private $description;


    /**
     * @ORM\OneToMany(targetEntity="BlackListes", mappedBy="acheteur")
     * @ApiSubresource(maxDepth=1)
     */
    private $blacklistes;

    /**
     * @ORM\OneToMany(targetEntity="DemandeAchat", mappedBy="acheteur")
     * @ApiSubresource(maxDepth=1)
     */
    private $demandes;


    /**
     * @ORM\ManyToOne(targetEntity="Acheteur")
     * @Groups({"get-admin"})
     * @ORM\JoinColumn(name="parent2", referencedColumnName="id" , nullable=true)
     */
    protected $parent2;

    /**
     * @ORM\ManyToOne(targetEntity="Secteur")
     * @Groups({"get-from-demande","visit:get-all","get","post","put"})
     */
    private $secteur;


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
     * @ORM\Column(type="string", length=30,nullable=true)
     *
     */
    private $codeClient;


    /**
     * @ORM\Column(type="string", length=50,nullable=true)
     * @Groups({"get","put","post"})
     */
    private $autreVille;

    /**
     * @ORM\Column(type="string", length=10,nullable=true)
     * @Groups({"get","put","post"})
     */
    private $autreCurrency;


    public function __construct()
    {
        parent::__construct();
        $this->blacklistes = new ArrayCollection();
        $this->demandes = new ArrayCollection();
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

    public function getCurrency()
    {
        return $this->currency;
    }

    public function setCurrency($currency): void
    {
        $this->currency = $currency;
    }

    public function getSociete()
    {
        return $this->societe;
    }

    public function setSociete($societe): void
    {
        $this->societe = $societe;
    }


    public function getBlacklistes() : Collection
    {
        return $this->blacklistes;
    }

    public function getDemandes() : Collection
    {
        return $this->demandes;
    }

    public function getCivilite()
    {
        return $this->civilite;
    }

    public function setCivilite($civilite): void
    {
        $this->civilite = $civilite;
    }

    public function getIce()
    {
        return $this->ice;
    }

    public function setIce($ice): void
    {
        $this->ice = $ice;
    }

    public function getFix()
    {
        return $this->fix;
    }

    public function setFix($fix): void
    {
        $this->fix = $fix;
    }

    public function getWebsite()
    {
        return $this->website;
    }

    public function setWebsite($website): void
    {
        $this->website = $website;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function setDescription($description): void
    {
        $this->description = $description;
    }

    public function getParent2()
    {
        return $this->parent2;
    }

    public function setParent2($parent2): void
    {
        $this->parent2 = $parent2;
    }

    public function getSecteur()
    {
        return $this->secteur;
    }

    public function setSecteur($secteur): void
    {
        $this->secteur = $secteur;
    }

    public function getStep()
    {
        return $this->step;
    }

    public function setStep($step): void
    {
        $this->step = $step;
    }

    public function getisComplet()
    {
        return $this->isComplet;
    }

    public function setIsComplet($isComplet): void
    {
        $this->isComplet = $isComplet;
    }

    public function getCodeClient()
    {
        return $this->codeClient;
    }

    public function setCodeClient($codeClient): void
    {
        $this->codeClient = $codeClient;
    }

    /**
     * @return mixed
     */
    public function getAutreVille()
    {
        return $this->autreVille;
    }

    /**
     * @param mixed $autreVille
     */
    public function setAutreVille($autreVille): void
    {
        $this->autreVille = $autreVille;
    }

    /**
     * @return mixed
     */
    public function getAutreCurrency()
    {
        return $this->autreCurrency;
    }

    /**
     * @param mixed $autreCurrency
     */
    public function setAutreCurrency($autreCurrency): void
    {
        $this->autreCurrency = $autreCurrency;
    }


}
