<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 29/10/2019
 * Time: 11:27
 */

namespace App\Validator\Constraints;

use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\Exception\MissingOptionsException;

/**
 * @Annotation
 */
class ValidePhone extends Constraint
{

    public $message = 'Le numéro de téléphone n\'est pas valide';
}