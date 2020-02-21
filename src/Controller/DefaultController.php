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
     * @Route("/count_produit_secteurs")
     */
    public function getCountProduitParSecteur()
    {

        $result = null;

        $em = $this->getDoctrine()->getManager()->getRepository(Produit::class);

        // Jointures
        $qb = $em->createQueryBuilder('p')
            ->join('p.secteur', 'secteur');


        // Where condition
        $qb->where('p.del=0');
        $qb->andWhere('p.isValid=1');

        $qb->groupBy('p.secteur');


        $qb->select('secteur.name,secteur.slug,count(p.id) as count');

        $query = $qb->getQuery();

        $result = $query->getResult();


        return $this->json($result);
    }

    /**
     * @Route("/count_produit_pays")
     */
    public function getCountProduitParPays()
    {

        $result = null;

        $em = $this->getDoctrine()->getManager()->getRepository(Produit::class);

        // Jointures
        $qb = $em->createQueryBuilder('p')
            ->join('p.pays', 'pays');


        // Where condition
        $qb->where('p.del=0');
        $qb->andWhere('p.isValid=1');
        $qb->groupBy('p.pays');


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
        $categorie = $request->query->get('categorie', null);
        $pays = $request->query->get('pays', null);

        $resultSousSecteur = null;
        $result = null;

        $em = $this->getDoctrine()->getManager()->getRepository(Produit::class);

        // Jointures
        $qb = $em->createQueryBuilder('p')
            ->join('p.secteur', 'secteur');

        if ($sousSecteur) {
            $qb->join('p.sousSecteurs', 'sousSecteurs');
        }
        if ($categorie) {
            $qb->join('p.categorie', 'categorie');
        }
        if ($pays) {
            $qb->join('p.pays', 'pays');
        }

        // Where condition
        $qb->where('p.del=0');
        $qb->andWhere('p.isValid=1');

        if ($categorie) {
            $qb->andWhere('categorie.slug = :slug_cat');
        }
        if ($sousSecteur) {
            $qb->andWhere('sousSecteurs.slug = :slug_activite');
        }
        if ($secteur) {
            $qb->andWhere('secteur.slug = :slug_secteur');
            if (!$sousSecteur) {
                $qb2 = $em->createQueryBuilder('p')
                    ->join('p.secteur', 'secteur')
                    ->join('p.sousSecteurs', 'sousSecteurs');
                if ($pays) {
                    $qb2->join('p.pays', 'pays');
                }

                $qb2->where('p.del=0')
                    ->andWhere('p.isValid=1');

                if ($pays) {
                    $qb2->andWhere('pays.slug=:p_slug')
                        ->setParameter('p_slug', $pays);
                }
                $qb2->andWhere('secteur.slug=:s_slug')
                    ->setParameter('s_slug', $secteur)
                    ->groupBy('p.sousSecteurs')
                    ->select('sousSecteurs.name,sousSecteurs.slug,count(p.id)');
                $query2 = $qb2->getQuery();
                $resultSousSecteur = $query2->getResult();
            }
        }
        if ($pays) {
            $qb->andWhere('pays.slug = :slug_pays');
        }

        // Group by
        if ($categorie) {
            $qb->groupBy('p.categorie');
        } else if ($sousSecteur) {
            $qb->groupBy('p.sousSecteurs');
        } else {
            $qb->groupBy('p.secteur');
        }

        //set Parametres
        if ($categorie) {
            $qb->setParameter('slug_cat', $categorie);
        }
        if ($sousSecteur) {
            $qb->setParameter('slug_activite', $sousSecteur);
        }
        if ($secteur) {
            $qb->setParameter('slug_secteur', $secteur);
        }
        if ($pays) {
            $qb->setParameter('slug_pays', $pays);
        }

        if ($categorie) {
            $qb->select('categorie.name,categorie.slug,count(p.id)');
        } else if ($sousSecteur) {
            $qb->select('sousSecteurs.name,sousSecteurs.slug,count(p.id)');
        } else {
            $qb->select('secteur.name,secteur.slug,count(p.id) as count');
        }

        $query = $qb->getQuery();

        $result = $query->getResult();
        if ($result) {
            if ($resultSousSecteur) {
                $result['sousSecteurs'] = $resultSousSecteur;
            }
        }


        return $this->json($result);
    }

}