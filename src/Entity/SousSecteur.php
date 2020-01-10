<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Annotation\ApiSubresource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\ExistsFilter;
use ApiPlatform\Core\Serializer\Filter\PropertyFilter;


/**
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "name":"partial",
 *     "parent":"exact"
 *      }
 * )
 * @ApiFilter(PropertyFilter::class, arguments={"parameterName": "properties", "overrideDefaultProperties": false, "whitelist": {"id","name"}})
 * @ApiFilter(ExistsFilter::class, properties={"parent"})
 * @ApiFilter(OrderFilter::class, properties={"id","name","secteur.id","parent.name"})
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "normalization_context"={"groups"={"get-from-sous-secteur"}},
 *              "denormalization_context"={"groups"={"post"}},
 *              "validation_groups"={"postValidation"}
 *          },
 *          "get"={
 *              "normalization_context"={"groups"={"get-from-sous-secteur"}}
 *          }
 *     },
 *     itemOperations={
 *          "get"={
 *               "normalization_context"={"groups"={"get-from-sous-secteur"}}},
 *          "put"={
 *              "denormalization_context"={"groups"={"put"}},
 *              "validation_groups"={"putValidation"},
 *              "normalization_context"={"groups"={"get-from-sous-secteur"}}
 *          }
 *     },
 *      attributes={
 *     "force_eager"=false,
 *     "normalization_context"={"groups"={"get-from-sous-secteur"},
 *     "enable_max_depth"=true},
 *     "pagination_items_per_page"=10,
 *     "pagination_client_enabled"=true
 *     },
 *     subresourceOperations={
 *          "api_secteurs_sous_secteurs_get_subresource"={
 *               "normalization_context"={"groups"={"get"}}
 *          }
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\SousSecteurRepository")
 * @UniqueEntity("name")
 */
class SousSecteur
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"visit:get-item","get-from-sous-secteur","get-from-secteur","get","get-from-demande","get-from-acheteur_demandes"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=150)
     * @Groups({"dmdAbonnement:get-item","dmdAbonnement:get-all","visit:get-item","produit:get-item","produit:get-all","produit:get-from-fournisseur","get-from-sous-secteur","get-from-secteur","get","put","post","get-from-demande","get-from-acheteur_demandes","fournisseur:get-from-demande","fournisseur:get-item-from-demande"})
     * @Assert\Length(min=4,max=50,groups={"postValidation","putValidation"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     *
     */
    private $name;


    /**
     * @ORM\ManyToOne(targetEntity="Secteur", inversedBy="sousSecteurs")
     * @Groups({"get-from-sous-secteur","post","put"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     */
    private $secteur;


    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get-from-sous-secteur","put","get-from-secteur","get-from-acheteur_demandes"})
     */
    private $del;

    /**
     * @ORM\ManyToMany(targetEntity="Fournisseur", inversedBy="sousSecteurs")
     * @ORM\JoinTable(name="fournisseur_sous_secteur")
     * @Groups({"get-from-sous-secteur"})
     */
    private $fournisseurs;


    /**
     * @ORM\ManyToMany(targetEntity="DemandeAchat", inversedBy="sousSecteurs")
     * @ORM\JoinTable(name="demande_ha_sous_secteur")
     * @Groups({"get-from-sous-secteur"})
     * @ApiSubresource(maxDepth=1)
     */
    private $demandes;


    /**
     * @ORM\ManyToOne(targetEntity="SousSecteur")
     * @Groups({"get-from-sous-secteur","post","put"})
     * @ORM\JoinColumn(name="parent", referencedColumnName="id" , nullable=true)
     */
    private $parent;


    /*
    /**
     * @ORM\ManyToMany(targetEntity="Acheteur", inversedBy="sousSecteurs")
     * @ORM\JoinTable(name="acheteur_sous_secteur")
     * @Groups({"get-from-sous-secteur"})
     */
    //private $acheteurs;


    public function __construct()
    {
        $this->del=false;
        $this->fournisseurs = new ArrayCollection();
        $this->demandes = new ArrayCollection();
     //   $this->acheteurs = new ArrayCollection();

    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getDel(): ?bool
    {
        return $this->del;
    }

    public function setDel(bool $del): self
    {
        $this->del = $del;

        return $this;
    }


    public function getSecteur()
    {
        return $this->secteur;
    }

    public function setSecteur($secteur): void
    {
        $this->secteur = $secteur;
    }


    public function getFournisseurs() : Collection
    {
        return $this->fournisseurs;
    }

    public function getDemandes() : Collection
    {
        return $this->demandes;
    }

    /**
     * @return mixed
     */
    public function getParent()
    {
        return $this->parent;
    }

    /**
     * @param mixed $parent
     */
    public function setParent($parent): void
    {
        $this->parent = $parent;
    }



   /* public function getAcheteurs() : Collection
    {
        return $this->acheteurs;
    }*/
}
