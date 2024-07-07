<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use App\Interfaces\CreatedEntityInterface;
use App\Interfaces\SetAcheteurInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;

/**
 * @ApiFilter(OrderFilter::class, properties={"created"})
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_ACHETEUR')",
 *              "denormalization_context"={"groups"={"mediateur:post"}},
 *              "validation_groups"={"mediateur:postValidation"},
 *
 *          },
 *          "get"={
 *              "access_control"="is_granted('ROLE_ACHETEUR')",
 *          }
 *     },
 *     itemOperations={
 *          "get"={
 *               "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object.getAcheteur() == user)",
 *
 *          },
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object.getAcheteur() == user)",
 *              "denormalization_context"={"groups"={"mediateur:put"}},
 *              "validation_groups"={"mediateur:putValidation"}
 *          },
 *          "delete"={"access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object.getAcheteur() == user)"}
 *     },
 *     attributes={
 *     "pagination_enabled"=false
 *     },
 *     subresourceOperations={
 *          "api_acheteurs_mediateurs_get_subresource"={
 *              "access_control"="is_granted('ROLE_ACHETEUR')",
 *              "method"="GET",
 *              "normalization_context"={"groups"={"get-from-acheteurs_mediateurs"}}
 *
 *          },
 *          "api_fournisseurs_mediateurs_get_subresource"={
 *              "normalization_context"={"groups"={"frs:get-all"}}
 *          }
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\mediateurRepository")
 */
class Mediateur implements CreatedEntityInterface,SetAcheteurInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"get-from-acheteurs_mediateur"})
     * @ORM\Column(type="integer")
     */
    private $id;


    /**
     * @ORM\ManyToOne(targetEntity="Acheteur",inversedBy="mediateur")
     * @Groups({"frs:get-all"})
     */
    private $acheteur;

    /**
     * @ORM\ManyToOne(targetEntity="Fournisseur")
     * @Groups({"mediateur:post","mediateur:put","get-from-acheteurs_mediateur"})
     * @Assert\NotBlank(groups={"mediateur:postValidation","mediateur:putValidation"})
     */
    private $fournisseur;

     

    /**
     * @ORM\Column(type="text")
     * @Groups({"frs:get-all","mediateur:post","mediateur:put","get-from-acheteurs_mediateur"})
     * @Assert\NotBlank(groups={"mediateur:postValidation","mediateur:putValidation"})
     * @Assert\Length(min=6,groups={"mediateur:postValidation","mediateur:putValidation"})
     */
    private $raison;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"frs:get-all","get-from-acheteurs_mediateur"})
     */
    private $created;

      /**
     * @ORM\Column(type="datetime",nullable=true)
     * @Groups({"frs:get-all","get-from-acheteurs_mediateur"})
     */
    private $deblacklister;



    /**
     * @ORM\Column(type="boolean")
     * @Groups({"frs:get-all","mediateur:put","get-from-acheteurs_mediateur"})
     */
    private $etat;


    public function __construct()
    {
        $this->etat=true;
    }


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAcheteur()
    {
        return $this->acheteur;
    }

    public function setAcheteur(Acheteur $acheteur): SetAcheteurInterface
    {
        // TODO: Implement setAcheteur() method.
        $this->acheteur= $acheteur;
        return $this;
    }


    public function getFournisseur()
    {
        return $this->fournisseur;
    }


    public function setFournisseur($fournisseur): void
    {
        $this->fournisseur = $fournisseur;
    }

   

    public function getRaison(): ?string
    {
        return $this->raison;
    }

    public function setRaison(string $raison): self
    {
        $this->raison = $raison;

        return $this;
    }

    public function getCreated(): ?\DateTimeInterface
    {
        return $this->created;
    }

    public function setCreated(\DateTimeInterface $created):  CreatedEntityInterface
    {
        $this->created = $created;

        return $this;
    }

     /**
     * @return mixed
     */
    public function getDeblacklister()
    {
        return $this->deblacklister;
    }

    /**
     * @param mixed $deblacklister
     */
    public function setDeblacklister($deblacklister): void
    {
        $this->deblacklister = $deblacklister;
    }
    /**
     * @return mixed
     */
    public function getEtat()
    {
        return $this->etat;
    }

    /**
     * @param mixed $etat
     */
    public function setEtat($etat): void
    {
        $this->etat = $etat;
    }


}
