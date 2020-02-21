<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Context\ExecutionContextInterface;
use Vich\UploaderBundle\Mapping\Annotation as Vich;
use App\Controller\Actualite\ActualiteImageAction;

/**
 * @ApiResource(
 *      collectionOperations={
 *     "get",
 *     "post"={
 *           "access_control"="is_granted('ROLE_ADMIN')",
 *           "method"="POST",
 *           "path"="/actualite_images",
 *           "controller"=ActualiteImageAction::class,
 *           "defaults"={"_api_receive"=false}
 *
 *     }
 * },
 *     itemOperations={"get"},
 *     normalizationContext={
 *      "groups"={"get"}
 *     }
 * )
 * @Vich\Uploadable()
 * @ORM\Entity(repositoryClass="App\Repository\ActualiteImageRepository")
 */
class ActualiteImage
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(nullable=true)
     * @Groups({"get","actualite:get-all"})
     */
    private $url;

    /**
     * @Vich\UploadableField(mapping="actualiteImage",fileNameProperty="url")
     * @Assert\NotNull()
     * @Assert\File(maxSize="1M")
     */
    private $file;



    public function getId()
    {
        return $this->id;
    }


    public function getUrl()
    {
        return '/images/actualite/'.$this->url;
    }


    public function setUrl($url): void
    {
        $this->url = $url;
    }


    public function getFile()
    {
        return $this->file;
    }

    public function setFile($file): void
    {
        $this->file = $file;
    }

    /**
     * @Assert\Callback
     */
    public function validate(ExecutionContextInterface  $context)
    {
        if (! in_array($this->file->getMimeType(), array(
            'image/jpeg',
            'image/gif',
            'image/png',
        ))) {
            $context
                ->buildViolation('Wrong file type (jpg,gif,png)')
                ->atPath('fileName')
                ->addViolation()
            ;
        }
    }
}
