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

/**
 * @ApiResource(
 *     attributes={"order"={"created":"desc"}},
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
 *     BooleanFilter::class,properties={"del"}
 * )
 * @ORM\Entity(repositoryClass="App\Repository\AcheteurRepository")
 */
class Acheteur extends User
{

    /**
     * @ORM\ManyToOne(targetEntity="Pays", inversedBy="acheteurs")
     * @Groups({"visit:get-all","get","post","put"})
     */
    private $pays;

    /**
     * @ORM\ManyToOne(targetEntity="Ville")
     * @Groups({"visit:get-all","get","post","put"})
     */
    private $ville;

    /**
     * @ORM\ManyToOne(targetEntity="Currency")
     * @Groups({"get-from-acheteur_demandes","get-from-demande","visit:get-all","get","post","put"})
     */
    private $currency;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"visit:get-all","get","put","post","get-from-demande"})
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
     * @ORM\Column(type="string", length=5)
     * @Groups({"visit:get-all","get","put","post"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\Length(min=1,max=5,groups={"postValidation","putValidation"})
     */
    private $civilite;


    /**
     * @ORM\Column(type="string", length=15,nullable=true)
     * @Groups({"visit:get-all","get","put","post"})
     * @Assert\Length(min=15,max=15,groups={"postValidation","putValidation"})
     */
    private $ice;

    /**
     * @ORM\Column(type="string", length=30,nullable=true)
     * @Groups({"visit:get-all","get","put","post"})
     *  @AssertPhoneNumber(
     *     type="fix",
     *     defaultRegion="MA",
     *     groups={"postValidation","putValidation"},
     *     message="Cette valeur n'est pas un numéro de fix valide."
     *     )
     * @Assert\Length(min=10,max=15,groups={"postValidation","putValidation"})
     */
    private $fix;


    /**
     * @ORM\Column(type="string", length=30,nullable=true)
     * @Groups({"visit:get-all","get","put","post"})

     */
    private $website;

    /**
     * @ORM\Column(type="text",nullable=true)
     * @Groups({"visit:get-all","get","put","post"})
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

    /*
    /**
     * @ORM\ManyToMany(targetEntity="SousSecteur", mappedBy="acheteurs")
     * @ORM\JoinTable(name="achteur_sous_secteur")
     * @Groups({"put","post"})
     * @Assert\NotBlank()
     * @ApiSubresource()
     */
   // private $sousSecteurs;


    /**
     * @ORM\ManyToOne(targetEntity="Acheteur")
     * @Groups({"get-admin"})
     * @ORM\JoinColumn(name="parent2", referencedColumnName="id" , nullable=true)
     */
    protected $parent2;

    /**
     * @ORM\ManyToOne(targetEntity="Secteur")
     * @Groups({"visit:get-all","get","post","put"})
     */
    private $secteur;



    public function __construct()
    {
        parent::__construct();
        $this->blacklistes = new ArrayCollection();
        $this->demandes = new ArrayCollection();
      //  $this->sousSecteurs = new ArrayCollection();

    }

    public function getPays()
    {
        return $this->pays;

    }


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


    public function getBlacklistes() : Collection
    {
        return $this->blacklistes;
    }

    public function getDemandes() : Collection
    {
        return $this->demandes;
    }

    /*
    public function getSousSecteurs() : Collection
    {
        return $this->sousSecteurs;
    }

    public function addSousSecteur(SousSecteur $secteur){

        $this->sousSecteurs->add($secteur);

    }

    public function removeSousSecteur(SousSecteur $secteur){

        $this->sousSecteurs->removeElement($secteur);

    }
    */
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
    public function getParent2()
    {
        return $this->parent2;
    }

    /**
     * @param mixed $parent2
     */
    public function setParent2($parent2): void
    {
        $this->parent2 = $parent2;
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







}
