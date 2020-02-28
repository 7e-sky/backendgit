<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 22/07/2019
 * Time: 12:27
 */

namespace App\Controller;


use App\Entity\Acheteur;
use App\Entity\Fiche;
use App\Entity\Fournisseur;
use App\Entity\Produit;
use App\Entity\User;
use App\Services\UserConfirmationService;
use App\Services\UserService;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\HttpFoundation\Request;

/**
 * @Route("/")
 */
class DefaultController extends AbstractController
{

    /**
     * @var UserConfirmationService
     */
    private $confirmationService;
    /**
     * @var UserService
     */
    private $userService;
    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;
    /**
     * @var JWTTokenManagerInterface
     */
    private $jwtManager;


    public function __construct(UserConfirmationService $confirmationService, UserService $userService, TokenStorageInterface $tokenStorage, JWTTokenManagerInterface $jwtManager)
    {
        $this->confirmationService = $confirmationService;
        $this->userService = $userService;
        $this->tokenStorage = $tokenStorage;
        $this->jwtManager = $jwtManager;
    }

    /**
     * @Route("/",name="defaultIndex",methods={"GET"})
     */
    public function index()
    {

        $em = $this->getDoctrine()->getManager();
        $users = $em->getRepository(User::class)->find(14);

        return $this->json('');
    }

    /**
     * @Route("/confrim-user/{token}", name="default_confirm_token")
     */
    public function confirm(string $token)
    {

        $this->confirmationService->confirmUser($token);

        return $this->redirectToRoute('defaultIndex');
    }

    /**
     * @Route("/api/currentUser", name="get_current_user")
     */
    public function getCurrentUser()
    {

        if ($this->tokenStorage->getToken() instanceof TokenInterface) {

            $user = $this->tokenStorage->getToken()->getUser();

            $tokenupdate = $this->jwtManager->create($user);


            $currency = '';

            if ($user instanceof Fournisseur || $user instanceof Acheteur) {
                $currency = $user->getCurrency() ? $user->getCurrency()->getName() : '';
            }

            $dataa['token'] = $tokenupdate;
            $dataa['user'] = [
                'id' => $user->getId(),
                'role' => $user->getRoles()[0],
                'data' => [
                    'displayName' => $user->getFirstName() . ' ' . $user->getLastName(),
                    'photoURL' => $user->getAvatar() ? $user->getAvatar()->getUrl() : '',
                    'email' => $user->getEmail(),
                    'redirect' => $user->getRedirect(),
                    'currency' => $currency,
                ]
            ];
        } else {
            $dataa = null;
        }


        return new JsonResponse($dataa);

    }

    /**
     * @Route("/fiche_technique/{id}", name="fiche_technique")
     */
    public function fiche(Fiche $fiche)
    {

        // Generate response
        $response = new JsonResponse();

        if (!$fiche) {
            return $response->setStatusCode(404);
        }
        $filename = dirname(__DIR__) . '/../public' . $fiche->getUrl();

        // Set headers
        $response->headers->set('Cache-Control', 'private');
        $response->headers->set('Content-type', mime_content_type($filename));
        $response->headers->set('Content-Disposition', 'attachment; filename="' . basename($filename) . '";');
        $response->headers->set('Content-length', filesize($filename));

        // Send headers before outputting anything
        $response->sendHeaders();

        $response->setContent(file_get_contents($filename));

        return $response;
    }


    /**
     * @Route("/count_produit_pays")
     */
    public function getCountProduitParPays(Request $request)
    {
        $secteur = $request->query->get('secteur', null);
        $sousSecteur = $request->query->get('sousSecteur', null);
        $categorie = $request->query->get('categorie', null);

        $result = null;

        $em = $this->getDoctrine()->getManager()->getRepository(Produit::class);

        // Jointures
        $qb = $em->createQueryBuilder('p')
            ->join('p.pays', 'pays');

        if ($secteur) {
            $qb->join('p.secteur', 'secteur');
        }
        if ($sousSecteur) {
            $qb->join('p.sousSecteurs', 'sousSecteurs');
        }
        if ($categorie) {
            $qb->join('p.categorie', 'categorie');
        }

        // Where condition
        $qb->where('p.del=0');
        $qb->andWhere('p.isValid=1');


        if ($sousSecteur) {
            $qb->andWhere('sousSecteurs.slug = :slug_activite');
        }
        if ($secteur) {
            $qb->andWhere('secteur.slug = :slug_secteur');
        }
        if ($categorie) {
            $qb->andWhere('categorie.slug = :slug_cat');
        }

        $qb->groupBy('p.pays');

        if ($sousSecteur) {
            $qb->setParameter('slug_activite', $sousSecteur);
        }
        if ($secteur) {
            $qb->setParameter('slug_secteur', $secteur);
        }
        if ($categorie) {
            $qb->setParameter('slug_cat', $categorie);
        }

        $qb->select('pays.name,pays.slug,count(p.id) as count');

        $query = $qb->getQuery();

        $result = $query->getResult();


        return $this->json($result);
    }


    /**
     * @Route("/count_produit_categorie")
     */
    public function getCountProduitParCategorie(Request $request)
    {
        $secteur = $request->query->get('secteur', null);
        $sousSecteur = $request->query->get('sousSecteur', null);
        $pays = $request->query->get('pays', null);


        $em = $this->getDoctrine()->getManager()->getRepository(Produit::class);

        // Jointures
        $qb = $em->createQueryBuilder('p')
            ->join('p.secteur', 'secteur');

        if ($secteur) {
            $qb->join('p.sousSecteurs', 'sousSecteurs');
        }
        if ($sousSecteur) {
            $qb->join('p.categorie', 'categorie');
        }

        if ($pays) {
            $qb->join('p.pays', 'pays');
        }

        // Where condition
        $qb->where('p.del=0');
        $qb->andWhere('p.isValid=1');


        if ($sousSecteur) {
            $qb->andWhere('sousSecteurs.slug = :slug_activite');
        }
        if ($secteur) {
            $qb->andWhere('secteur.slug = :slug_secteur');
        }
        if ($pays) {
            $qb->andWhere('pays.slug = :slug_pays');
        }

        // Group by
        if ($sousSecteur) {
            $qb->groupBy('p.categorie');
        } else if ($secteur) {
            $qb->groupBy('p.sousSecteurs');
        } else {
            $qb->groupBy('p.secteur');
        }

        //set Parametres

        if ($sousSecteur) {
            $qb->setParameter('slug_activite', $sousSecteur);
        }
        if ($secteur) {
            $qb->setParameter('slug_secteur', $secteur);
        }
        if ($pays) {
            $qb->setParameter('slug_pays', $pays);
        }

        if ($sousSecteur) {
            $qb->select('categorie.name,categorie.slug,count(p.id) as count');
        } else if ($secteur) {
            $qb->select('sousSecteurs.name,sousSecteurs.slug,count(p.id) as count');
        } else {
            $qb->select('secteur.name,secteur.slug,count(p.id) as count');
        }

        $query = $qb->getQuery();

        $result = $query->getResult();


        return $this->json($result);
    }


    /**
     * @Route("/count_fournisseur_pays")
     */
    public function getCountFournisseurParPays(Request $request)
    {
        $secteur = $request->query->get('secteur', null);
        $sousSecteur = $request->query->get('sousSecteur', null);

        $result = null;

        $em = $this->getDoctrine()->getManager()->getRepository(Fournisseur::class);

        // Jointures
        $qb = $em->createQueryBuilder('p')
            ->join('p.pays', 'pays');

        if ($secteur) {
            $qb->join('p.sousSecteurs', 'sousSecteurs');
            $qb->join('sousSecteurs.secteur', 'secteur');
        }


        // Where condition
        $qb->where('p.del=0');
        $qb->andWhere('p.isactif=1');


        if ($sousSecteur) {
            $qb->andWhere('sousSecteurs.slug = :slug_activite');
        }
        if ($secteur) {
            $qb->andWhere('secteur.slug = :slug_secteur');
        }

        $qb->groupBy('p.pays');

        if ($sousSecteur) {
            $qb->setParameter('slug_activite', $sousSecteur);
        }
        if ($secteur) {
            $qb->setParameter('slug_secteur', $secteur);
        }


        $qb->select('pays.name,pays.slug,count(distinct p.id) as count');

        $query = $qb->getQuery();

        $result = $query->getResult();


        return $this->json($result);
        //  return $this->json($query->getSQL());
    }

    /**
     * @Route("/count_fournisseur_categorie")
     */
    public function getCountFournisseurParCategorie(Request $request)
    {
        $secteur = $request->query->get('secteur', null);
        $sousSecteur = $request->query->get('sousSecteur', null);
        $pays = $request->query->get('pays', null);


        $em = $this->getDoctrine()->getManager()->getRepository(Fournisseur::class);

        // Jointures
        $qb = $em->createQueryBuilder('p')
            ->join('p.sousSecteurs', 'sousSecteurs')
            ->join('sousSecteurs.secteur', 'secteur');

        if ($pays) {
            $qb->join('p.pays', 'pays');
        }

        // Where condition
        $qb->where('p.del=0');
        $qb->andWhere('p.isactif=1');



        if ($secteur) {
            $qb->andWhere('secteur.slug = :slug_secteur');
        }
        if ($pays) {
            $qb->andWhere('pays.slug = :slug_pays');
        }

        // Group by
        if($secteur) {
            $qb->groupBy('sousSecteurs');
        } else {
            $qb->groupBy('secteur');
        }

        //set Parametres


        if ($secteur) {
            $qb->setParameter('slug_secteur', $secteur);
        }
        if ($pays) {
            $qb->setParameter('slug_pays', $pays);
        }

        if ($secteur) {
            $qb->select('sousSecteurs.name,sousSecteurs.slug,count(distinct p.id) as count');
        } else {
            $qb->select('secteur.name,secteur.slug,count(distinct p.id) as count');
        }

        $query = $qb->getQuery();

        $result = $query->getResult();


        return $this->json($result);
    }


}