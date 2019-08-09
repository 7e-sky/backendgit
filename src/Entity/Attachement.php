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
use App\Controller\DemandeAchat\UploadAttachementAction;


/**
 * @ORM\Entity()
 * @ApiResource(
 *     collectionOperations={
 *     "get",
 *     "post"={
 *           "access_control"="is_granted('ROLE_ACHETEUR')",
 *           "method"="POST",
 *           "path"="/attachements",
 *           "controller"=UploadAttachementAction::class,
 *           "defaults"={"_api_receive"=false}
 *
 *     }
 * },
 *     itemOperations={"put","get"},
 *     normalizationContext={
 *      "groups"={"get"}
 *     }
 * )
 * @Vich\Uploadable()
 */
class Attachement
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"get","get-from-demande"})
     */
    private $id;

    /**
     * @ORM\Column(nullable=true)
     * @Groups({"get","get-from-demande"})
     */
    private $url;

    /**
     * @Vich\UploadableField(mapping="demande",fileNameProperty="url")
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
        return '/attachement/demandeAchat/'.$this->url;
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