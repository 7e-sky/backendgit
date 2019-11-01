<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 29/10/2019
 * Time: 11:28
 */

namespace App\Validator\Constraints;

use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\ConstraintValidator;

class ValidePhoneValidator extends ConstraintValidator
{
    public function validate($value, Constraint $constraint): void
    {

        $phoneUtil = \libphonenumber\PhoneNumberUtil::getInstance();

        try{
            $PhoneNumberProto = $phoneUtil->parse($value,'MA');
            if(!$phoneUtil->isValidNumber($PhoneNumberProto)){
                $this->context->buildViolation($constraint->message)->addViolation();
            }

        }
        catch (\libphonenumber\NumberParseException $e){
            $this->context->buildViolation($constraint->message)->addViolation();
        }
    }
}