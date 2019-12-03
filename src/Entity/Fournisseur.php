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
 *     "get"={"access_control"="is_granted('ROLE_ADMIN') or is_granted('ROLE_ACHETEUR')"}
 *      },
 *     itemOperations={
 *     "get"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object == user)",
 *           "normalization_context"={"groups"={"get"}},
 *          "defaults"={"del"="false"}
 *          },
 *     "put"={
 *          "access_control"="is_granted('ROLE_ADMIN') or ((is_granted('ROLE_FOURNISSEUR') or is_granted('ROLE_FOURNISSEUR_PRE')) and object == user)",
 *           "denormalization_context"={"groups"={"put"}},
 *              "validation_groups"={"putValidation"}
 *          }
 *     },
 *     attributes={
 *     "force_eager"=false,
 *     "normalization_context"={"groups"={"get"},"enable_max_depth"=true},
 *     "order"={"id":"desc"}
 *     }
 * )
 * @ApiFilter(
 *     BooleanFilter::class,properties={"del"}
 * )
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "societe": "partial",
 *      }
 * )
 * @ApiFilter(
 *     PropertyFilter::class,
 *     arguments={
 *     "parameterName": "props",
 *     "overrideDefaultProperties": false,
 *     "whitelist": {"id","societe"},
 *      }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\FournisseurRepository")
 *
 */
class Fournisseur extends User
{

    /**
     * @ORM\ManyToOne(targetEntity="Pays",inversedBy="fournisseurs")
     * @Groups({"get","post","put"})
     */
    private $pays;

    /**
     * @ORM\ManyToOne(targetEntity="Ville")
     * @Groups({"get","post","put"})
     */
    private $ville;


    /**
     * add mapped by if you want to miggrate
     * @ORM\ManyToMany(targetEntity="SousSecteur")
     * @ORM\JoinTable(name="fournisseur_sous_secteur")
     * @Groups({"get","put","post"})
     * @Assert\NotBlank(groups={"putValidation"})
     * @ApiSubresource(maxDepth=1)
     */
    private $sousSecteurs;


    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get","put","post","get-from-demande","get-from-diffusionDemande","get-from-blacklist","get-from-acheteurs_blacklistes"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\Length(min=3,max=255,groups={"postValidation","putValidation"})
     */
    private $societe;

    /**
     * @ORM\Column(type="string", length=5)
     * @Groups({"get","put","post"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\Length(min=1,max=5,groups={"postValidation","putValidation"})
     */
    private $civilite;


    /**
     * @ORM\Column(type="string", length=15,nullable=true)
     * @Groups({"get","put","post"})
     * @Assert\Length(min=15,max=15,groups={"postValidation","putValidation"})
     */
    private $ice;

    /**
     * @ORM\Column(type="string", length=30,nullable=true)
     * @Groups({"get","put","post"})
     * @AssertPhoneNumber(
     *     type="fix",
     *     defaultRegion="MA",
     *     groups={"postValidation","putValidation"},
     *     message="Cette valeur n'est pas un numéro de mobile valide."
     *     )
     * @Assert\Length(min=10,max=15,groups={"postValidation","putValidation"})
     */
    private $fix;

    /**
     * @ORM\Column(type="string", length=30,nullable=true)
     * @Groups({"get","put","post"})
     */
    private $website;

    /**
     * @ORM\Column(type="text",nullable=true)
     * @Groups({"get","put","post"})
     * @Assert\Length(min=6,groups={"postValidation","putValidation"})
     */
    private $description;



    public function __construct()
    {
        parent::__construct();
        $this->sousSecteurs = new ArrayCollection();
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





}
