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
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\DateFilter;

/**
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "fournisseur": "exact",
 *     "demande": "exact",
 *     "demande.reference": "partial",
 *     "demande.description": "partial",
 *     "personnel.name": "partial",
 *     "demande.acheteur.societe": "partial",
 *     "demande.statut": "exact",
 *     "statut": "exact",
 *     "budget": "exact",
 *      }
 * )
 * @ApiFilter(DateFilter::class, properties={"demande.dateExpiration"})
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
 *     subresourceOperations={
 *          "api_demande_achats_visites_get_subresource"={
 *               "normalization_context"={"groups"={"visit:get-for-acheteur"}},
 *               "access_control"="is_granted('ROLE_ACHETEUR')"
 *          }
 *    },
 *     attributes={"pagination_items_per_page"=10},
 * )
 * @ORM\Entity(repositoryClass="App\Repository\DetailVisiteRepository")
 */
class DetailVisite implements CreatedEntityInterface,SetFournisseurInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"visit:get-all","visit:get-for-acheteur"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"visit:get-all","visit:get-for-acheteur"})
     */
    private $created;

    /**
     * @ORM\ManyToOne(targetEntity="Fournisseur")
     * @Groups({"visit:get-for-acheteur"})
     */
    private $fournisseur;

    /**
     * @ORM\ManyToOne(targetEntity="Personnel")
     * @Groups({"visit:put","visit:get-all"})
     */
    private $personnel;

    /**
     * @ORM\ManyToOne(targetEntity="DemandeAchat", inversedBy="visites")
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
