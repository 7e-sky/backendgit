<?php
/**
 * Created by PhpStorm.
 * User: youne
 * Date: 22/07/2019
 * Time: 12:27
 */

namespace App\Controller;


use App\Entity\Acheteur;
use App\Entity\Attachement;
use App\Entity\Categorie;
use App\Entity\DemandeAchat;
use App\Entity\Fiche;
use App\Entity\Fournisseur;
use App\Entity\Produit;
use App\Entity\Secteur;
use App\Entity\SousSecteur;
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
        return $this->json('');
    }

    /**
     * @Route("/confrim-user/{token}", name="default_confirm_token")
     */
    /* public function confirm(string $token)
     {

         $this->confirmationService->confirmUser($token);

         return $this->redirectToRoute('defaultIndex');
     }
 */
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

            $parent = '';
            if($user instanceof Fournisseur ){
                $parent = $user->getParent() ?$user->getParent()->getId() : '';
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
                    'parent'=>$parent,

                ]
            ];
        } else {
            $dataa = null;
        }


        return new JsonResponse($dataa);

    }

    /**
     * @Route("/api/categories_navigations")
     */
    public function getNavigationCategorie()
    {
        $em_secteur = $this->getDoctrine()->getManager()->getRepository(Secteur::class);
        $em_sous_secteur = $this->getDoctrine()->getManager()->getRepository(SousSecteur::class);
        $em_categorie = $this->getDoctrine()->getManager()->getRepository(Categorie::class);

        $qb = $em_secteur->createQueryBuilder('s')
            ->leftJoin('s.produits', 'p')
            ->where('s.del=0')
            ->andWhere('p.del=0 or p.del IS NULL')
            ->groupBy('s.id')
            ->orderBy('count', 'desc')
            ->addOrderBy('s.name', 'asc')
            ->setMaxResults(12)
            ->select('s.id,s.name,s.slug,count(p.id) as count');
        $query = $qb->getQuery();
        $secteurs = $query->getResult();
        $response = [];
        if ($secteurs) {
            foreach ($secteurs as $secteur) {
                $qb = $em_sous_secteur->createQueryBuilder('ss')
                    ->leftJoin('ss.produits', 'p')
                    ->where('ss.del=0')
                    ->andWhere('p.del=0 or p.del IS NULL')
                    ->andWhere('ss.secteur = :secteur')
                    ->groupBy('ss.id')
                    ->orderBy('count', 'desc')
                    ->setMaxResults(4)
                    ->setParameter('secteur', $secteur['id'])
                    ->select('ss.id,ss.name,ss.slug,count(p.id) as count');
                $query = $qb->getQuery();
                $sous_secteurs = $query->getResult();
                if ($sous_secteurs) {
                    $array = [];
                    foreach ($sous_secteurs as $sous_secteur) {
                        $qb = $em_categorie->createQueryBuilder('c')
                            ->join('c.sousSecteurs', 's')
                            ->leftJoin('c.produits', 'p')
                            ->where('c.del=0')
                            ->andWhere('s.id in (:sousSecteur)')
                            ->andWhere('p.del=0 or p.del IS NULL')
                            ->groupBy('c.id')
                            ->orderBy('count', 'desc')
                            ->setMaxResults(4)
                            ->setParameter('sousSecteur', $sous_secteur['id'])
                            ->select('c.id,c.name,c.slug,count(p.id) as count');
                        $query = $qb->getQuery();
                        $categories = $query->getResult();
                        if ($categories) {
                            $sous_secteur['categories'] = $categories;
                        }
                        array_push($array, $sous_secteur);
                    }
                    $secteur['sousSecteurs'] = $array;
                }
                array_push($response, $secteur);
            }
        }
        return $this->json($response);

    }

    /**
     * @Route("/api/focus_categories_mobile")
     */
    public function getFocusCategorieMobile()
    {
        $em_secteur = $this->getDoctrine()->getManager()->getRepository(Secteur::class);

        $qb = $em_secteur->createQueryBuilder('s')
            ->join('s.image', 'i')
            ->leftJoin('s.produits', 'p')
            ->where('s.del=0')
            ->andWhere('p.del=0 or p.del IS NULL')
            ->groupBy('s.id')
            ->orderBy('count', 'desc')
            ->addOrderBy('s.name', 'asc')
            ->setMaxResults(10)
            ->select('s.id,s.name,i.url,count(p.id) as count,s.slug');
        $query = $qb->getQuery();
        $secteurs = $query->getResult();
        return $this->json($secteurs);

    }


    /**
     * @Route("/api/parcourir_secteurs")
     */
    public function getSecteurs()
    {
        $em_secteur = $this->getDoctrine()->getManager()->getRepository(Secteur::class);
        $em_sous_secteur = $this->getDoctrine()->getManager()->getRepository(SousSecteur::class);

        $qb = $em_secteur->createQueryBuilder('s')
            ->leftJoin('s.image', 'image')
            ->where('s.del=0')
            ->orderBy('s.name', 'asc')
            ->select('s.id,s.name,s.slug,image.url');
        $query = $qb->getQuery();
        $secteurs = $query->getResult();
        $response = [];
        if ($secteurs) {
            foreach ($secteurs as $secteur) {
                $qb = $em_sous_secteur->createQueryBuilder('ss')
                    ->join('ss.secteur', 's')
                    ->leftJoin('ss.produits', 'p')
                    ->where('ss.del=0')
                    ->andWhere('s.id in (:secteur)')
                    ->andWhere('p.del=0 or p.del IS NULL')
                    ->groupBy('ss.id')
                    ->orderBy('ss.name', 'asc')
                    ->setMaxResults(4)
                    ->setParameter('secteur', $secteur['id'])
                    ->select('ss.id,ss.name,ss.slug,count(p.id) as count');
                $query = $qb->getQuery();
                $sous_secteurs = $query->getResult();
                $secteur['sousSecteurs'] = $sous_secteurs;
                array_push($response, $secteur);
            }
        }
        return $this->json($response);

    }

    /**
     * @Route("/api/parcourir_activites/{id}")
     */
    public function getActivites(Secteur $secteur)
    {
        $em_sous_secteur = $this->getDoctrine()->getManager()->getRepository(SousSecteur::class);
        $response = [];
        if ($secteur) {
            $qb = $em_sous_secteur->createQueryBuilder('ss')
                ->join('ss.secteur', 's')
                ->leftJoin('ss.produits', 'p')
                ->where('ss.del=0')
                ->andWhere('ss.secteur = :secteur')
                ->andWhere('p.del=0 or p.del IS NULL')
                ->groupBy('ss.id')
                ->orderBy('ss.name', 'asc')
                ->setParameter('secteur', $secteur)
                ->select('ss.id,ss.name,ss.slug,count(p.id) as count');
            $query = $qb->getQuery();
            $sous_secteurs = $query->getResult();
            $response = $sous_secteurs;
        }
        return $this->json($response);

    }

    /**
     * @Route("/api/parcourir_categories/{id}")
     */
    public function getCategories(SousSecteur $sousSecteur)
    {
        $em_categorie = $this->getDoctrine()->getManager()->getRepository(Categorie::class);
        $response = [];
        if ($sousSecteur) {
            $qb = $em_categorie->createQueryBuilder('c')
                ->join('c.sousSecteurs', 's')
                ->leftJoin('c.produits', 'p')
                ->where('c.del=0')
                ->andWhere('s.id in (:sousSecteur)')
                ->andWhere('p.del=0 or p.del IS NULL')
                ->groupBy('c.id')
                ->orderBy('c.name', 'asc')
                ->setMaxResults(4)
                ->setParameter('sousSecteur', $sousSecteur->getId())
                ->select('c.id,c.name,c.slug,count(p.id) as count');
            $query = $qb->getQuery();
            $categories = $query->getResult();
            $response = $categories;
        }
        return $this->json($response);

    }


    /**
     * @Route("/api/searchResult")
     */
    public function getSearchResult(Request $request)
    {
        $searchText = $request->query->get('searchText', null);

        $em_produit = $this->getDoctrine()->getManager()->getRepository(Produit::class);
        $em_fournisseur = $this->getDoctrine()->getManager()->getRepository(Fournisseur::class);
        $em_sous_secteur = $this->getDoctrine()->getManager()->getRepository(SousSecteur::class);
        $response = [];
        if (!$searchText || !trim($searchText)) {
            return $this->json($response);
        }
        $searchText = mb_strtolower($searchText);

        $qb = $em_fournisseur->createQueryBuilder('f')
            ->where('f.del=0')
            ->andWhere('f.isactif=1')
            ->andWhere('f.isComplet=1')
            ->andWhere('f.parent is null')
            ->andWhere('f.societeLower LIKE CONCAT(\'%%\',:societe,\'%%\')')
            ->orderBy('f.visite', 'desc')
            ->setParameter('societe', $searchText)
            ->setMaxResults(5)
            ->select('f.id,f.slug,f.societe');
        $query = $qb->getQuery();
        $fournisseurs = $query->getResult();

        if ($fournisseurs) {
            $array['title'] = 'Fournisseurs';
            array_push($fournisseurs, ['autreFrs'=>'Afficher tout','value'=>$searchText]);

            $array['suggestions'] = $fournisseurs;
            array_push($response, $array);
        }


        //AMELLIORATION
        /*SELECT id,titre_lower,description,MATCH(titre_lower,description) AGAINST('shuttle rayonnage lourd' IN BOOLEAN MODE) as score
            FROM produit
            WHERE MATCH(titre_lower,description) AGAINST('shuttle rayonnage' IN BOOLEAN MODE)*/

        $qb = $em_produit->createQueryBuilder('p')
            ->join('p.secteur', 'secteur')
            ->join('p.sousSecteurs', 'sousSecteur')
            ->join('p.categorie', 'categorie')
            ->where('p.del=0')
            ->andWhere('p.isValid=1')
            ->andWhere('p.titreLower LIKE CONCAT(:titre, \'%%\')')
            ->setParameter('titre', $searchText)
            ->setMaxResults(5)
            ->select('p.id,p.titre,secteur.slug as sec,sousSecteur.slug as soussec,categorie.slug as cat,p.slug');
        $query = $qb->getQuery();
        $produits = $query->getResult();

        if ($produits) {
            $arrayp['title'] = 'Produits / Services';
            array_push($produits, ['autreProduits'=>'Afficher tout','value'=>$searchText]);

            $arrayp['suggestions'] = $produits;
            array_push($response, $arrayp);
        }

        $qb = $em_sous_secteur->createQueryBuilder('s')
            ->join('s.secteur', 'secteur')
            ->where('s.del=0')
            ->andWhere('s.nameLower LIKE CONCAT(\'%%\',:name, \'%%\')')
            ->orderBy('s.name', 'asc')
            ->setParameter('name', $searchText)
            ->setMaxResults(5)
            ->select('s.name,secteur.slug as sect,s.slug');
        $query = $qb->getQuery();
        $activites = $query->getResult();

        if ($activites) {
            $arrays['title'] = 'Activités';
            $arrays['suggestions'] = $activites;
            array_push($response, $arrays);
        }

        return $this->json($response);

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
     * @Route("/attachements/{id}", name="attachements")
     */
    public function attachements(Attachement $fiche)
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
     *=================================================
     *=================================================
     *    RECHERCHER PRODUITS
     *=================================================
     *=================================================
     **/
    /**
     * @Route("/count_produit_pays")
     */
    public function getCountProduitParPays(Request $request)
    {
        $secteur = $request->query->get('secteur', null);
        $sousSecteur = $request->query->get('sousSecteur', null);
        $categorie = $request->query->get('categorie', null);
        $pays = $request->query->get('pays', null);
        $q = $request->query->get('q', null);

        if (!$q || !trim($q)) {
            $q = null;
        } else {
            $q = mb_strtolower($q);
        }

        $result = null;

        $em = $this->getDoctrine()->getManager()->getRepository(Produit::class);

        // Jointures
        $qb = $em->createQueryBuilder('p')
            ->join('p.pays', 'pays');

        if ($pays) {
            $qb->join('p.ville', 'ville');
        }
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

        if ($q) {
            $qb->andWhere('p.titreLower LIKE CONCAT(\'%%\',:q, \'%%\')');
        }
        if ($pays) {
            $qb->andWhere('pays.slug = :slug_pays');
        }
        if ($sousSecteur) {
            $qb->andWhere('sousSecteurs.slug = :slug_activite');
        }
        if ($secteur) {
            $qb->andWhere('secteur.slug = :slug_secteur');
        }
        if ($categorie) {
            $qb->andWhere('categorie.slug = :slug_cat');
        }

        if ($pays) {
            $qb->groupBy('ville');
        } else {
            $qb->groupBy('pays');
        }

        if ($q) {
            $qb->setParameter('q', $q);
        }
        if ($pays) {
            $qb->setParameter('slug_pays', $pays);
        }
        if ($sousSecteur) {
            $qb->setParameter('slug_activite', $sousSecteur);
        }
        if ($secteur) {
            $qb->setParameter('slug_secteur', $secteur);
        }
        if ($categorie) {
            $qb->setParameter('slug_cat', $categorie);
        }

        if ($pays) {
            $qb->select('ville.name,ville.slug,count(distinct p.id) as count');

        } else {
            $qb->select('pays.name,pays.slug,count(distinct p.id) as count');
        }

        $qb->orderBy('count', 'desc');

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
        $ville = $request->query->get('ville', null);
        $q = $request->query->get('q', null);
        if (!$q || !trim($q)) {
            $q = null;
        } else {
            $q = mb_strtolower($q);
        }
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
        if ($ville) {
            $qb->join('p.ville', 'ville');
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
        if ($ville) {
            $qb->andWhere('ville.slug = :slug_ville');
        }
        if ($q) {
            $qb->andWhere('p.titreLower LIKE CONCAT( \'%%\',:q, \'%%\')');
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
        if ($ville) {
            $qb->setParameter('slug_ville', $ville);
        }
        if ($q) {
            $qb->setParameter('q', $q);
        }


        if ($sousSecteur) {
            $qb->select('categorie.name,categorie.slug,count(distinct p.id) as count');
        } else if ($secteur) {
            $qb->select('sousSecteurs.name,sousSecteurs.slug,count(distinct p.id) as count');
        } else {
            $qb->select('secteur.name,secteur.slug,count(distinct p.id) as count');
        }
        $qb->orderBy('count', 'desc');

        $query = $qb->getQuery();

        $result = $query->getResult();


        return $this->json($result);
    }
    /**
     *=================================================
     *    FIN RECHERCHER PRODUITS
     *=================================================
     **/

    /**
     *=================================================
     *=================================================
     *    RECHERCHER FOURNISSEURS
     *=================================================
     *=================================================
     **/
    /**
     * @Route("/count_fournisseur_pays")
     */
    public function getCountFournisseurParPays(Request $request)
    {
        $secteur = $request->query->get('secteur', null);
        $sousSecteur = $request->query->get('sousSecteur', null);
        $categorie = $request->query->get('categorie', null);
        $pays = $request->query->get('pays', null);
        $q = $request->query->get('q', null);

        if (!$q || !trim($q)) {
            $q = null;
        } else {
            $q = mb_strtolower($q);
        }

        $result = null;

        $em = $this->getDoctrine()->getManager()->getRepository(Fournisseur::class);

        // Jointures
        $qb = $em->createQueryBuilder('p')
            ->join('p.pays', 'pays');

        if ($pays) {
            $qb->join('p.ville', 'ville');
        }
        if ($secteur) {
            $qb->join('p.categories', 'categories');
            $qb->join('categories.sousSecteurs', 'sousSecteurs');
            $qb->join('sousSecteurs.secteur', 'secteur');
        }


        // Where condition
        $qb->where('p.del=0');
        $qb->andWhere('p.isactif=1');
        $qb->andWhere('p.isComplet=1');


        if ($q) {
            $qb->andWhere('p.societeLower LIKE CONCAT(\'%%\',:q, \'%%\')');
        }
        if ($pays) {
            $qb->andWhere('pays.slug = :slug_pays');
        }
        if ($categorie) {
            $qb->andWhere('categories.slug = :slug_categories');
        }
        if ($sousSecteur) {
            $qb->andWhere('sousSecteurs.slug = :slug_activite');
        }
        if ($secteur) {
            $qb->andWhere('secteur.slug = :slug_secteur');
        }

        if ($pays) {
            $qb->groupBy('ville');
        } else {
            $qb->groupBy('pays');
        }

        if ($q) {
            $qb->setParameter('q', $q);
        }
        if ($pays) {
            $qb->setParameter('slug_pays', $pays);
        }
        if ($categorie) {
            $qb->setParameter('slug_categories', $categorie);
        }
        if ($sousSecteur) {
            $qb->setParameter('slug_activite', $sousSecteur);
        }
        if ($secteur) {
            $qb->setParameter('slug_secteur', $secteur);
        }


        if ($pays) {
            $qb->select('ville.name,ville.slug,count(distinct p.id) as count');

        } else {
            $qb->select('pays.name,pays.slug,count(distinct p.id) as count');
        }
        $qb->orderBy('count', 'desc');

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
        $ville = $request->query->get('ville', null);
        $q = $request->query->get('q', null);

        if (!$q || !trim($q)) {
            $q = null;
        } else {
            $q = mb_strtolower($q);
        }

        $em = $this->getDoctrine()->getManager()->getRepository(Fournisseur::class);

        // Jointures
        $qb = $em->createQueryBuilder('p')
            ->join('p.categories', 'categories')
            ->join('categories.sousSecteurs', 'sousSecteurs')
            ->join('sousSecteurs.secteur', 'secteur');

        if ($pays) {
            $qb->join('p.pays', 'pays');
        }
        if ($ville) {
            $qb->join('p.ville', 'ville');
        }
        // Where condition
        $qb->where('p.del=0');
        $qb->andWhere('p.isactif=1');
        $qb->andWhere('p.isComplet=1');


        if ($sousSecteur) {
            $qb->andWhere('sousSecteurs.slug = :slug_activite');
        }
        if ($secteur) {
            $qb->andWhere('secteur.slug = :slug_secteur');
        }
        if ($pays) {
            $qb->andWhere('pays.slug = :slug_pays');
        }
        if ($ville) {
            $qb->andWhere('ville.slug = :slug_ville');
        }
        if ($q) {
            $qb->andWhere('p.societeLower LIKE CONCAT( \'%%\',:q, \'%%\')');
        }

        // Group by
        if ($sousSecteur) {
            $qb->groupBy('categories');
        } else if ($secteur) {
            $qb->groupBy('sousSecteurs');
        } else {
            $qb->groupBy('secteur');
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
        if ($ville) {
            $qb->setParameter('slug_ville', $ville);
        }
        if ($q) {
            $qb->setParameter('q', $q);
        }

        if ($sousSecteur) {
            $qb->select('categories.name,categories.slug,count(distinct p.id) as count');
        } else if ($secteur) {
            $qb->select('sousSecteurs.name,sousSecteurs.slug,count(distinct p.id) as count');
        } else {
            $qb->select('secteur.name,secteur.slug,count(distinct p.id) as count');
        }

        $qb->orderBy('count', 'desc');

        $query = $qb->getQuery();

        $result = $query->getResult();


        return $this->json($result);
    }
    /**
     *=================================================
     *    FIN RECHERCHER FOURNISSEURS
     *=================================================
     **/


    /**
     *=================================================
     *=================================================
     *    RECHERCHER DEMANDES ACHATS
     *=================================================
     *=================================================
     **/
    /**
     * @Route("/count_demandes_achats_pays")
     */
    public function getCountDemandesAchatsParPays(Request $request)
    {
        $secteur = $request->query->get('secteur', null);
        $sousSecteur = $request->query->get('sousSecteur', null);
        $categorie = $request->query->get('categorie', null);
        $pays = $request->query->get('pays', null);

        $result = null;

        $em = $this->getDoctrine()->getManager()->getRepository(DemandeAchat::class);

        // Jointures
        $qb = $em->createQueryBuilder('p')
            ->join('p.acheteur', 'acheteur')
            ->join('acheteur.pays', 'pays');

        if ($pays) {
            $qb->join('acheteur.ville', 'ville');
        }
        if ($secteur) {
            $qb->join('p.categories', 'categories');
            $qb->join('categories.sousSecteurs', 'sousSecteurs');
            $qb->join('sousSecteurs.secteur', 'secteur');
        }


        // Where condition
        $qb->where('p.del=0');
        $qb->andWhere('p.isPublic=1');

        if ($pays) {
            $qb->andWhere('pays.slug = :slug_pays');
        }
        if ($categorie) {
            $qb->andWhere('categories.slug = :slug_categories');
        }
        if ($sousSecteur) {
            $qb->andWhere('sousSecteurs.slug = :slug_activite');
        }
        if ($secteur) {
            $qb->andWhere('secteur.slug = :slug_secteur');
        }


        if ($pays) {
            $qb->groupBy('ville');
        } else {
            $qb->groupBy('pays');
        }

        if ($pays) {
            $qb->setParameter('slug_pays', $pays);
        }
        if ($categorie) {
            $qb->setParameter('slug_categories', $categorie);
        }
        if ($sousSecteur) {
            $qb->setParameter('slug_activite', $sousSecteur);
        }
        if ($secteur) {
            $qb->setParameter('slug_secteur', $secteur);
        }

        if ($pays) {
            $qb->select('ville.name,ville.slug,count(distinct p.id) as count');

        } else {
            $qb->select('pays.name,pays.slug,count(distinct p.id) as count');
        }
        $qb->orderBy('count', 'desc');

        $query = $qb->getQuery();

        $result = $query->getResult();


        return $this->json($result);
        //  return $this->json($query->getSQL());
    }

    /**
     * @Route("/count_demandes_achats_categorie")
     */
    public function getCountDemandesAchatsParCategorie(Request $request)
    {
        $secteur = $request->query->get('secteur', null);
        $sousSecteur = $request->query->get('sousSecteur', null);
        $pays = $request->query->get('pays', null);
        $ville = $request->query->get('ville', null);


        $em = $this->getDoctrine()->getManager()->getRepository(DemandeAchat::class);

        // Jointures
        $qb = $em->createQueryBuilder('p')
            ->join('p.categories', 'categories')
            ->join('categories.sousSecteurs', 'sousSecteurs')
            ->join('sousSecteurs.secteur', 'secteur');

        if ($pays) {
            $qb->join('p.acheteur', 'acheteur')
                ->join('acheteur.pays', 'pays');
            if ($ville) {
                $qb->join('acheteur.ville', 'ville');
            }
        }


        // Where condition
        $qb->where('p.del=0');
        $qb->andWhere('p.isPublic=1');

        if ($sousSecteur) {
            $qb->andWhere('sousSecteurs.slug = :slug_activite');
        }
        if ($secteur) {
            $qb->andWhere('secteur.slug = :slug_secteur');
        }
        if ($pays) {
            $qb->andWhere('pays.slug = :slug_pays');
            if ($ville) {
                $qb->andWhere('ville.slug = :slug_ville');
            }
        }

        // Group by
        if ($sousSecteur) {
            $qb->groupBy('categories');
        } else if ($secteur) {
            $qb->groupBy('sousSecteurs');
        } else {
            $qb->groupBy('secteur');
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
            if ($ville) {
                $qb->setParameter('slug_ville', $ville);
            }
        }

        if ($sousSecteur) {
            $qb->select('categories.name,categories.slug,count(distinct p.id) as count');
        } else if ($secteur) {
            $qb->select('sousSecteurs.name,sousSecteurs.slug,count(distinct p.id) as count');
        } else {
            $qb->select('secteur.name,secteur.slug,count(distinct p.id) as count');
        }

        $qb->orderBy('count', 'desc');

        $query = $qb->getQuery();

        $result = $query->getResult();


        return $this->json($result);
    }
    /**
     *=================================================
     *    FIN RECHERCHER DEMANDES ACHATS
     *=================================================
     **/


    /**
     * @Route("/custom/update_fournisseur/{id}")
     */
    public function UpdatePhoneVu(Fournisseur $fournisseur)
    {
        // Generate response
        $response = new JsonResponse();
        if (!$fournisseur) {
            return $response->setStatusCode(404);
        }
        $fournisseur->setPhoneVu($fournisseur->getPhoneVu() + 1);
        $this->getDoctrine()->getManager()->flush();
        // Set headers
        $response->headers->set('Cache-Control', 'private');
        $response->setContent($fournisseur->getFix() ? $fournisseur->getFix() : $fournisseur->getPhone());
        return $response;

    }


}