<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use App\Interfaces\CreatedEntityInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use Misd\PhoneNumberBundle\Validator\Constraints\PhoneNumber as AssertPhoneNumber;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\BooleanFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;

/**
 * @ApiFilter(OrderFilter::class, properties={"contact","societe","message","created","statut","produit.reference"})
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "contact": "partial",
 *     "message":"partial"
 *      }
 * )
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "denormalization_context"={"groups"={"demandeDevis:post"}},
 *              "validation_groups"={"demandeDevis:postValidation"},
 *              "normalization_context"={"groups"={"demandeDevis:get-all"}}
 *          },
 *          "get"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "normalization_context"={"groups"={"demandeDevis:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *          "get"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "normalization_context"={"groups"={"demandeDevis:get-item","demandeDevis:get-all"}}
 *          },
 *          "put"={
 *              "denormalization_context"={"groups"={"demandeDevis:put"}},
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object.getFournisseur() == user)",
 *              "validation_groups"={"demandeDevis:putValidation"}
 *          }
 *     },
 *     subresourceOperations={
 *          "api_fournisseurs_demandes_get_subresource"={
 *               "security"="is_granted('ROLE_FOURNISSEUR')",
 *               "normalization_context"={"groups"={"demandeDevis:get-all"}}
 *          }
 *     },
 *     attributes={"pagination_items_per_page"=10},
 *
 * )
 * @ORM\Entity(repositoryClass="App\Repository\DemandeDevisRepository")
 */
class DemandeDevis implements CreatedEntityInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"demandeDevis:get-all"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=100)
     * @Groups({"demandeDevis:post","demandeDevis:get-all","demandeDevis:put"})
     * @Assert\NotBlank(groups={"demandeDevis:postValidation"})
     * @Assert\Length(min=3,max=60,groups={"demandeDevis:postValidation"})
     */
    private $contact;

    /**
     * @ORM\Column(type="string", length=50,nullable=true)
     * @Groups({"demandeDevis:post","demandeDevis:get-all","demandeDevis:put"})
     * @Assert\Length(min=3,max=60,groups={"demandeDevis:postValidation"})
     * @Assert\Regex(
     *     pattern="/[a-zA-Z0-9]{3,}/",
     *     message="Raison social (minimum de 3 caractères alphanumériques)",
     *     groups={"demandeDevis:postValidation"}
     * )
     */
    private $societe;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"demandeDevis:post","demandeDevis:get-all","demandeDevis:put"})
     * @Assert\NotBlank(groups={"demandeDevis:postValidation"})
     * @AssertPhoneNumber(
     *     groups={"demandeDevis:postValidation"},
     *     message="Veuillez entrer votre numéro en format international (Exemple Maroc) : +212666112244."
     *     )
     */
    private $phone;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"demandeDevis:post","demandeDevis:get-all","demandeDevis:put"})
     * @Assert\NotBlank(groups={"demandeDevis:postValidation"})
     * @Assert\Email(groups={"demandeDevis:postValidation"})
     */
    private $email;

    /**
     * @ORM\Column(type="text")
     * @Groups({"demandeDevis:post","demandeDevis:get-all","demandeDevis:put"})
     * @Assert\NotBlank(groups={"demandeDevis:postValidation"})
     * @Assert\Length(min=6,max=4000,groups={"demandeDevis:postValidation"})
     */
    private $message;

    /**
     * @ORM\Column(type="smallint",nullable=true)
     * @Groups({"demandeDevis:post","demandeDevis:get-all"})
     */
    private $quantity;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"demandeDevis:get-all"})
     */
    private $created;

    /**
     * @ORM\Column(type="datetime",nullable=true)
     * @Groups({"demandeDevis:get-all"})
     */
    private $dateValidation;

    /**
     * @ORM\Column(type="string", length=100)
     * @Groups({"demandeDevis:post","demandeDevis:get-all","demandeDevis:put"})
     * @Assert\NotBlank(groups={"demandeDevis:postValidation"})
     * @Assert\Length(min=10,max=100,groups={"demandeDevis:postValidation"})
     *
     */
    private $adresse;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"demandeDevis:get-all","put-admin"})
     */
    private $statut;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"demandeDevis:get-all","put-admin"})
     */
    private $isRead;

    /**
     * @ORM\Column(type="datetime",nullable=true)
     * @Groups({"demandeDevis:get-all"})
     */
    private $dateRead;


    /**
     * @ORM\Column(type="boolean")
     * @Groups({"demandeDevis:get-all","demandeDevis:put"})
     */
    private $del;


    /**
     * @ORM\ManyToOne(targetEntity="Fournisseur")
     * @Groups({"demandeDevis:get-all"})
     */
    private $fournisseur;


    /**
     * @ORM\ManyToOne(targetEntity="Produit")
     * @Groups({"demandeDevis:post","demandeDevis:get-all"})
     *
     */
    private $produit;


    public function __construct()
    {
        $this->del=0;
        $this->statut=0;
        $this->isRead=0;
    }

    public function getId()
    {
        return $this->id;
    }

    public function getContact()
    {
        return $this->contact;
    }

    public function setContact($contact): self
    {
        $this->contact = $contact;

        return $this;
    }

    public function getSociete()
    {
        return $this->societe;
    }

    public function setSociete($societe): self
    {
        $this->societe = $societe;

        return $this;
    }

    public function getPhone()
    {
        return $this->phone;
    }

    public function setPhone($phone): self
    {
        $this->phone = $phone;

        return $this;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function setEmail($email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getMessage()
    {
        return $this->message;
    }

    public function setMessage($message): self
    {
        $this->message = $message;

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

    public function getAdresse()
    {
        return $this->adresse;
    }

    public function setAdresse($adresse): self
    {
        $this->adresse = $adresse;

        return $this;
    }


    /**
     * @return mixed
     */
    public function getStatut()
    {
        return $this->statut;
    }

    /**
     * @param mixed $statut
     */
    public function setStatut($statut): void
    {
        $this->statut = $statut;
    }

    /**
     * @return mixed
     */
    public function getisRead()
    {
        return $this->isRead;
    }

    /**
     * @param mixed $isRead
     */
    public function setIsRead($isRead): void
    {
        $this->isRead = $isRead;
    }

    /**
     * @return mixed
     */
    public function getDateRead()
    {
        return $this->dateRead;
    }

    /**
     * @param mixed $dateRead
     */
    public function setDateRead($dateRead): void
    {
        $this->dateRead = $dateRead;
    }


    /**
     * @return mixed
     */
    public function getFournisseur()
    {
        return $this->fournisseur;
    }

    /**
     * @param mixed $fournisseur
     */
    public function setFournisseur($fournisseur): void
    {
        $this->fournisseur = $fournisseur;
    }


    /**
     * @return mixed
     */
    public function getProduit()
    {
        return $this->produit;
    }

    /**
     * @param mixed $produit
     */
    public function setProduit($produit): void
    {
        $this->produit = $produit;
    }

    /**
     * @return mixed
     */
    public function getDateValidation()
    {
        return $this->dateValidation;
    }

    /**
     * @param mixed $dateValidation
     */
    public function setDateValidation($dateValidation): void
    {
        $this->dateValidation = $dateValidation;
    }

    /**
     * @return mixed
     */
    public function getQuantity()
    {
        return $this->quantity;
    }

    /**
     * @param mixed $quantity
     */
    public function setQuantity($quantity): void
    {
        $this->quantity = $quantity;
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
