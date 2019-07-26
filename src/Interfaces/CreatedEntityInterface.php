<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 24/07/2019
 * Time: 16:51
 */

namespace App\Interfaces;


interface CreatedEntityInterface
{
    public function setCreated(\DateTimeInterface $created): CreatedEntityInterface;
}