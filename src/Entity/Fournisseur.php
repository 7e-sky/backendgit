<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Annotation\ApiSubresource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *     collectionOperations={
 *     "post"={
 *
 *              "denormalization_context"={"groups"={"post"}},
 *              "validation_groups"="post"
 *     },
 *     "get"
 *      },
 *     itemOperations={
 *     "get"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object == user)",
 *           "normalization_context"={"groups"={"get"}}
 *          },
 *     "put"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_FOURNISSEUR') and object == user)",
 *           "denormalization_context"={"groups"={"put"}}
 *          }
 *     },
 *     normalizationContext={
 *      "groups"={"get"}
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\FournisseurRepository")
 *
 */
class Fournisseur extends User
{

    /**
     * @ORM\ManyToOne(targetEntity="Pays")
     * @Groups({"get","put","post"})
     * @Assert\NotBlank(groups={"post"})
     */
    private $pays;

    /**
     * @ORM\ManyToOne(targetEntity="Ville")
     * @Groups({"get","put","post"})
     * @Assert\NotBlank(groups={"post"})
     */
    private $ville;


    /**
     * @ORM\ManyToMany(targetEntity="SousSecteur")
     * @ORM\JoinTable()
     * @Groups({"get","put"})
     * @Assert\NotBlank()
     * @ApiSubresource()
     */
    private $sousSecteurs;



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


}
