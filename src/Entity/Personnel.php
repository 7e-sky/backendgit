<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Interfaces\CreatedEntityInterface;
use App\Interfaces\SetFournisseurInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use Misd\PhoneNumberBundle\Validator\Constraints\PhoneNumber as AssertPhoneNumber;

/**
 * @ApiResource(
 *      collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "denormalization_context"={"groups"={"personnel:post"}},
 *              "validation_groups"={"personnel:postValidation"},
 *              "normalization_context"={"groups"={"personnel:get-all"}}
 *          },
 *          "get"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "normalization_context"={"groups"={"personnel:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *
 *          "get"={
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object.getFournisseur() == user)",
 *              "normalization_context"={"groups"={"personnel:get-item","personnel:get-all"}}
 *          },
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object.getFournisseur() == user)",
 *              "denormalization_context"={"groups"={"personnel:put"}},
 *              "validation_groups"={"personnel:putValidation"}
 *          },
 *     },
 * )
 * @ORM\Entity(repositoryClass="App\Repository\PersonnelRepository")
 */
class Personnel implements CreatedEntityInterface,SetFournisseurInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"personnel:get-all"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Fournisseur",inversedBy="personnels")
     * @Groups({"personnel:get-all"})
     */
    private $fournisseur;

    /**
     * @ORM\Column(type="string", length=50)
     * @Assert\NotBlank(groups={"personnel:postValidation","personnel:putValidation"})
     * @Assert\Length(min=6,max=255,groups={"personnel:postValidation","personnel:putValidation"})
     * @Groups({"personnel:get-all","personnel:post","personnel:put"})
     */
    private $firstName;

    /**
     * @ORM\Column(type="string", length=50)
     * @Assert\NotBlank(groups={"personnel:postValidation","personnel:putValidation"})
     * @Assert\Length(min=6,max=255,groups={"personnel:postValidation","personnel:putValidation"})
     * @Groups({"personnel:get-all","personnel:post","personnel:put"})
     */
    private $lastName;

    /**
     * @ORM\Column(type="string", length=100)
     * @Groups({"personnel:get-all","personnel:post","personnel:put"})
     * @Assert\NotBlank(groups={"personnel:postValidation","personnel:putValidation"})
     * @Assert\Email(groups={"personnel:postValidation","personnel:putValidation"})
     * @Assert\Length(min=10,max=100,groups={"personnel:postValidation","personnel:putValidation"})
     */
    private $email;

    /**
     * @ORM\Column(type="string", length=20)
     * @Groups({"personnel:get-all","personnel:post","personnel:put"})
     * @AssertPhoneNumber(
     *     type="mobile",
     *     defaultRegion="MA",
     *     groups={"personnel:postValidation","personnel:putValidation"},
     *     message="Cette valeur n'est pas un numéro de mobile valide."
     *     )
     * @Assert\NotBlank(groups={"personnel:postValidation","personnel:putValidation"})
     * @Assert\Length(min=10,max=20,groups={"personnel:postValidation","personnel:putValidation"})
     */
    private $phone;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"personnel:get-all","personnel:put"})
     */
    private $del;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"personnel:get-all"})
     */
    private $created;

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
    public function getFournisseur()
    {
        return $this->fournisseur;
    }

    public function setFournisseur(Fournisseur $fournisseur): SetFournisseurInterface
    {
        $this->fournisseur = $fournisseur;
        return $this;
    }

    public function getFirstName()
    {
        return $this->firstName;
    }

    public function setFirstName(string $firstName): self
    {
        $this->firstName = $firstName;

        return $this;
    }

    public function getLastName()
    {
        return $this->lastName;
    }

    public function setLastName(string $lastName): self
    {
        $this->lastName = $lastName;

        return $this;
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

    public function getPhone()
    {
        return $this->phone;
    }

    public function setPhone(string $phone): self
    {
        $this->phone = $phone;

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

    public function getCreated(): ?\DateTimeInterface
    {
        return $this->created;
    }

    public function setCreated(\DateTimeInterface $created): CreatedEntityInterface
    {
        $this->created = $created;

        return $this;
    }
}
