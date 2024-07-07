<?php
// src/Entity/DirecteurAchat.php
namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * @ApiResource(
 *     normalizationContext={"groups"={"directeurAchat:read"}},
 *     denormalizationContext={"groups"={"directeurAchat:write"}}
 * )
 * @ORM\Entity(repositoryClass="App\Repository\DirecteurAchatRepository")
 */
class DirecteurAchat
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     * @Groups({"directeurAchat:read", "acheteur:read"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"directeurAchat:read", "directeurAchat:write", "acheteur:read"})
     */
    private $name;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Acheteur", mappedBy="directeurAchat")
     * @Groups({"directeurAchat:read"})
     */
    private $acheteurs;

    public function __construct()
    {
        $this->acheteurs = new ArrayCollection();
    }

    // Getters and setters...
}
