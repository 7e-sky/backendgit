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
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"post"}},
 *              "validation_groups"={"postValidation"}
 *          },
 *          "get",
 *          "api_pays_villes_get_subresource"={
 *               "normalization_context"={"groups"={"get"}}
 *          }
 *     },
 *     itemOperations={
 *          "get",
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"put"}},
 *              "validation_groups"={"putValidation"}
 *          }
 *     },
 *     normalizationContext={
 *      "groups"={"get-from-ville"}
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
     * @Groups({"get-from-ville","get-from-pays","get","post","put"})
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
     * @ORM\Column(type="boolean")
     * @Groups({"get","put"})
     * @Assert\NotNull()
     */
    protected $del;


    public function __construct()
    {
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







}
