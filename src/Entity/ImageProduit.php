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
use App\Controller\ImageProduit\UploadImageProduitAction;


/**
 * @ORM\Entity()
 * @ApiResource(
 *     collectionOperations={
 *     "get",
 *     "post"={
 *           "access_control"="is_granted('ROLE_FOURNISSEUR')",
 *           "method"="POST",
 *           "path"="/image_produits",
 *           "controller"=UploadImageProduitAction::class,
 *           "defaults"={"_api_receive"=false}
 *           }
 * },
 *     itemOperations={"put","get","delete"},
 *     normalizationContext={
 *      "groups"={"get"}
 *     }
 * )
 * @Vich\Uploadable()
 */
class ImageProduit
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"get","produit:get-item","produit:get-all","produit:get-from-fournisseur","produit:post"})
     */
    private $id;

    /**
     * @ORM\Column(nullable=true)
     * @Groups({"get","produit:get-item","produit:get-all","produit:get-from-fournisseur","produit:post"})
     */
    private $url;

    /**
     * @Vich\UploadableField(mapping="produitImage",fileNameProperty="url")
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
        return '/images/produits/'.$this->url;
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