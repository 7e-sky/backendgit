<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 31/07/2019
 * Time: 09:51
 */

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Context\ExecutionContextInterface;
use Vich\UploaderBundle\Mapping\Annotation as Vich;
use App\Controller\ImageProduit\UploadAttachementProduitAction;


/**
 * @ORM\Entity()
 * @ApiResource(
 *     collectionOperations={
 *     "get",
 *     "post"={
 *           "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *           "method"="POST",
 *           "path"="/fiches",
 *           "controller"=UploadAttachementProduitAction::class,
 *           "defaults"={"_api_receive"=false}
 *
 *     }
 * },
 *     itemOperations={"put","get","delete"},
 *     normalizationContext={
 *      "groups"={"get"}
 *     }
 * )
 * @Vich\Uploadable()
 */
class Fiche
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @Groups({"get","produit:get-item","produit:get-all"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(nullable=true)
     * @Groups({"get","produit:get-item","produit:get-all"})
     */
    private $url;

    /**
     * @Vich\UploadableField(mapping="produitFiche",fileNameProperty="url",size="fileSize",mimeType="type")
     * @Assert\NotNull()
     * @Assert\File(maxSize="3M")
     */
    private $file;


    /**
     * @ORM\Column(type="integer")
     * @Groups({"get"})
     * @var integer
     */
    private $fileSize;

    /**
     * @ORM\Column(nullable=true)
     * @Groups({"get"})
     */
    private $type;





    public function getId()
    {
        return $this->id;
    }


    public function getUrl()
    {
        return '/attachement/produits/'.$this->url;
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
     * @return int
     */
    public function getFileSize(): int
    {
        return $this->fileSize;
    }

    /**
     * @param int $fileSize
     */
    public function setFileSize(?int $fileSize): void
    {
        $this->fileSize = $fileSize;
    }

    /**
     * @return mixed
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * @param mixed $type
     */
    public function setType($type): void
    {
        $this->type = $type;
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
            'application/pdf',
            'application/vnd.ms-excel',
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
            'application/msword',
            'application/vnd.ms-powerpoint',
            'application/vnd.openxmlformats-officedocument.presentationml.presentation',
            'text/plain'
        ))) {
            $context
                ->buildViolation('Wrong file type (jpg,gif,png,pdf,xls,xlsx,doc,docx,txt,ppt,pptx)')
                ->atPath('fileName')
                ->addViolation()
            ;
        }
    }



}