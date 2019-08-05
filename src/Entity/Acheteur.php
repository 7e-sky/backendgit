<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *               "denormalization_context"={"groups"={"post"}},
 *                 "validation_groups"="post"
 *            }
 *      },
 *     itemOperations={
 *      "get"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object == user)"
 *          },
 *      "put"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ACHETEUR') and object == user)",
 *           "denormalization_context"={"groups"={"put"}}
 *          }
 *      },
 *     normalizationContext={
 *      "groups"={"get"}
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\AcheteurRepository")
 */
class Acheteur extends User
{

    /**
     * @ORM\ManyToOne(targetEntity="Pays")
     * @Groups({"get","post","put"})
     * @Assert\NotBlank(groups={"post"})
     */
    private $pays;

    /**
     * @ORM\ManyToOne(targetEntity="Ville")
     * @Groups({"get","post","put"})
     * @Assert\NotBlank(groups={"post"})
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



}
