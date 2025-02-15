<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Annotation\ApiSubresource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
use ApiPlatform\Core\Serializer\Filter\PropertyFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\BooleanFilter;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "name":"partial"
 *      }
 * )
 * @ApiFilter(
 *     BooleanFilter::class,properties={"del"}
 * )
 * @ApiFilter(PropertyFilter::class, arguments={"parameterName": "props", "overrideDefaultProperties": false, "whitelist": {"id","name"}})
 * @ApiFilter(OrderFilter::class, properties={"id","name"})
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"post"}},
 *              "validation_groups"={"postValidation"}
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
 *     normalizationContext={
 *      "groups"={"get-from-pays"}
 *     },
 *     attributes={
 *     "pagination_items_per_page"=10,
 *     "pagination_client_enabled"=true
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\PaysRepository")
 * @UniqueEntity("name", repositoryMethod="findByUniqueCriteria",groups={"postValidation","putValidation"})
 */
class Pays
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"get-from-pays","get"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string",length=50)
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Groups({"get-from-demande","item:get-from-demande","get-from-acheteurs_blacklistes","visit:get-for-acheteur","produit:get-all","abonnement:get-item","produit:get-item","dmdAbonnement:get-item","visit:get-all","get-from-pays","get-from-ville","get","post","put"})
     * @Assert\Length(min=4,max=50,groups={"postValidation","putValidation"})
     */
    private $name;

    /**
     * @ORM\OneToMany(targetEntity="Ville", mappedBy="pays")
     * @ApiSubresource(maxDepth=1)
     */
    private $villes;


    /**
     * @ORM\OneToMany(targetEntity="Fournisseur", mappedBy="pays")
     * @ApiSubresource(maxDepth=1)
     */
    private $fournisseurs;

    /**
     * @ORM\OneToMany(targetEntity="Acheteur", mappedBy="pays")
     * @ApiSubresource(maxDepth=1)
     */
    private $acheteurs;

    /**
     * @ORM\ManyToMany(targetEntity="ZoneCommercial", mappedBy="pays")
     * @ORM\JoinTable(name="zone_commercial_pays")
     * @ApiSubresource(maxDepth=1)
     */
    private $zones;


    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get-from-pays","get","put"})
     * @Assert\NotNull()
     */
    protected $del;

    /**
     * @Gedmo\Slug(fields={"name"})
     * @ORM\Column(length=128, unique=true)
     * @Groups({"get-from-pays"})
     */
    private $slug;


    public function __construct()
    {
        $this->villes = new ArrayCollection();
        $this->del=false;
        $this->fournisseurs = new ArrayCollection();
        $this->acheteurs = new ArrayCollection();
        $this->zones = new ArrayCollection();
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

    public function getVilles(): Collection
    {
        return $this->villes;
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

    public function getFournisseurs() : Collection
    {
        return $this->fournisseurs;
    }

    public function getAcheteurs() : Collection
    {
        return $this->acheteurs;
    }

    public function getZones() : Collection
    {
        return $this->zones;
    }

    public function getSlug()
    {
        return $this->slug;
    }
}
