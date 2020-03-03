<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;
use App\Interfaces\CreatedEntityInterface;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use Misd\PhoneNumberBundle\Validator\Constraints\PhoneNumber as AssertPhoneNumber;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
/**
 * @ApiFilter(OrderFilter::class, properties={"contact","message","created","statut"})
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "contact": "partial",
 *     "message":"partial",
 *     "statut":"exact",
 *      }
 * )
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "denormalization_context"={"groups"={"contactFournisseur:post"}},
 *              "validation_groups"={"contactFournisseur:postValidation"},
 *              "normalization_context"={"groups"={"contactFournisseur:get-all"}}
 *          },
 *          "get"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "normalization_context"={"groups"={"contactFournisseur:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *          "get"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "normalization_context"={"groups"={"contactFournisseur:get-item","contactFournisseur:get-all"}}
 *          },
 *          "put"={
 *              "denormalization_context"={"groups"={"contactFournisseur:put"}},
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object.getFournisseur() == user)",
 *              "validation_groups"={"contactFournisseur:putValidation"}
 *          }
 *     },
 *     subresourceOperations={
 *          "api_fournisseurs_messages_get_subresource"={
 *               "security"="is_granted('ROLE_FOURNISSEUR')",
 *               "normalization_context"={"groups"={"contactFournisseur:get-all"}}
 *          }
 *     },
 *     attributes={"pagination_items_per_page"=10},
 *
 * )
 *
 * @ORM\Entity(repositoryClass="App\Repository\ContactFournisseurRepository")
 */
class ContactFournisseur implements CreatedEntityInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"contactFournisseur:get-all"})
     * @ORM\Column(type="integer")
     */
    private $id;
    /**
     * @ORM\Column(type="string", length=100)
     * @Groups({"contactFournisseur:post","contactFournisseur:get-all","contactFournisseur:put"})
     * @Assert\NotBlank(groups={"contactFournisseur:postValidation"})
     * @Assert\Length(min=3,max=60,groups={"contactFournisseur:postValidation"})
     */
    private $contact;


    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"contactFournisseur:post","contactFournisseur:get-all","contactFournisseur:put"})
     * @Assert\NotBlank(groups={"contactFournisseur:postValidation"})
     * @AssertPhoneNumber(
     *     groups={"contactFournisseur:postValidation"},
     *     message="Veuillez entrer votre numéro en format international (Exemple Maroc) : +212666112244."
     *     )
     */
    private $phone;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"contactFournisseur:post","contactFournisseur:get-all","contactFournisseur:put"})
     * @Assert\NotBlank(groups={"contactFournisseur:postValidation"})
     * @Assert\Email(groups={"contactFournisseur:postValidation"})
     */
    private $email;

    /**
     * @ORM\Column(type="text",length=4000)
     * @Groups({"contactFournisseur:post","contactFournisseur:get-all","contactFournisseur:put"})
     * @Assert\NotBlank(groups={"contactFournisseur:postValidation"})
     * @Assert\Length(min=6,max=4000,groups={"contactFournisseur:postValidation"})
     */
    private $message;


    /**
     * @ORM\Column(type="datetime")
     * @Groups({"contactFournisseur:get-all"})
     */
    private $created;

    /**
     * @ORM\Column(type="datetime",nullable=true)
     * @Groups({"contactFournisseur:get-all"})
     */
    private $dateValidation;



    /**
     * @ORM\Column(type="boolean")
     * @Groups({"contactFournisseur:get-all","put-admin"})
     */
    private $statut;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"contactFournisseur:get-all","put-admin"})
     */
    private $isRead;

    /**
     * @ORM\Column(type="datetime",nullable=true)
     * @Groups({"contactFournisseur:get-all"})
     */
    private $dateRead;


    /**
     * @ORM\Column(type="boolean")
     * @Groups({"contactFournisseur:get-all","contactFournisseur:put"})
     */
    private $del;


    /**
     * @ORM\ManyToOne(targetEntity="Fournisseur")
     * @Groups({"contactFournisseur:post","contactFournisseur:get-all"})
     */
    private $fournisseur;

    public function __construct()
    {
        $this->del=0;
        $this->statut=0;
        $this->isRead=0;
    }



    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getContact()
    {
        return $this->contact;
    }

    /**
     * @param mixed $contact
     */
    public function setContact($contact): void
    {
        $this->contact = $contact;
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
    public function getMessage()
    {
        return $this->message;
    }

    /**
     * @param mixed $message
     */
    public function setMessage($message): void
    {
        $this->message = $message;
    }

    /**
     * @return mixed
     */
    public function getCreated()
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


}
