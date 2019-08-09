<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Annotation\ApiSubresource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\BooleanFilter;

/**
 * @ApiResource(
 *     attributes={"order"={"created":"desc"}},
 *     collectionOperations={
 *          "post"={
 *               "denormalization_context"={"groups"={"post"}},
 *                "validation_groups"={"postValidation"}
 *            },
 *     "get"={"access_control"="is_granted('ROLE_ADMIN')"}
 *      },
 *     itemOperations={
 *      "get"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object == user)"
 *          },
 *      "put"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object == user)",
 *           "denormalization_context"={"groups"={"put"}},
 *             "validation_groups"={"putValidation"}
 *          }
 *      },
 *
 *     normalizationContext={
 *      "groups"={"get"}
 *     },
 *
 *
 * )
 * @ApiFilter(
 *     BooleanFilter::class,properties={"del"}
 * )
 * @ORM\Entity(repositoryClass="App\Repository\AcheteurRepository")
 */
class Acheteur extends User
{

    /**
     * @ORM\ManyToOne(targetEntity="Pays")
     * @Groups({"get","post","put"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     */
    private $pays;

    /**
     * @ORM\ManyToOne(targetEntity="Ville")
     * @Groups({"get","post","put"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     */
    private $ville;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get","put","post","get-from-demande"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\Length(min=3,max=255,groups={"postValidation","putValidation"})
     */
    private $societe;

    /**
     * @ORM\OneToMany(targetEntity="BlackListes", mappedBy="acheteur")
     * @ApiSubresource()
     */
    private $blacklistes;

    /**
     * @ORM\OneToMany(targetEntity="DemandeAchat", mappedBy="acheteur")
     * @ApiSubresource()
     */
    private $demandes;


    public function __construct()
    {
        parent::__construct();
        $this->blacklistes = new ArrayCollection();
        $this->demandes = new ArrayCollection();
    }

    public function getPays()
    {
        return $this->pays;

    }


    public function setPays($pays): void
    {
        $this->pays = $pays;
    }

    /**
     * @return mixed
     */
    public function getVille()
    {
        return $this->ville;
    }

    /**
     * @param mixed $ville
     */
    public function setVille($ville): void
    {
        $this->ville = $ville;
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


    public function getBlacklistes() : Collection
    {
        return $this->blacklistes;
    }

    public function getDemandes() : Collection
    {
        return $this->demandes;
    }







}
