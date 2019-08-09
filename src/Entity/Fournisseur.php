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
 *
 *     collectionOperations={
 *
 *     "post"={
 *              "denormalization_context"={"groups"={"post"}},
 *              "validation_groups"={"postValidation"},
 *
 *     },
 *     "get"={"access_control"="is_granted('ROLE_ADMIN')"}
 *      },
 *     itemOperations={
 *     "get"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object == user)",
 *           "normalization_context"={"groups"={"get"}},
 *          "defaults"={"del"="false"}
 *          },
 *     "put"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object == user)",
 *           "denormalization_context"={"groups"={"put"}},
 *              "validation_groups"={"putValidation"}
 *          }
 *     },
 *     attributes={
 *     "force_eager"=false,
 *     "normalization_context"={"groups"={"get"},"enable_max_depth"=true},
 *     "order"={"id":"desc"}
 *     }
 * )
 * @ApiFilter(
 *     BooleanFilter::class,properties={"del"}
 * )
 * @ORM\Entity(repositoryClass="App\Repository\FournisseurRepository")
 *
 */
class Fournisseur extends User
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
     * @ORM\ManyToMany(targetEntity="SousSecteur")
     * @ORM\JoinTable()
     * @Groups({"get","put","post"})
     * @Assert\NotBlank()
     * @ApiSubresource()
     */
    private $sousSecteurs;


    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get","put","post","get-from-demande","get-from-diffusionDemande","get-from-blacklist"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\Length(min=3,max=255,groups={"postValidation","putValidation"})
     */
    private $societe;



    public function __construct()
    {
        parent::__construct();
        $this->sousSecteurs = new ArrayCollection();
    }


    public function getPays()
    {
        return $this->pays;
    }


    public function setPays($pays): void
    {
        $this->pays = $pays;
    }


    public function getVille()
    {
        return $this->ville;
    }


    public function setVille($ville): void
    {
        $this->ville = $ville;
    }


    public function getSousSecteurs() : Collection
    {
        return $this->sousSecteurs;
    }

    public function addSousSecteur(SousSecteur $secteur){

        $this->sousSecteurs->add($secteur);

    }

    public function removeSousSecteur(SousSecteur $secteur){

        $this->sousSecteurs->removeElement($secteur);

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




}
