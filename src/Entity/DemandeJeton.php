<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Interfaces\CreatedEntityInterface;
use App\Interfaces\SetFournisseurInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\BooleanFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\DateFilter;
use ApiPlatform\Core\Serializer\Filter\PropertyFilter;

/**
 * @ApiFilter(
 *     SearchFilter::class,
 *     properties={
 *     "id":"exact",
 *     "nbrJeton": "exact",
 *     "fournisseur.societe": "partial",
 *      }
 * )
 * @ApiFilter(
 *     PropertyFilter::class,
 *     arguments={
 *     "parameterName": "props",
 *     "overrideDefaultProperties": false,
 *     "whitelist": {"id","nbrJeton","fournisseur","created","isUse"},
 *      }
 * )
 * @ApiFilter(
 *     BooleanFilter::class,properties={"isUse"}
 * )
 * @ApiFilter(DateFilter::class, properties={"created"})
 * @ApiFilter(OrderFilter::class, properties={"id","nbrJeton","fournisseur.societe","isUse","created"})
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *              "denormalization_context"={"groups"={"d-jeton:post"}},
 *              "validation_groups"={"d-jeton:postValidation"},
 *              "normalization_context"={"groups"={"d-jeton:get-item"}}
 *          },
 *          "get"={
 *              "normalization_context"={"groups"={"d-jeton:get-all"}}
 *           }
 *     },
 *     itemOperations={
 *
 *          "get"={
 *                  "normalization_context"={"groups"={"d-jeton:get-all","d-jeton:get-item"}}
 *                },
 *          "put"={
 *              "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object.getFournisseur() == user)",
 *              "denormalization_context"={"groups"={"d-jeton:put"}},
 *              "validation_groups"={"d-jeton:putValidation"}
 *          },
 *          "delete"={
 *              "access_control"="is_granted('ROLE_ADMIN') or(is_granted('ROLE_FOURNISSEUR') and object.getFournisseur() == user)"
 *          }
 *     },
 *
 *     attributes={
 *     "pagination_items_per_page"=10,
 *     "pagination_client_enabled"=true
 *     },
 *     subresourceOperations={
 *          "api_fournisseurs_commandes_get_subresource"={
 *               "security"="is_granted('ROLE_FOURNISSEUR')",
 *          }
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\DemandeJetonRepository")
 */
class DemandeJeton implements CreatedEntityInterface, SetFournisseurInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"jeton:get-item","jeton:get-all","d-jeton:get-all","d-jeton:get-item"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Fournisseur",inversedBy="commandes")
     * @Groups({"d-jeton:get-all"})
     */
    private $fournisseur;


    /**
     * @ORM\Column(type="smallint")
     * @Groups({"d-jeton:post","d-jeton:put","d-jeton:get-all","d-jeton:get-item"})
     * @Assert\NotBlank(groups={"d-jeton:postValidation","d-jeton:putValidation"})
     */
    private $nbrJeton;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"d-jeton:get-all","d-jeton:get-item"})
     */
    private $isUse;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"d-jeton:get-all","d-jeton:get-item"})
     */
    private $created;

    public function __construct()
    {
        $this->isUse = false;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNbrJeton()
    {
        return $this->nbrJeton;
    }

    public function setNbrJeton(string $nbrJeton): self
    {
        $this->nbrJeton = $nbrJeton;

        return $this;
    }

    public function getIsUse()
    {
        return $this->isUse;
    }

    public function setIsUse(bool $isUse): self
    {
        $this->isUse = $isUse;

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

    public function getFournisseur()
    {
        return $this->fournisseur;
    }

    public function setFournisseur(Fournisseur $fournisseur): SetFournisseurInterface
    {
        $this->fournisseur = $fournisseur;
        return $this;
    }


}
