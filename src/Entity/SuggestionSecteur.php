<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Interfaces\CreatedEntityInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *     collectionOperations={
 *          "post"={
 *              "access_control"="is_granted('IS_AUTHENTICATED_FULLY')",
 *              "denormalization_context"={"groups"={"sugg-secteur:post"}},
 *              "validation_groups"={"sugg-secteur:postValidation"},
 *              "normalization_context"={"groups"={"sugg-secteur:get-all"}}
 *          },
 *          "get"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "normalization_context"={"groups"={"sugg-secteur:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *          "get"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "normalization_context"={"groups"={"sugg-secteur:get-all"}}
 *          }
 *     },
 *     attributes={"pagination_enabled"=false},
 * )
 * @ORM\Entity(repositoryClass="App\Repository\SuggestionSecteurRepository")
 */
class SuggestionSecteur implements CreatedEntityInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"sugg-secteur:get-all","sugg-secteur:post"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=100)
     * @Groups({"sugg-secteur:get-all","sugg-secteur:post"})
     * @Assert\NotBlank(groups={"sugg-secteur:postValidation"})
     */
    private $secteur;

    /**
     * @ORM\Column(type="string", length=100)
     * @Groups({"sugg-secteur:get-all","sugg-secteur:post"})
     * @Assert\NotBlank(groups={"sugg-secteur:postValidation"})
     */
    private $sousSecteur;

    /**
     * @ORM\Column(type="string", length=100, nullable=true)
     * @Groups({"sugg-secteur:get-all","sugg-secteur:post"})
     */
    private $categorie;

    /**
     * @ORM\Column(type="string", length=100)
     * @Groups({"sugg-secteur:get-all","sugg-secteur:post"})
     * @Assert\NotBlank(groups={"sugg-secteur:postValidation"})
     */
    private $pageSuggestion;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"sugg-secteur:get-all"})
     */
    private $etat;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"sugg-secteur:get-all"})
     */
    private $created;

    /**
     * @ORM\ManyToOne(targetEntity="User")
     * @Groups({"sugg-secteur:get-all","sugg-secteur:post"})
     * @Assert\NotBlank(groups={"sugg-secteur:postValidation"})
     */
    private $user;


    public function __construct()
    {
        $this->etat = false;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getSecteur()
    {
        return $this->secteur;
    }

    public function setSecteur($secteur): self
    {
        $this->secteur = $secteur;

        return $this;
    }

    public function getSousSecteur()
    {
        return $this->sousSecteur;
    }

    public function setSousSecteur($sousSecteur): self
    {
        $this->sousSecteur = $sousSecteur;

        return $this;
    }

    public function getCategorie()
    {
        return $this->categorie;
    }

    public function setCategorie($categorie): self
    {
        $this->categorie = $categorie;

        return $this;
    }

    public function getPageSuggestion()
    {
        return $this->pageSuggestion;
    }

    public function setPageSuggestion($pageSuggestion): self
    {
        $this->pageSuggestion = $pageSuggestion;

        return $this;
    }

    public function getEtat()
    {
        return $this->etat;
    }

    public function setEtat($etat): self
    {
        $this->etat = $etat;

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

    /**
     * @return mixed
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * @param mixed $user
     */
    public function setUser($user): void
    {
        $this->user = $user;
    }


}
