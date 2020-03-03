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

/**
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "name":"partial"
 *      }
 * )
 * @ApiFilter(PropertyFilter::class, arguments={"parameterName": "props", "overrideDefaultProperties": false, "whitelist": {"id","name"}})
 * @ApiFilter(OrderFilter::class, properties={"id","name","pays.id"})
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"post"}},
 *              "validation_groups"={"postValidation"}
 *          },
 *          "get"={ "normalization_context"={"groups"={"get-from-ville"}} }
 *     },
 *     itemOperations={
 *          "get"={"normalization_context"={"groups"={"get-from-ville"}}},
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"put"}},
 *              "validation_groups"={"putValidation"}
 *          }
 *     },
 *     subresourceOperations={
 *          "api_pays_villes_get_subresource "={
 *              "normalization_context"={"groups"={"get-from-pays"}}
 *          }
 *     },
 *     attributes={
 *     "pagination_items_per_page"=10,
 *     "pagination_client_enabled"=true
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\VilleRepository")
 * @UniqueEntity("name")

 */
class Ville
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"get-from-ville","get"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string",length=50)
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Groups({"abonnement:get-item","produit:get-item","dmdAbonnement:get-item","visit:get-all","get-from-ville","get","post","put"})
     * @Assert\Length(min=4,max=50,groups={"postValidation","putValidation"})
     */
    private $name;


    /**
     * @ORM\ManyToOne(targetEntity="Pays", inversedBy="villes")
     * @Groups({"get-from-ville","post","put"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     */
    private $pays;


    /**
     * @ORM\OneToMany(targetEntity="Fournisseur", mappedBy="ville")
     * @Groups({"get-from-ville"})
     */
    private $fournisseurs;

    /**
     * @ORM\OneToMany(targetEntity="Acheteur", mappedBy="ville")
     * @Groups({"get-from-ville"})
     */
    private $acheteurs;

    /**
     * @ORM\ManyToMany(targetEntity="Commercial", inversedBy="villes")
     * @ORM\JoinTable(name="commercial_ville")
     * @Groups({"get-from-ville"})
     */
    private $commercials;


    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get","put"})
     * @Assert\NotNull()
     */
    protected $del;


    public function __construct()
    {
        $this->del=false;
        $this->fournisseurs = new ArrayCollection();
        $this->acheteurs = new ArrayCollection();
        $this->commercials = new ArrayCollection();
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

    public function getCommercials() : Collection
    {
        return $this->commercials;
    }



}
