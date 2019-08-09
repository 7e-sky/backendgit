<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 07/08/2019
 * Time: 10:59
 */

namespace App\Controller\DemandeAchat;


use ApiPlatform\Core\Validator\Exception\ValidationException;
use ApiPlatform\Core\Validator\ValidatorInterface;
use App\Entity\Attachement;
use App\Form\AttachementUploadType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\FormFactoryInterface;
use Symfony\Component\HttpFoundation\Request;

class UploadAttachementAction
{
    /**
     * @var FormFactoryInterface
     */
    private $formFactory;
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;
    /**
     * @var ValidatorInterface
     */
    private $validator;

    public function __construct(FormFactoryInterface $formFactory,EntityManagerInterface $entityManager,ValidatorInterface $validator)
    {

        $this->formFactory = $formFactory;
        $this->entityManager = $entityManager;
        $this->validator = $validator;
    }

    public function __invoke(Request $request)
    {
        // TODO: Implement __invoke() method.

        // Create a new Avatar instance
        $attachement = new Attachement();

        // Validate the form
        $form = $this->formFactory->create(AttachementUploadType::class,$attachement);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            //Persist the new attachement entity
            $this->entityManager->persist($attachement);
            $this->entityManager->flush();

            $attachement->setFile(null);

            return $attachement;
        }




        // Uploading done for us in background by VichUploader...


        // Throw an validation exception, tha means something went wrong during
        throw new ValidationException($this->validator->validate($attachement));
    }
}