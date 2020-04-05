<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use App\Interfaces\CreatedEntityInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
use Gedmo\Mapping\Annotation as Gedmo;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\BooleanFilter;

/**
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "description": "partial",
 *     "titre": "partial",
 *     "slug": "exact",
 *      }
 * )
 * @ApiFilter(
 *     BooleanFilter::class,properties={"isActive"}
 * )
 * @ApiFilter(OrderFilter::class, properties={"id","description","titre","created","isActive"})
 * @ApiResource(
 *      collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"actualite:post"}},
 *              "validation_groups"={"actualite:postValidation"},
 *              "normalization_context"={"groups"={"actualite:get-all"}}
 *          },
 *          "get"={
 *              "normalization_context"={"groups"={"actualite:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *
 *          "get"={
 *              "normalization_context"={"groups"={"actualite:get-item","actualite:get-all"}}
 *          },
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"actualite:put"}},
 *              "validation_groups"={"actualite:putValidation"}
 *          },
 *     },
 *      attributes={
 *     "pagination_client_enabled"=true,
 *     "pagination_items_per_page"=10,
 *     "pagination_client_items_per_page"=true,
 *     "maximum_items_per_page"=100,
 *     },
 * )
 * @ORM\Entity(repositoryClass="App\Repository\ActualiteRepository")
 */
class Actualite implements CreatedEntityInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"actualite:get-all"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank(groups={"actualite:postValidation","actualite:putValidation"})
     * @Groups({"actualite:post","actualite:put","actualite:get-all"})
     * @Assert\Length(min=6,max=255,groups={"actualite:postValidation","actualite:putValidation"})
     */
    private $titre;

    /**
     * @ORM\Column(type="text")
     * @Assert\NotBlank(groups={"actualite:postValidation","actualite:putValidation"})
     * @Groups({"actualite:post","actualite:put","actualite:get-all"})
     * @Assert\Length(min=100,groups={"actualite:postValidation","actualite:putValidation"})
     */
    private $description;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"actualite:get-all"})
     */
    private $created;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"actualite:put","actualite:get-all"})
     */
    private $isActive = true;

    /**
     * @ORM\Column(type="string", length=255,nullable=true)
     * @Groups({"actualite:post","actualite:put","actualite:get-all"})
     */
    private $keywords;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank(groups={"actualite:postValidation","actualite:putValidation"})
     * @Groups({"actualite:post","actualite:put","actualite:get-all"})
     */
    private $source;

    /**
     * @ORM\ManyToOne(targetEntity="ActualiteImage")
     * @Groups({"actualite:post","actualite:put","actualite:get-all"})
     * @Assert\NotBlank(groups={"actualite:postValidation","actualite:putValidation"})
     *
     */
    private $image;

    /**
     * @Gedmo\Slug(fields={"titre"})
     * @ORM\Column(length=128, unique=true)
     * @Groups({"actualite:get-all"})
     */
    private $slug;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitre()
    {
        return $this->titre;
    }

    public function setTitre($titre): self
    {
        $this->titre = $titre;

        return $this;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function setDescription($description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getCreated(): ?\DateTimeInterface
    {
        return $this->created;
    }

    public function setCreated(\DateTimeInterface $created): CreatedEntityInterface
    {
        $this->created = $created;

        return $this;
    }

    public function getIsActive()
    {
        return $this->isActive;
    }

    public function setIsActive($isActive): self
    {
        $this->isActive = $isActive;

        return $this;
    }

    public function getKeywords()
    {
        return $this->keywords;
    }

    public function setKeywords($keywords): self
    {
        $this->keywords = $keywords;

        return $this;
    }

    public function getSource()
    {
        return $this->source;
    }

    public function setSource($source): self
    {
        $this->source = $source;

        return $this;
    }


    public function getImage()
    {
        return $this->image;
    }


    public function setImage($image): void
    {
        $this->image = $image;
    }

    public function getSlug()
    {
        return $this->slug;
    }

}
