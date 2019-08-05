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

/**
 * @ApiResource(
 *    collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *
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
 *              "access_control"="is_granted('ROLE_ADMIN')"
 *          }
 *     },
 *     normalizationContext={
 *      "groups"={"get-from-secteur"}
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\SecteurRepository")
 * @UniqueEntity("name")
 */
class Secteur
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"get-from-secteur","get-from-sous-secteur","get"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=100)
     * @Assert\NotBlank()
     * @Groups({"get-from-secteur","get-from-sous-secteur","get"})
     */
    private $name;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get-from-secteur"})
     */
    private $del;

    /**
     * @ORM\OneToMany(targetEntity="SousSecteur", mappedBy="secteur")
     * @Groups({"get-from-secteur"})
     * @ApiSubresource()
     */
    private $sousSecteurs;



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




}
