<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Interfaces\CreatedEntityInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
/**
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "fournisseur": "exact",
 *     "demande": "exact",
 *      }
 * )
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
 *
 *              "validation_groups"={"visit:putValidation"}
 *          },
 *     },
 *     attributes={"pagination_items_per_page"=10},
 * )
 * @ORM\Entity(repositoryClass="App\Repository\DetailVisiteRepository")
 */
class DetailVisite implements CreatedEntityInterface
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
    private $etatValidation;

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
     * @ORM\ManyToOne(targetEntity="DemandeAchat")
     * @Groups({"visit:get-all"})
     */
    private $demande;

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

    public function getEtatValidation(): ?bool
    {
        return $this->etatValidation;
    }

    public function setEtatValidation(bool $etatValidation): self
    {
        $this->etatValidation = $etatValidation;

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
    public function getDemande()
    {
        return $this->demande;
    }

    /**
     * @param mixed $demande
     */
    public function setDemande($demande): void
    {
        $this->demande = $demande;
    }


}
