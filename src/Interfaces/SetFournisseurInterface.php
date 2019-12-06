<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 08/08/2019
 * Time: 12:04
 */

namespace App\Interfaces;


use App\Entity\Fournisseur;

interface SetFournisseurInterface
{
    public function setFournisseur(Fournisseur $fournisseur): SetFournisseurInterface;
}