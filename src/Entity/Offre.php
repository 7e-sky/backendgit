<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"offre:post"}},
 *              "validation_groups"={"offre:postValidation"},
 *              "normalization_context"={"groups"={"offre:get-all"}}
 *          },
 *          "get"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "normalization_context"={"groups"={"offre:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *          "get"={
 *              "normalization_context"={"groups"={"offre:get-item","offre:get-all"}}
 *          },
 *          "put"={
 *              "denormalization_context"={"groups"={"offre:put"}},
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "validation_groups"={"offre:putValidation"}
 *          }
 *     },
 *     attributes={"pagination_enabled"=false},
 * )
 * @ORM\Entity(repositoryClass="App\Repository\OffreRepository")
 */
class Offre
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"offre:get-all"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"offre:get-all","offre:post","offre:put"})
     * @Assert\NotBlank(groups={"offre:putValidation","offre:postValidation"})
     */
    private $nom;

    /**
     * @ORM\Column(type="float")
     * @Groups({"offre:get-all","offre:post","offre:put"})
     * @Assert\NotBlank(groups={"offre:putValidation","offre:postValidation"})
     */
    private $prixMad;

    /**
     * @ORM\Column(type="float")
     * @Groups({"offre:get-all","offre:post","offre:put"})
     * @Assert\NotBlank(groups={"offre:putValidation","offre:postValidation"})
     */
    private $prixEur;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"offre:get-all","offre:post","offre:put"})
     *
     */
    private $imageOffre;


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom()
    {
        return $this->nom;
    }

    public function setNom($nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getPrixMad()
    {
        return $this->prixMad;
    }

    public function setPrixMad($prixMad): self
    {
        $this->prixMad = $prixMad;

        return $this;
    }

    public function getPrixEur()
    {
        return $this->prixEur;
    }

    public function setPrixEur($prixEur): self
    {
        $this->prixEur = $prixEur;

        return $this;
    }

    public function getImageOffre()
    {
        return $this->imageOffre;
    }

    public function setImageOffre($imageOffre): self
    {
        $this->imageOffre = $imageOffre;

        return $this;
    }
}
