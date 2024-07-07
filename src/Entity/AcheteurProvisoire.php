<?php

namespace App\Entity;

use App\Repository\AcheteurProvisoireRepository;
use Doctrine\ORM\Mapping as ORM;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use Symfony\Component\Serializer\Annotation\Groups;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;


/**
 * @ApiResource(
 *     collectionOperations={
 *          "get"={
 *              "access_control"="is_granted('ROLE_ACHETEUR')",
 *              "normalization_context"={"groups"={"achProvisoire:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *          "get"={
 *              "access_control"="is_granted('ROLE_ACHETEUR')",
 *              "normalization_context"={"groups"={"achProvisoire:get-item","achProvisoire:get-all"}}
 *          },
 *          "put"={
 *              "denormalization_context"={"groups"={"achProvisoire:put"}},
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object.getAcheteurParent() == user)",
 *              "validation_groups"={"achProvisoire:putValidation"}
 *          },
 *          "delete"={
 *            "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object.getAcheteurParent() == user)",
 *          }
 *     },
 *     subresourceOperations={
 *          "api_acheteur_childs_get_subresource"={
 *               "security"="is_granted('ROLE_ACHETEUR')",
 *               "normalization_context"={"groups"={"achProvisoire:get-all"}}
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
 * @ORM\Entity(repositoryClass=AcheteurProvisoireRepository::class)
 * @ORM\Table(name="acheteur_provisoire",
 *     indexes={
 *     @ORM\Index(name="indexes_type", columns={"type"}),
 * })
 */





class AcheteurProvisoire
{
    
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     * @Groups({"achProvisoire:get-all"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=5)
     * @Groups({"achProvisoire:get-all"})
     */
    private $civilite;

    /**
     * @ORM\Column(type="string", length=90)
     * @Groups({"achProvisoire:get-all"})
     */
    private $societe;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"achProvisoire:get-all"})
     */
    private $firstName;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"achProvisoire:get-all"})
     */
    private $lastName;

    /**
     * @ORM\Column(type="string", length=35)
     * @Groups({"achProvisoire:get-all"})
     */
    private $phone;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"achProvisoire:get-all"})
     */
    private $email;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $password;

    /**
     * @ORM\ManyToOne(targetEntity="Acheteur",inversedBy="childs")
     */
    private $acheteurParent;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"achProvisoire:get-all"})
     */
    private $created;

    /**
     * @ORM\Column(type="smallint")
     * @Groups({"achProvisoire:get-all","achProvisoire:put"})
     * 0=nouveau, 1=acheteur/master, 2=acheteur child
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
    public function getAcheteurParent()
    {
        return $this->acheteurParent;
    }

    /**
     * @param mixed $acheteurParent
     */
    public function setAcheteurParent($acheteurParent): void
    {
        $this->acheteurParent = $acheteurParent;
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
