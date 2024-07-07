<?php

namespace App\Entity;

use App\Repository\TeamRepository;
use Doctrine\ORM\Mapping as ORM;




use ApiPlatform\Core\Annotation\ApiResource;
use App\Interfaces\CreatedEntityInterface;
use App\Interfaces\SetAcheteurInterface;

use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use Misd\PhoneNumberBundle\Validator\Constraints\PhoneNumber as AssertPhoneNumber;




/**
 * @ApiResource(
 *      collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ACHETEUR')",
 *              "denormalization_context"={"groups"={"team:post"}},
 *              "validation_groups"={"team:postValidation"},
 *              "normalization_context"={"groups"={"team:get-all"}}
 *          },
 *          "get"={
 *              "access_control"="is_granted('ROLE_ACHETEUR')",
 *              "normalization_context"={"groups"={"team:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *
 *          "get"={
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object.getAcheteur() == user)",
 *              "normalization_context"={"groups"={"team:get-item","team:get-all"}}
 *          },
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object.getAcheteur() == user)",
 *              "denormalization_context"={"groups"={"team:put"}},
 *              "validation_groups"={"team:putValidation"}
 *          },
 *     },
 *     subresourceOperations={
 *          "api_acheteurs_teams_get_subresource"={
 *               "normalization_context"={"groups"={"team:get-all"}}
 *          }
 *     },
 *     attributes={"pagination_items_per_page"=10,"pagination_enabled"=false},
 * )
 * @ORM\Entity(repositoryClass="App\Repository\TeamRepository")
 */


class Team implements CreatedEntityInterface,SetAcheteurInterface
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @Groups({"team:get-all"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $zz;

     /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $firstName;

     /**
     * @ORM\Column(type="string", length=255, nullable=true)
     * 
     */
    private $lastName;

    /**
     * @ORM\ManyToOne(targetEntity=Acheteur::class, inversedBy="teams")
     * @Groups({"team:get-all"})
     */
    private $acheteur;

    /**
     * @ORM\Column(type="string", length=150,name="fullName")
     
     */
    private $name;

     /**
     * @ORM\Column(type="string", length=100)
     * @Groups({"team:get-all","team:post","team:put"})
     * @Assert\NotBlank(groups={"team:postValidation","team:putValidation"})
     * @Assert\Email(groups={"team:postValidation","team:putValidation"})
     * @Assert\Length(min=10,max=100,groups={"team:postValidation","team:putValidation"})
     */
    private $email;

    /**
     * @ORM\Column(type="string", length=20)
     * @Groups({"team:get-all","team:post","team:put"})
     */
    private $phone;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"team:get-all","team:put"})
     */
    private $del;

     /**
     * @ORM\Column(type="datetime")
     * @Groups({"team:get-all"})
     */
    private $created;

    /**
     * @ORM\ManyToOne(targetEntity="Avatar")
     * @Groups({"team:get-all","team:post","team:put"})
     */
    private $avatar;

     /**
     * @ORM\Column(type="string", length=20,nullable=true)
     * @Groups({"team:get-all","team:post","team:put"})
     */
    private $agence;

     /**
     * @ORM\Column(type="string", length=20,nullable=true)
     * @Groups({"team:get-all","team:post","team:put"})
     */
    private $ville;

    public function __construct()
    {
        $this->del=false;

    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getZz(): ?string
    {
        return $this->zz;
    }

    public function setZz(?string $zz): self
    {
        $this->zz = $zz;

        return $this;
    }
    
    public function getFirstName(): ?string
    {
        return $this->firstName;
    }

    public function setFirstName(string $firstname): self
    {
        $this->firstName = $firstname;

        return $this;
    }

    public function getLastName(): ?string
    {
        return $this->lastName;
    }

    public function setLastName(string $lastname): self
    {
        $this->lastName = $lastname;

        return $this;
    }

     /**
     * @return mixed
     */

    public function getAcheteur()
    {
        return $this->acheteur;
    }

    public function setAcheteur(?Acheteur $acheteur): SetAcheteurInterface
    {
        $this->acheteur = $acheteur;

        return $this;
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

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getPhone(): ?string
    {
        return $this->phone;
    }

    public function setPhone(?string $phone): self
    {
        $this->phone = $phone;

        return $this;
    }

    public function getDel(): ?bool
    {
        return $this->del;
    }

    public function setDel(?bool $del): self
    {
        $this->del = $del;

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

    /**
     * @return mixed
     */
    public function getAvatar()
    {
        return $this->avatar;
    }

    /**
     * @param mixed $avatar
     */
    public function setAvatar($avatar): void
    {
        $this->avatar = $avatar;
    }

    /**
     * @return mixed
     */
    public function getAgence()
    {
        return $this->agence;
    }

    /**
     * @param mixed $agence
     */
    public function setAgence($agence): void
    {
        $this->agence = $agence;
    }

    /**
     * @return mixed
     */
    public function getVille()
    {
        return $this->ville;
    }

    /**
     * @param mixed $ville
     */
    public function setVille($ville): void
    {
        $this->ville = $ville;
    }
}
