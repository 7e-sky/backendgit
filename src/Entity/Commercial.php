<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Annotation\ApiSubresource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

//TODO : or (is_granted('ROLE_ZONE') and object->getParent1() == user)

/**
 * @ApiResource(
 *     collectionOperations={
 *      "post"={
 *          "access_control"="is_granted('ROLE_ZONE')"
 *          },
 *      "get"={
 *          "access_control"="is_granted('ROLE_ZONE')"
 *          }
 * },
 *     itemOperations={
 *      "get"={
 *          "access_control"="is_granted('ROLE_ZONE') or  (is_granted('ROLE_COMMERCIAL') and object == user) or ( is_granted('IS_AUTHENTICATED_FULLY') and object == user->getParent1())"
 *          },
 *      "put"={
 *          "access_control"="is_granted('ROLE_ZONE')  or (is_granted('ROLE_COMMERCIAL') and object == user) ",
 *           "denormalization_context"={"groups"={"put"}}
 *          }
 *      },
 *     normalizationContext={
 *      "groups"={"get"}
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\CommercialRepository")
 *
 */
class Commercial extends User
{

    /**
     * @ORM\ManyToMany(targetEntity="Ville")
     * @ORM\JoinTable()
     * @Groups({"get","put"})
     * @Assert\NotBlank()
     * @ApiSubresource()
     */
    private $villes;

    public function __construct()
    {
        parent::__construct();
        $this->villes = new ArrayCollection();
    }


    public function getVilles() : Collection
    {
        return $this->villes;
    }

    public function addVille(Ville $ville){

        $this->villes->add($ville);

    }

    public function removeVille(Ville $ville){

        $this->villes->removeElement($ville);

    }




}
