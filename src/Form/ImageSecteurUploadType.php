<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 31/07/2019
 * Time: 10:15
 */

namespace App\Form;


use App\Entity\ImageSecteur;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ImageSecteurUploadType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
       $builder->add('file',FileType::class,[
           'label'=>'label.file',
           'required'=>false
       ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
      $resolver->setDefaults([
         'data_class'=>ImageSecteur::class,
         'csrf_protection'=>false
      ]);
    }

    public function getBlockPrefix()
    {
        return '';
    }

}