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
 *      "post"={
 *          "access_control"="is_granted('ROLE_ADMIN')",
 *          "denormalization_context"={"groups"={"post"}},
 *          "validation_groups"="post"
 *          },
 *      "get"={
 *          "access_control"="is_granted('ROLE_ADMIN')"
 *          }
 * },
 *     itemOperations={
 *      "get"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ZONE') and object == user) or ( is_granted('IS_AUTHENTICATED_FULLY') and object == user->getParent1())"
 *          },
 *      "put"={
 *          "access_control"="is_granted('ROLE_ADMIN') or (is_granted('ROLE_ZONE') and object == user)",
 *           "denormalization_context"={"groups"={"put"}}
 *          }
 *      },
 *     normalizationContext={
 *      "groups"={"get"}
 *     }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\ZoneCommercialRepository")
 *
 */
class ZoneCommercial extends User
{

    /**
     * @ORM\ManyToMany(targetEntity="Pays")
     * @ORM\JoinTable()
     * @Groups({"get","put","post"})
     * @Assert\NotBlank()
     * @ApiSubresource()
     */
    private $pays;


    public function __construct()
    {
        parent::__construct();
        $this->pays = new ArrayCollection();
    }

    public function getPays():Collection
    {
        return $this->pays;
    }

    public function addPay(Pays $pays){

        $this->pays->add($pays);

    }

    public function removePay(Pays $pays){

        $this->pays->removeElement($pays);

    }


}
