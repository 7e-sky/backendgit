<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Interfaces\CreatedEntityInterface;
use App\Interfaces\SetFournisseurInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;

/**
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "fournisseur": "exact",
 *     "demande": "exact",
 *      }
 * )
 * @ApiFilter(OrderFilter::class, properties={"fournisseur.societe","demande.reference","demande.description","demande.dateExpiration","created","budget","statut"})
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "denormalization_context"={"groups"={"visit:post"}},
 *              "validation_groups"={"visit:postValidation"},
 *              "normalization_context"={"groups"={"visit:get-all"}}
 *          },
 *          "get"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "normalization_context"={"groups"={"visit:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *
 *          "get"={
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object.getFournisseur() == user)",
 *              "normalization_context"={"groups"={"visit:get-item","visit:get-all"}}
 *          },
 *          "put"={
 *              "denormalization_context"={"groups"={"visit:put"}},
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object.getFournisseur() == user)",
 *              "validation_groups"={"visit:putValidation"}
 *          },
 *     },
 *     attributes={"pagination_items_per_page"=10},
 * )
 * @ORM\Entity(repositoryClass="App\Repository\DetailVisiteRepository")
 */
class DetailVisite implements CreatedEntityInterface,SetFournisseurInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"visit:get-all"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"visit:get-all"})
     */
    private $created;

    /**
     * @ORM\Column(type="datetime")
     *
     */
    private $dateRec;


    /**
     * @ORM\Column(type="boolean")
     */
    private $is_send;

    /**
     * @ORM\ManyToOne(targetEntity="Fournisseur")
     *
     */
    private $fournisseur;

    /**
     * @ORM\ManyToOne(targetEntity="Personnel")
     * @Groups({"visit:put","visit:get-all"})
     */
    private $personnel;

    /**
     * @ORM\ManyToOne(targetEntity="DemandeAchat")
     * @Groups({"visit:get-all","visit:post"})
     * @Assert\NotBlank(groups={"visit:postValidation"})
     */
    private $demande;


    /**
     * @ORM\Column(type="smallint",length=1)
     * @Groups({"visit:get-all","visit:put"})
     */
    private $statut;

    /**
     * @ORM\Column(type="float")
     * @Groups({"visit:post","visit:get-all","visit:put"})
     * @Assert\NotBlank(groups={"visit:putValidation"})
     */
    private $budget;

    /**
     * @Groups({"visit:put"})
     */
    public $sendEmail;

    public function __construct()
    {
        $this->statut=0;
        $this->is_send=0;
    }

    public function getId(): ?int
    {
        return $this->id;
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

    public function getDateRec(): ?\DateTimeInterface
    {
        return $this->dateRec;
    }

    public function setDateRec(\DateTimeInterface $dateRec): self
    {
        $this->dateRec = $dateRec;

        return $this;
    }

    public function getIsSend(): ?bool
    {
        return $this->is_send;
    }

    public function setIsSend(bool $is_send): self
    {
        $this->is_send = $is_send;

        return $this;
    }

    public function getFournisseur()
    {
        return $this->fournisseur;
    }

    public function setFournisseur(Fournisseur $fournisseur): SetFournisseurInterface
    {
        $this->fournisseur = $fournisseur;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getPersonnel()
    {
        return $this->personnel;
    }

    /**
     * @param mixed $personnel
     */
    public function setPersonnel($personnel): void
    {
        $this->personnel = $personnel;
    }



    public function getDemande()
    {
        return $this->demande;
    }

    public function setDemande($demande): void
    {
        $this->demande = $demande;
    }

    public function getStatut()
    {
        return $this->statut;
    }

    public function setStatut($statut): void
    {
        $this->statut = $statut;
    }

    public function getBudget()
    {
        return $this->budget;
    }

    public function setBudget($budget): void
    {
        $this->budget = $budget;
    }



}
