<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\FournisseurProvisoireRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;


/**
 * @ApiResource(
 *     collectionOperations={
 *          "get"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "normalization_context"={"groups"={"frsProvisoire:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *          "get"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "normalization_context"={"groups"={"frsProvisoire:get-item","frsProvisoire:get-all"}}
 *          },
 *          "put"={
 *              "denormalization_context"={"groups"={"frsProvisoire:put"}},
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object.getFournisseurParent() == user)",
 *              "validation_groups"={"frsProvisoire:putValidation"}
 *          },
 *          "delete"={
 *            "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object.getFournisseurParent() == user)",
 *          }
 *     },
 *     subresourceOperations={
 *          "api_fournisseurs_childs_get_subresource"={
 *               "security"="is_granted('ROLE_FOURNISSEUR')",
 *               "normalization_context"={"groups"={"frsProvisoire:get-all"}}
 *          }
 *     },
 *     attributes={"pagination_items_per_page"=10,"pagination_enabled"=false},
 *
 * )
 *@ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "type": "exact",
 *      }
 * )
 * @ORM\Entity(repositoryClass=FournisseurProvisoireRepository::class)
 * @ORM\Table(name="fournisseur_provisoire",
 *     indexes={
 *     @ORM\Index(name="indexes_type", columns={"type"}),
 * })
 */
class FournisseurProvisoire
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     * @Groups({"frsProvisoire:get-all"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=5)
     * @Groups({"frsProvisoire:get-all"})
     */
    private $civilite;

    /**
     * @ORM\Column(type="string", length=90)
     * @Groups({"frsProvisoire:get-all"})
     */
    private $societe;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"frsProvisoire:get-all"})
     */
    private $firstName;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"frsProvisoire:get-all"})
     */
    private $lastName;

    /**
     * @ORM\Column(type="string", length=35)
     * @Groups({"frsProvisoire:get-all"})
     */
    private $phone;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"frsProvisoire:get-all"})
     */
    private $email;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $password;

    /**
     * @ORM\ManyToOne(targetEntity="Fournisseur",inversedBy="childs")
     */
    private $fournisseurParent;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"frsProvisoire:get-all"})
     */
    private $created;

    /**
     * @ORM\Column(type="smallint")
     * @Groups({"frsProvisoire:get-all","frsProvisoire:put"})
     * 0=nouveau, 1=agence/service, 2=fournisseur child
     */
    private $type;


    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getCivilite()
    {
        return $this->civilite;
    }

    /**
     * @param mixed $civilite
     */
    public function setCivilite($civilite): void
    {
        $this->civilite = $civilite;
    }

    /**
     * @return mixed
     */
    public function getSociete()
    {
        return $this->societe;
    }

    /**
     * @param mixed $societe
     */
    public function setSociete($societe): void
    {
        $this->societe = $societe;
    }

    /**
     * @return mixed
     */
    public function getFirstName()
    {
        return $this->firstName;
    }

    /**
     * @param mixed $firstName
     */
    public function setFirstName($firstName): void
    {
        $this->firstName = $firstName;
    }

    /**
     * @return mixed
     */
    public function getLastName()
    {
        return $this->lastName;
    }

    /**
     * @param mixed $lastName
     */
    public function setLastName($lastName): void
    {
        $this->lastName = $lastName;
    }

    /**
     * @return mixed
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * @param mixed $password
     */
    public function setPassword($password): void
    {
        $this->password = $password;
    }

    /**
     * @return mixed
     */
    public function getFournisseurParent()
    {
        return $this->fournisseurParent;
    }

    /**
     * @param mixed $fournisseurParent
     */
    public function setFournisseurParent($fournisseurParent): void
    {
        $this->fournisseurParent = $fournisseurParent;
    }

    /**
     * @return mixed
     */
    public function getPhone()
    {
        return $this->phone;
    }

    /**
     * @param mixed $phone
     */
    public function setPhone($phone): void
    {
        $this->phone = $phone;
    }

    /**
     * @return mixed
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @param mixed $email
     */
    public function setEmail($email): void
    {
        $this->email = $email;
    }

    /**
     * @return mixed
     */
    public function getCreated()
    {
        return $this->created;
    }

    /**
     * @param mixed $created
     */
    public function setCreated($created): void
    {
        $this->created = $created;
    }

    /**
     * @return mixed
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * @param mixed $type
     */
    public function setType($type): void
    {
        $this->type = $type;
    }




}
