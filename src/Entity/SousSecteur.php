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
 *              "denormalization_context"={"groups"={"post"}},
 *              "validation_groups"={"postValid"}
 *          },
 *          "get"={
 *              "access_control"="is_granted('IS_AUTHENTICATED_FULLY')"
 *          }
 *     },
 *     itemOperations={
 *          "get"={
 *              "access_control"="is_granted('IS_AUTHENTICATED_FULLY')"
 *          },
 *          "put"={
 *             "denormalization_context"={"groups"={"put"}},
 *              "validation_groups"={"putValid"}
 *          }
 *     },
 *     normalizationContext={
 *      "groups"={"get-from-sous-secteur"}
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
     * @Groups({"get-from-sous-secteur","get-from-secteur","get"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=150)
     * @Groups({"get-from-sous-secteur","get-from-secteur","get","put","post"})
     * @Assert\NotBlank(groups={"postValid","putValid"})
     *
     */
    private $name;


    /**
     * @ORM\ManyToOne(targetEntity="Secteur", inversedBy="sousSecteurs")
     * @Groups({"get-from-sous-secteur","get","post"})
     * @Assert\NotBlank(groups={"postValid"})
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
