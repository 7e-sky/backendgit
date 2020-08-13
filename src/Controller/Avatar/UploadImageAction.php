<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 31/07/2019
 * Time: 10:28
 */

namespace App\Controller\Avatar;


use ApiPlatform\Core\Validator\Exception\ValidationException;
use ApiPlatform\Core\Validator\ValidatorInterface;
use App\Entity\Avatar;
use App\Form\FileUploadType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\FormFactoryInterface;
use Symfony\Component\HttpFoundation\Request;

class UploadImageAction
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
        $avatar = new Avatar();

        // Validate the form
        $form = $this->formFactory->create(FileUploadType::class,$avatar);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            //Persist the new Image entity
            $this->entityManager->persist($avatar);
            $this->entityManager->flush();
            $avatar->setFile(null);

            return $avatar;
        }




        // Uploading done for us in background by VichUploader...


        // Throw an validation exception, tha means something went wrong during
        throw new ValidationException($this->validator->validate($avatar));
    }

}