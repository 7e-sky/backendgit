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
use ApiPlatform\Core\Serializer\Filter\PropertyFilter;
use Gedmo\Mapping\Annotation as Gedmo;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\BooleanFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;

/**
 * @ApiFilter(OrderFilter::class, properties={"name"})
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "name":"partial",
 *      }
 * )
 * @ApiFilter(
 *     BooleanFilter::class,properties={"del"}
 * )
 * @ApiFilter(PropertyFilter::class, arguments={"parameterName": "props", "overrideDefaultProperties": false, "whitelist": {"id","name","image"}})
 * @ApiResource(
 *    collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"post"}},
 *              "validation_groups"={"postValidation"},
 *          },
 *          "get"
 *     },
 *     itemOperations={
 *          "get",
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN')" ,
 *              "denormalization_context"={"groups"={"put"}},
 *              "validation_groups"={"putValidation"}
 *          }
 *     },
 *     attributes={
 *     "force_eager"=false,
 *     "normalization_context"={"groups"={"secteur:get-all"},"enable_max_depth"=true},
 *     "enable_max_depth"=true,
 *     "pagination_client_enabled"=true,
 *     "pagination_items_per_page"=10,
 *     "pagination_client_items_per_page"=true,
 *     "maximum_items_per_page"=100,
 *     }
 *
 * )
 * @ORM\Entity(repositoryClass="App\Repository\SecteurRepository")
 * @UniqueEntity("name", repositoryMethod="findByUniqueCriteria",groups={"postValidation","putValidation"})
 */
class Secteur
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"secteur:get-all","sous-secteur:get-all","get","get-from-demande"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=100)
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\Length(min=3,max=50,groups={"postValidation","putValidation"})
     * @Groups({"dmdAbonnement:get-all","abonnement:get-all","produit:get-item","produit:get-all","produit:get-from-fournisseur","visit:get-all","secteur:get-all","sous-secteur:get-all","get","post","put","get-from-demande"})
     */
    private $name;

    /**
     * @ORM\ManyToOne(targetEntity="ImageSecteur")
     * @Groups({"secteur:get-all","post","put"})
     */
    private $image;
    /**
     * @ORM\Column(type="boolean")
     * @Groups({"secteur:get-all","put"})
     */
    private $del;

    /**
     * @ORM\OneToMany(targetEntity="SousSecteur", mappedBy="secteur")
     * @Groups({"secteur:get-all","post","put"})
     * @ApiSubresource(maxDepth=1)
     */
    private $sousSecteurs;

    /**
     * @ORM\OneToMany(targetEntity="Produit", mappedBy="secteur")
     */
    private $produits;

    /**
     * @Gedmo\Slug(fields={"name"})
     * @ORM\Column(length=128, unique=true)
     * @Groups({"produit:get-from-fournisseur","sous-secteur:get-all","produit:get-all","secteur:get-all","get"})
     */
    private $slug;


    public function __construct()
    {
        $this->sousSecteurs = new ArrayCollection();
        $this->del=false;
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
    public function getImage()
    {
        return $this->image;
    }

    /**
     * @param mixed $image
     */
    public function setImage($image): void
    {
        $this->image = $image;
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

    public function getSousSecteurs(): Collection
    {
        return $this->sousSecteurs;
    }

    public function getSlug()
    {
        return $this->slug;
    }


    /**
     * @return mixed
     */
    public function getProduits()
    {
        return $this->produits;
    }

    /**
     * @param mixed $produits
     */
    public function setProduits($produits): void
    {
        $this->produits = $produits;
    }




}
