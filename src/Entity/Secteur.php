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

/**
 * @ApiFilter(PropertyFilter::class, arguments={"parameterName": "props", "overrideDefaultProperties": false, "whitelist": {"id","name"}})
 * @ApiResource(
 *    collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"post"}},
 *              "validation_groups"={"postValidation"},
 *
 *
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
 *     "pagination_enabled"=false,
 *     "pagination_client_enabled"=true
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
     * @Assert\Length(min=4,max=50,groups={"postValidation","putValidation"})
     * @Groups({"abonnement:get-all","produit:get-item","produit:get-all","produit:get-from-fournisseur","visit:get-all","secteur:get-all","sous-secteur:get-all","get","post","put","get-from-demande"})
     */
    private $name;

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
     * @Gedmo\Slug(fields={"name", "id"})
     * @ORM\Column(length=128, unique=true)
     * @Groups({"produit:get-from-fournisseur","sous-secteur:get-all","produit:get-all","secteur:get-all"})
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



}
