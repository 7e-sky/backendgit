<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
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
 *     "normalization_context"={"groups"={"get-from-sous-secteur"},"enable_max_depth"=true},
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
     * @Groups({"get-from-sous-secteur","get-from-secteur","get","get-from-demande"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=150)
     * @Groups({"get-from-sous-secteur","get-from-secteur","get","put","post","get-from-demande"})
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
     */
    private $del;


    public function __construct()
    {
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


    public function getSecteur()
    {
        return $this->secteur;
    }

    public function setSecteur($secteur): void
    {
        $this->secteur = $secteur;
    }


}
