<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *     collectionOperations={
 *          "post"
 *      },
 *     itemOperations={
 *          "get"={
 *               "normalization_context"={"groups"={"get-from-demande"}}
 *          }
 *     },
 *     normalizationContext={
 *      "groups"={"get-from-diffusionDemande"}
 *     },
 *     subresourceOperations={
 *          "api_demande_achats_diffusionsdemandes_get_subresource"={
 *               "normalization_context"={"groups"={"get-from-diffusionDemande"}},
 *               "access_control"="is_granted('ROLE_ADMIN')"
 *          }
 *    }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\DiffusionDemandeRepository")
 *
 */
class DiffusionDemande
{


    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"get-from-diffusionDemande","get-from-demande"})
     */
    private $id;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"get-from-diffusionDemande","get-from-demande"})
     */
    private $dateDiffusion;



    /**
     * @ORM\ManyToOne(targetEntity="Fournisseur")
     * @Groups({"get-from-diffusionDemande","get-from-demande"})
     */
    private $fournisseur;

    /**
     * @ORM\ManyToOne(targetEntity="DemandeAchat", inversedBy="diffusionsdemandes",cascade={"persist"})
     */
    private $demande;


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDateDiffusion(): ?\DateTimeInterface
    {
        return $this->dateDiffusion;
    }

    public function setDateDiffusion(\DateTimeInterface $dateDiffusion): self
    {
        $this->dateDiffusion = $dateDiffusion;

        return $this;
    }

    public function getFournisseur()
    {
        return $this->fournisseur;
    }


    public function setFournisseur($fournisseur): void
    {
        $this->fournisseur = $fournisseur;
    }


    public function getDemande()
    {
        return $this->demande;
    }


    public function setDemande($demande): void
    {
        $this->demande = $demande;
    }


}
