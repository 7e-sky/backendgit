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
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\PaysRepository")
 * @UniqueEntity("name", repositoryMethod="findByUniqueCriteria",groups={"postValidation","putValidation"})
 */
class Pays
{
    /**
     * @ORM\Id()
     * @Groups({"get-from-pays"})
     * @ORM\GeneratedValue()
     * Groups({"get-from-pays","get"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string",length=50)
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Groups({"get-from-pays","get-from-ville","get","post","put"})
     * @Assert\Length(min=4,max=50,groups={"postValidation","putValidation"})
     */
    private $name;

    /**
     * @ORM\OneToMany(targetEntity="Ville", mappedBy="pays")
     * @Groups({"get-from-pays"})
     * @ApiSubresource()
     */
    private $villes;


    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get-from-pays","get","put"})
     * @Assert\NotNull()
     */
    protected $del;


    public function __construct()
    {
        $this->villes = new ArrayCollection();
        $this->del=false;
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



}
