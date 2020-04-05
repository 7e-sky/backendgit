<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Serializer\Filter\PropertyFilter;

/**
 * @ApiFilter(PropertyFilter::class, arguments={"parameterName": "props", "overrideDefaultProperties": false, "whitelist": {"id","name","icon"}})
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"faq_cat:post"}},
 *              "validation_groups"={"faq_cat:postValidation"},
 *              "normalization_context"={"groups"={"faq_cat:get-all"}}
 *          },
 *          "get"={
 *              "normalization_context"={"groups"={"faq_cat:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *
 *          "get"={
 *              "normalization_context"={"groups"={"faq_cat:get-item","faq_cat:get-all"}}
 *          },
 *          "put"={
 *              "denormalization_context"={"groups"={"faq_cat:put"}},
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "validation_groups"={"faq_cat:putValidation"}
 *          },
 *          "delete"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *          }
 *     },
 *     attributes={"pagination_enabled"=false},
 * )
 * @ORM\Entity(repositoryClass="App\Repository\FaqCategorieRepository")
 */
class FaqCategorie
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"faq_cat:get-all"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"faq_cat:post","faq_cat:put","faq_cat:get-all","faq:get-all"})
     * @Assert\NotBlank(groups={"faq_cat:postValidation","faq_cat:putValidation"})
     */
    private $name;

    /**
     * @ORM\OneToMany(targetEntity="Faq", mappedBy="categorie")
     * @Groups({"faq_cat:get-all"})
     */
    private $faqs;

    public function __construct()
    {
        $this->faqs = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function setName($name): self
    {
        $this->name = $name;

        return $this;
    }


    public function getFaqs(): Collection
    {
        return $this->faqs;
    }
}
