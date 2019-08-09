<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 09/08/2019
 * Time: 12:24
 */

namespace App\Exception;


use Throwable;

class DisableToDelete extends \Exception
{

    public function __construct(string $message = "", int $code = 0, Throwable $previous = null)
    {
        parent::__construct("You can not delete an RFQ in progress or expired", $code, $previous);
    }

}