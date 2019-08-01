<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *     collectionOperations={
 *     "post",
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
     * @Groups({"get"})
     * @Assert\NotBlank()
     */
    private $pays;

    /**
     * @ORM\ManyToOne(targetEntity="Ville")
     * @Groups({"get"})
     * @Assert\NotBlank()
     */
    private $ville;



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




}
