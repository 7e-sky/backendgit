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
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "denormalization_context"={"groups"={"faq:post"}},
 *              "validation_groups"={"faq:postValidation"},
 *              "normalization_context"={"groups"={"faq:get-all"}}
 *          },
 *          "get"={
 *              "normalization_context"={"groups"={"faq:get-all"}}
 *          }
 *     },
 *     itemOperations={
 *
 *          "get"={
 *              "normalization_context"={"groups"={"faq:get-item","faq:get-all"}}
 *          },
 *          "put"={
 *              "denormalization_context"={"groups"={"faq:put"}},
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *              "validation_groups"={"faq:putValidation"}
 *          },
 *          "delete"={
 *              "access_control"="is_granted('ROLE_ADMIN')",
 *          }
 *     },
 *     attributes={"pagination_enabled"=false},
 * )
 * @ORM\Entity(repositoryClass="App\Repository\FaqRepository")
 */
class Faq
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"faq:get-all"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"faq:post","faq:put","faq:get-all","faq_cat:get-all"})
     * @Assert\NotBlank(groups={"faq:postValidation","faq:putValidation"})
     */
    private $question;

    /**
     * @ORM\Column(type="text")
     * @Groups({"faq:post","faq:put","faq:get-all","faq_cat:get-all"})
     * @Assert\NotBlank(groups={"faq:postValidation","faq:putValidation"})
     */
    private $reponse;

    /**
     * @ORM\ManyToOne(targetEntity="FaqCategorie", inversedBy="faqs")
     * @Groups({"faq:post","faq:put","faq:get-all"})
     * @Assert\NotBlank(groups={"faq:postValidation","faq:putValidation"})
     */
    private $categorie;


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getQuestion()
    {
        return $this->question;
    }

    public function setQuestion($question): self
    {
        $this->question = $question;

        return $this;
    }

    public function getReponse()
    {
        return $this->reponse;
    }

    public function setReponse($reponse): self
    {
        $this->reponse = $reponse;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getCategorie()
    {
        return $this->categorie;
    }

    /**
     * @param mixed $categorie
     */
    public function setCategorie($categorie): void
    {
        $this->categorie = $categorie;
    }



}
