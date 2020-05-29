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
use Gedmo\Mapping\Annotation as Gedmo;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\BooleanFilter;

/**
 * @ApiFilter(
 *     BooleanFilter::class,properties={"del"}
 * )
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "name":"partial",
 *     "secteur.name":"partial",
 *      }
 * )
 * @ApiFilter(PropertyFilter::class, arguments={"parameterName": "props", "overrideDefaultProperties": false, "whitelist": {"id","name","secteur","fournisseurs","slug"}})
 * @ApiFilter(OrderFilter::class, properties={"id","name","secteur.id"})
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "normalization_context"={"groups"={"sous-secteur:get-all"}},
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"post"}},
 *              "validation_groups"={"postValidation"}
 *          },
 *          "get"={
 *              "normalization_context"={"groups"={"sous-secteur:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *          "get"={
 *               "normalization_context"={"groups"={"sous-secteur:get-all"}}},
 *          "put"={
 *              "denormalization_context"={"groups"={"put"}},
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "validation_groups"={"putValidation"},
 *              "normalization_context"={"groups"={"sous-secteur:get-all"}}
 *          }
 *     },
 *      attributes={
 *              "force_eager"=false,
 *              "normalization_context"={"groups"={"sous-secteur:get-all"}},
 *              "enable_max_depth"=true,
 *              "pagination_client_enabled"=true,
 *              "pagination_items_per_page"=10,
 *              "pagination_client_items_per_page"=true,
 *              "maximum_items_per_page"=100,
 *     },
 *     subresourceOperations={
 *          "api_secteurs_sous_secteurs_get_subresource"={
 *               "normalization_context"={"groups"={"get"}}
 *          }
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\SousSecteurRepository")
 * @ORM\Table(name="sous_secteur",indexes={@ORM\Index(name="indexe_ss_name", columns={"name_lower"}),@ORM\Index(name="indexes_sous_secteur2", columns={"del"})})
 * @UniqueEntity("name")
 */
class SousSecteur
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"categorie:get-all","selectProduit:get-all","sous-secteur:get-all","secteur:get-all","get"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=150)
     * @Groups({"categorie:get-all","selectProduit:get-all","abonnement:get-item","abonnement:get-all","dmdAbonnement:get-item","dmdAbonnement:get-all","produit:get-item","produit:get-all","produit:get-from-fournisseur","sous-secteur:get-all","secteur:get-all","get","put","post"})
     * @Assert\Length(min=4,max=50,groups={"postValidation","putValidation"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     *
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=150)
     */
    private $nameLower;


    /**
     * @ORM\ManyToOne(targetEntity="Secteur", inversedBy="sousSecteurs")
     * @Groups({"dmdAbonnement:get-item","abonnement:get-all","sous-secteur:get-all","post","put"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     */
    private $secteur;


    /**
     * @ORM\Column(type="boolean")
     * @Groups({"sous-secteur:get-all","put","secteur:get-all","get-from-acheteur_demandes"})
     */
    private $del;



    /**
     * @Gedmo\Slug(fields={"name"})
     * @ORM\Column(length=128, unique=true)
     * @Groups({"produit:get-from-fournisseur","get","sous-secteur:get-all","produit:get-all","selectProduit:get-all"})
     */
    private $slug;

    /**
     * @ORM\ManyToMany(targetEntity="Categorie" ,mappedBy="sousSecteurs")
     * @ORM\JoinTable(name="categorie_sous_secteur")
     * @ApiSubresource(maxDepth=1)
     */
    private $categories;

    /*
    /**
     * @ORM\ManyToMany(targetEntity="Acheteur", inversedBy="sousSecteurs")
     * @ORM\JoinTable(name="acheteur_sous_secteur")
     * @Groups({"sous-secteur:get-all"})
     */
    //private $acheteurs;


    public function __construct()
    {
        $this->del=false;
        $this->categories = new ArrayCollection();
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

    /**
     * @return mixed
     */
    public function getNameLower()
    {
        return $this->nameLower;
    }

    /**
     * @param mixed $nameLower
     */
    public function setNameLower($nameLower): void
    {
        $this->nameLower = $nameLower;
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


    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * @return mixed
     */
    public function getCategories(): Collection
    {
        return $this->categories;
    }


}
