<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 08/08/2019
 * Time: 12:04
 */

namespace App\Interfaces;


use App\Entity\Acheteur;

interface SetAcheteurInterface
{
    public function setAcheteur(Acheteur $acheteur): SetAcheteurInterface;
}