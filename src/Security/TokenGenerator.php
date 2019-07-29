<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 29/07/2019
 * Time: 10:11
 */

namespace App\Security;


class TokenGenerator
{

    private const ALPHAPET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@&.';

    public function getRandomSecureToken(int $length = 30 ): string
    {
        $token='';
        $maxNumber = strlen(self::ALPHAPET);

        for ( $i = 0; $i < $length; $i++){
            $token .= self::ALPHAPET[random_int(0,$maxNumber-1)];
        }
        return $token;

    }

}