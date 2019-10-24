<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Interfaces\CreatedEntityInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\Validator\Constraints\UserPassword;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use App\Controller\ResetPasswordAction;

/**
 * @ApiResource(
 *     collectionOperations={
 *
 *     },
 *     itemOperations={

 *          "put-reset-password"={
 *               "access_control"="is_granted('IS_AUTHENTICATED_FULLY') and object === user",
 *               "method"="PUT",
 *               "path"="/users/{id}/reset-password",
 *               "controller"=ResetPasswordAction::class,
 *               "denormalization_context"={"groups"={"putResetPassword"}},
 *              "validation_groups"={"putResetPasswordValidation"}
 *           }
 *     },
 *
 *     normalizationContext={
 *      "groups"={"get"}
 *     },

 * )
 * @ORM\Entity(repositoryClass="App\Repository\UserRepository")
 * @ORM\InheritanceType("JOINED")
 * @ORM\DiscriminatorColumn(name="discr", type="string")
 * @ORM\DiscriminatorMap({"User" = "User","Admin" = "Admin","Acheteur" = "Acheteur","Fournisseur"="Fournisseur","Commercial"="Commercial","ZoneCommercial"="ZoneCommercial"})
 * @UniqueEntity("email", repositoryMethod="findByUniqueCriteria",groups={"postValidation","putValidation"})
 * @UniqueEntity("username", repositoryMethod="findByUniqueCriteria",groups={"postValidation","putValidation"})
 */
class User implements UserInterface,CreatedEntityInterface
{
    const ROLE_ADMIN = 'ROLE_ADMIN';
    const ROLE_ZONE = 'ROLE_ZONE';
    const ROLE_COMMERCIAL = 'ROLE_COMMERCIAL';
    const ROLE_ACHETEUR = 'ROLE_ACHETEUR';
    const ROLE_FOURNISSEUR = 'ROLE_FOURNISSEUR';

    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"get","get-from-demande","get-from-sous-secteur","get-from-pays"})
     */
    protected $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get","put","post"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\Length(min=6,max=255,groups={"postValidation","putValidation"})
     */
    protected $username;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get","put","post","get-from-demande","get-from-sous-secteur","get-from-pays"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\Length(min=6,max=255,groups={"postValidation","putValidation"})
     */
    protected $firstName;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get","put","post","get-from-sous-secteur"})
     * @Assert\NotBlank(groups={"postValidation","putValidation","get-from-demande","get-from-pays"})
     * @Assert\Length(min=6,max=255,groups={"postValidation","putValidation"})
     */
    protected $lastName;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get","put","post"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\Length(min=6,max=255,groups={"postValidation","putValidation"})
     */
    protected $adresse1;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     * @Groups({"get","put","post"})
     * @Assert\Length(min=6,max=255,groups={"postValidation","putValidation"})
     */
    protected $adresse2;

    /**
     * @ORM\Column(type="integer")
     * @Groups({"get","put","post"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\Length(min=4,max=255,groups={"postValidation","putValidation"})
     *
     */
    protected $codepostal;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get","put","post"})
     * @Assert\NotBlank(groups={"postValidation","putValidation"})
     * @Assert\Length(min=10,max=255,groups={"postValidation","putValidation"})
     */
    protected $phone;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank(groups={"postValidation"})
     * @Assert\Email(groups={"postValidation"})
     * @Assert\Length(min=10,max=255,groups={"postValidation"})
     * @Groups({"get-admin","post","put-admin"})
     */
    protected $email;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank(groups={"postValidation"})
     * @Groups({"post"})
     * @Assert\Length(min=6,max=255,groups={"postValidation"})
     * @Assert\Regex(
     *     pattern="/(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{7,}/",
     *     message="erreur pass",
     *     groups={"postValidation"}
     * )
     */
    protected $password;


    /**
     * @Assert\NotBlank(groups={"post","postValidation"})
     * @Groups({"post"})
     * @Assert\Expression(
     *     "this.getPassword() === this.getConfirmpassword()",
     *     message="Passwords does not match",
     *     groups={"postValidation"}
     * )
     */
    protected $confirmpassword;


    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get","put","get-from-sous-secteur","get-from-pays"})
     * @Assert\NotNull()
     */
    protected $del;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get","put-admin"})
     * @Assert\NotNull()
     */
    protected $isactif;

    /**
     * @ORM\ManyToOne(targetEntity="User")
     * @Groups({"get-admin"})
     * @ORM\JoinColumn(name="parent1", referencedColumnName="id" , nullable=true)
     *
     */
    protected $parent1;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"get"})
     */
    protected $created;

    /**
     * @ORM\Column(type="simple_array",length=200)
     * @Groups({"get-admin","get-owner"})
     */
    protected $roles;


    /**
     * @ORM\ManyToOne(targetEntity="Avatar")
     * @Groups({"get","put","post"})
     */
    protected $avatar;


    /**
     * @Assert\NotBlank()
     * @Groups({"putResetPassword"})
     * @Assert\Length(min=6,max=255)
     * @Assert\Regex(
     *     pattern="/(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{7,}/",
     *     message="erreur pass"
     *
     * )
     */
    protected $newPassword;

    /**
     * @Assert\NotBlank()
     * @Groups({"putResetPassword"})
     * @Assert\Expression(
     *     "this.getNewPassword() === this.getNewConfirmpassword()",
     *     message="Passwords does not match"
     *
     *
     * )
     */
    protected $newConfirmpassword;

    /**
     * @Assert\NotBlank()
     * @Groups({"putResetPassword"})
     * @UserPassword()
     */
    protected $oldPassword;


    /**
     * @ORM\Column(type="integer",nullable=true)
     */
    protected $passwordChangeDate;


    /**
     * @ORM\Column(type="string",length=40,nullable=true)
     */
    protected  $confirmationToken;


    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get-admin","get-owner"})
     */
    protected $redirect;

    public function __construct()
    {
        $this->isactif=false;
        $this->del=false;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFirstName(): ?string
    {
        return $this->firstName;
    }

    public function setFirstName(string $firstname): self
    {
        $this->firstName = $firstname;

        return $this;
    }

    public function getLastName(): ?string
    {
        return $this->lastName;
    }

    public function setLastName(string $lastname): self
    {
        $this->lastName = $lastname;

        return $this;
    }

    public function getAdresse1(): ?string
    {
        return $this->adresse1;
    }

    public function setAdresse1(string $adresse1): self
    {
        $this->adresse1 = $adresse1;

        return $this;
    }

    public function getAdresse2(): ?string
    {
        return $this->adresse2;
    }

    public function setAdresse2(?string $adresse2): self
    {
        $this->adresse2 = $adresse2;

        return $this;
    }

    public function getCodePostal(): ?int
    {
        return $this->codepostal;
    }

    public function setCodePostal(int $codepostal): self
    {
        $this->codepostal = $codepostal;

        return $this;
    }

    public function getPhone(): ?string
    {
        return $this->phone;
    }

    public function setPhone(string $phone): self
    {
        $this->phone = $phone;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    public function getDel(): ?bool
    {
        return $this->del;
    }

    public function setDel(bool $del): self
    {
        $this->del = $del;

        return $this;
    }

    public function getIsActif(): ?bool
    {
        return $this->isactif;
    }

    public function setIsActif(bool $isactif): self
    {
        $this->isactif = $isactif;

        return $this;
    }


    public function getParent1()
    {
        return $this->parent1;
    }

    public function setParent1($parent1): void
    {
        $this->parent1 = $parent1;
    }



    public function getCreated(): ?\DateTimeInterface
    {
        return $this->created;
    }

    public function setCreated(\DateTimeInterface $created): CreatedEntityInterface
    {
        $this->created = $created;

        return $this;
    }

    public function getUsername(): ?string
    {
        return $this->username;
    }


    public function setUsername($username): self
    {
        $this->username = $username;
        return $this;

    }

    public function getRoles():array
    {
        return $this->roles;
    }
    public function setRoles(array $roles)
    {
        $this->roles=$roles;
    }

    /**
     * @return mixed
     */
    public function getAvatar()
    {
        return $this->avatar;
    }

    /**
     * @param mixed $avatar
     */
    public function setAvatar($avatar): void
    {
        $this->avatar = $avatar;
    }



    public function getSalt()
    {
        return null;
    }



    public function eraseCredentials()
    {
        // TODO: Implement eraseCredentials() method.
    }

    /**
     * @return mixed
     */
    public function getConfirmpassword()
    {
        return $this->confirmpassword;
    }

    /**
     * @param mixed $confirmpassword
     */
    public function setConfirmpassword($confirmpassword): void
    {
        $this->confirmpassword = $confirmpassword;
    }


    public function getNewPassword(): ?string
    {
        return $this->newPassword;
    }

    /**
     * @param mixed $newPassword
     */
    public function setNewPassword($newPassword): void
    {
        $this->newPassword = $newPassword;
    }


    public function getNewConfirmpassword(): ?string
    {
        return $this->newConfirmpassword;
    }

    /**
     * @param mixed $newConfirmpassword
     */
    public function setNewConfirmpassword($newConfirmpassword): void
    {
        $this->newConfirmpassword = $newConfirmpassword;
    }

    public function getOldPassword(): ?string
    {
        return $this->oldPassword;
    }

    /**
     * @param mixed $oldPassword
     */
    public function setOldPassword($oldPassword): void
    {
        $this->oldPassword = $oldPassword;
    }


    public function getPasswordChangeDate()
    {
        return $this->passwordChangeDate;
    }


    public function setPasswordChangeDate($passwordChangeDate): void
    {
        $this->passwordChangeDate = $passwordChangeDate;
    }

    /**
     * @return mixed
     */
    public function getConfirmationToken()
    {
        return $this->confirmationToken;
    }

    /**
     * @param mixed $confirmationToken
     */
    public function setConfirmationToken($confirmationToken): void
    {
        $this->confirmationToken = $confirmationToken;
    }

    /**
     * @return mixed
     */
    public function getRedirect()
    {
        return $this->redirect;
    }

    /**
     * @param mixed $redirect
     */
    public function setRedirect($redirect): void
    {
        $this->redirect = $redirect;
    }








}
