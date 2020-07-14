<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
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
 *     "sousSecteurs.name":"partial"
 *      }
 * )
 * @ApiFilter(PropertyFilter::class, arguments={"parameterName": "props", "overrideDefaultProperties": false, "whitelist": {"id","name","sousSecteurs","slug"}})
 * @ApiFilter(OrderFilter::class, properties={"id","name","sousSecteurs.id"})
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "normalization_context"={"groups"={"categorie:get-all"}},
 *              "denormalization_context"={"groups"={"post"}},
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "validation_groups"={"postValidation"}
 *          },
 *          "get"={
 *              "normalization_context"={"groups"={"categorie:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *          "get"={
 *               "normalization_context"={"groups"={"categorie:get-all","categorie:get-item"}}},
 *          "put"={
 *              "denormalization_context"={"groups"={"put"}},
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "validation_groups"={"putValidation"},
 *              "normalization_context"={"groups"={"categorie:get-all"}}
 *          }
 *     },
 *      attributes={
 *              "force_eager"=false,
 *              "normalization_context"={"groups"={"categorie:get-all"}},
 *              "enable_max_depth"=true,
 *              "pagination_client_enabled"=true,
 *              "pagination_items_per_page"=10,
 *              "pagination_client_items_per_page"=true,
 *              "maximum_items_per_page"=100,
 *     },
 *     subresourceOperations={
 *          "api_sous_secteurs_categories_get_subresource"={
 *               "normalization_context"={"groups"={"categorie:get-all"}}
 *          }
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\CategorieRepository")
 * @ORM\Table(name="categorie",indexes={@ORM\Index(name="indexes_categorie", columns={"name"}),@ORM\Index(name="indexes_categorie2", columns={"del"})})
 * @UniqueEntity("name")
 */
class Categorie
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"categorie:get-all","sousSecteurSub","selectProduit:get-all","produit:get-all","produit:get-from-fournisseur","visit:get-item","get-from-demande","get-from-acheteur_demandes","get"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=150)
     * @Assert\Length(min=3,max=50,groups={"postValidation","putValidation"})
     * @Groups({"categorie:get-all","dmdAbonnement:get-item","get","sousSecteurSub","post","put","selectProduit:get-all","produit:get-all","produit:get-from-fournisseur","visit:get-item","get-from-demande","get-from-acheteur_demandes","fournisseur:get-from-demande","fournisseur:get-item-from-demande"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     *
     */
    private $name;


    /**
     * @ORM\ManyToMany(targetEntity="SousSecteur",inversedBy="categories")
     * @ORM\JoinTable(name="categorie_sous_secteur")
     * @Groups({"categorie:get-all","post","put","get"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     */
    private $sousSecteurs;

    /**
     * @ORM\ManyToMany(targetEntity="Fournisseur",mappedBy="categories")
     * @ORM\JoinTable(name="fournisseur_categories")
     */
    private $fournisseurs;


    /**
     * @ORM\Column(type="boolean")
     * @Groups({"categorie:get-all","put"})
     */
    private $del;

    /**
     * @Gedmo\Slug(fields={"name"})
     * @Groups({"categorie:get-all","selectProduit:get-all","produit:get-all","produit:get-from-fournisseur","get"})
     * @ORM\Column(length=128, unique=true)
     */
    private $slug;

    /**
     * @ORM\OneToMany(targetEntity="Produit", mappedBy="categorie")
     */
    private $produits;


    public function __construct()
    {
        $this->del = false;
        $this->sousSecteurs = new ArrayCollection();
        $this->fournisseurs = new ArrayCollection();

    }

    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param mixed $name
     */
    public function setName($name): void
    {
        $this->name = $name;
    }

    public function getFournisseurs(): Collection
    {
        return $this->fournisseurs;
    }

    public function getSousSecteurs(): Collection
    {
        return $this->sousSecteurs;
    }


    public function addSousSecteur(SousSecteur $sousSecteur)
    {

        $this->sousSecteurs->add($sousSecteur);

    }

    public function removeSousSecteur(SousSecteur $sousSecteur)
    {

        $this->sousSecteurs->removeElement($sousSecteur);

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
