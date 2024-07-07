<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240623235113 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('DROP TABLE directeurachat');
        $this->addSql('ALTER TABLE abonnement CHANGE offre_id offre_id INT DEFAULT NULL, CHANGE demande_id demande_id INT DEFAULT NULL, CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE zone_id zone_id INT DEFAULT NULL, CHANGE commercial_id commercial_id INT DEFAULT NULL, CHANGE mode_id mode_id INT DEFAULT NULL, CHANGE duree_id duree_id INT DEFAULT NULL, CHANGE currency_id currency_id INT DEFAULT NULL, CHANGE expired expired DATETIME DEFAULT NULL, CHANGE date_peiment date_peiment DATETIME DEFAULT NULL, CHANGE commentaire commentaire VARCHAR(1000) DEFAULT NULL');
        $this->addSql('ALTER TABLE acheteur CHANGE pays_id pays_id INT DEFAULT NULL, CHANGE ville_id ville_id INT DEFAULT NULL, CHANGE secteur_id secteur_id INT DEFAULT NULL, CHANGE currency_id currency_id INT DEFAULT NULL, CHANGE role role VARCHAR(50) NOT NULL, CHANGE civilite civilite VARCHAR(5) NOT NULL, CHANGE ice ice VARCHAR(15) DEFAULT NULL, CHANGE fix fix VARCHAR(30) DEFAULT NULL, CHANGE website website VARCHAR(30) DEFAULT NULL, CHANGE code_client code_client VARCHAR(30) DEFAULT NULL, CHANGE autre_ville autre_ville VARCHAR(50) DEFAULT NULL, CHANGE autre_currency autre_currency VARCHAR(10) DEFAULT NULL');
        $this->addSql('ALTER TABLE acheteur_provisoire CHANGE acheteur_parent_id acheteur_parent_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE actualite CHANGE image_id image_id INT DEFAULT NULL, CHANGE keywords keywords VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE actualite_image CHANGE url url VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE attachement CHANGE url url VARCHAR(255) DEFAULT NULL, CHANGE type type VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE avatar CHANGE url url VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE black_listes DROP team_id, CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE acheteur_id acheteur_id INT DEFAULT NULL, CHANGE deblacklister deblacklister DATETIME DEFAULT NULL, CHANGE ice ice VARCHAR(255) DEFAULT NULL, CHANGE siret siret VARCHAR(255) DEFAULT NULL, CHANGE fournisseurEx fournisseurEx VARCHAR(255) DEFAULT NULL, CHANGE email email VARCHAR(255) DEFAULT NULL, CHANGE pays pays VARCHAR(255) DEFAULT NULL, CHANGE ville ville VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE contact_fournisseur CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE date_validation date_validation DATETIME DEFAULT NULL, CHANGE date_read date_read DATETIME DEFAULT NULL');
        $this->addSql('ALTER TABLE demande_abonnement CHANGE offre_id offre_id INT DEFAULT NULL, CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE zone_id zone_id INT DEFAULT NULL, CHANGE commercial_id commercial_id INT DEFAULT NULL, CHANGE mode_id mode_id INT DEFAULT NULL, CHANGE duree_id duree_id INT DEFAULT NULL, CHANGE suggestions suggestions LONGTEXT DEFAULT NULL COMMENT \'(DC2Type:array)\'');
        $this->addSql('ALTER TABLE demande_achat CHANGE acheteur_id acheteur_id INT DEFAULT NULL, CHANGE motif_rejet_id motif_rejet_id INT DEFAULT NULL, CHANGE currency_id currency_id INT DEFAULT NULL, CHANGE fournisseur_gagne_id fournisseur_gagne_id INT DEFAULT NULL, CHANGE team_id team_id INT NOT NULL, CHANGE reference reference VARCHAR(50) DEFAULT NULL, CHANGE nbr_visite nbr_visite INT DEFAULT NULL, CHANGE nbr_share nbr_share INT DEFAULT NULL, CHANGE pays pays VARCHAR(255) DEFAULT NULL, CHANGE ville ville VARCHAR(255) DEFAULT NULL, CHANGE autre_categories autre_categories VARCHAR(250) DEFAULT NULL');
        $this->addSql('ALTER TABLE demande_achat ADD CONSTRAINT FK_D077077F296CD8AE FOREIGN KEY (team_id) REFERENCES team (id)');
        $this->addSql('CREATE INDEX IDX_D077077F296CD8AE ON demande_achat (team_id)');
        $this->addSql('ALTER TABLE demande_devis CHANGE produit_id produit_id INT DEFAULT NULL, CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE societe societe VARCHAR(50) DEFAULT NULL, CHANGE date_validation date_validation DATETIME DEFAULT NULL, CHANGE quantity quantity SMALLINT DEFAULT NULL, CHANGE date_read date_read DATETIME DEFAULT NULL');
        $this->addSql('ALTER TABLE demande_jeton CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE detail_visite CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE demande_id demande_id INT DEFAULT NULL, CHANGE personnel_id personnel_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE diffusion_demande CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE demande_id demande_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE ext_log_entries CHANGE object_id object_id VARCHAR(64) DEFAULT NULL, CHANGE data data LONGTEXT DEFAULT NULL COMMENT \'(DC2Type:array)\', CHANGE username username VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE faq CHANGE categorie_id categorie_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE fiche CHANGE url url VARCHAR(255) DEFAULT NULL, CHANGE type type VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE fournisseur CHANGE pays_id pays_id INT DEFAULT NULL, CHANGE ville_id ville_id INT DEFAULT NULL, CHANGE currency_id currency_id INT DEFAULT NULL, CHANGE parent parent INT DEFAULT NULL, CHANGE ice ice VARCHAR(15) DEFAULT NULL, CHANGE fix fix VARCHAR(30) DEFAULT NULL, CHANGE website website VARCHAR(30) DEFAULT NULL, CHANGE societe_lower societe_lower VARCHAR(255) DEFAULT NULL, CHANGE code_client code_client VARCHAR(30) DEFAULT NULL, CHANGE autre_ville autre_ville VARCHAR(50) DEFAULT NULL, CHANGE autre_categories autre_categories VARCHAR(250) DEFAULT NULL, CHANGE autre_currency autre_currency VARCHAR(10) DEFAULT NULL');
        $this->addSql('ALTER TABLE fournisseur_provisoire CHANGE fournisseur_parent_id fournisseur_parent_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE historique_visite CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE demande_id demande_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE image_produit CHANGE url url VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE image_secteur CHANGE url url VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE jeton CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE paiement_id paiement_id INT DEFAULT NULL, CHANGE demande_id demande_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE mediateur CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE acheteur_id acheteur_id INT DEFAULT NULL, CHANGE deblacklister deblacklister DATETIME DEFAULT NULL');
        $this->addSql('ALTER TABLE personnel CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE avatar_id avatar_id INT DEFAULT NULL, CHANGE agence agence VARCHAR(20) DEFAULT NULL, CHANGE ville ville VARCHAR(20) DEFAULT NULL');
        $this->addSql('ALTER TABLE produit CHANGE secteur_id secteur_id INT DEFAULT NULL, CHANGE sous_secteurs_id sous_secteurs_id INT DEFAULT NULL, CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE fiche_technique_id fiche_technique_id INT DEFAULT NULL, CHANGE categorie_id categorie_id INT DEFAULT NULL, CHANGE featured_image_id_id featured_image_id_id INT DEFAULT NULL, CHANGE currency_id currency_id INT DEFAULT NULL, CHANGE pays_id pays_id INT DEFAULT NULL, CHANGE ville_id ville_id INT DEFAULT NULL, CHANGE videos videos VARCHAR(255) DEFAULT NULL, CHANGE date_validation date_validation DATETIME DEFAULT NULL, CHANGE titre_lower titre_lower VARCHAR(100) DEFAULT NULL, CHANGE autre_secteur autre_secteur VARCHAR(80) DEFAULT NULL, CHANGE autre_activite autre_activite VARCHAR(80) DEFAULT NULL, CHANGE autre_produit autre_produit VARCHAR(80) DEFAULT NULL');
        $this->addSql('ALTER TABLE secteur CHANGE image_id image_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE select_produit CHANGE produit_id produit_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE sous_secteur CHANGE secteur_id secteur_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE suggestion_secteur CHANGE user_id user_id INT DEFAULT NULL, CHANGE categorie categorie VARCHAR(100) DEFAULT NULL');
        $this->addSql('ALTER TABLE team DROP name, CHANGE acheteur_id acheteur_id INT DEFAULT NULL, CHANGE avatar_id avatar_id INT DEFAULT NULL, CHANGE first_name first_name VARCHAR(255) DEFAULT NULL, CHANGE last_name last_name VARCHAR(255) DEFAULT NULL, CHANGE zz zz VARCHAR(255) DEFAULT NULL, CHANGE phone phone VARCHAR(20) NOT NULL, CHANGE del del TINYINT(1) NOT NULL, CHANGE fullName fullName VARCHAR(150) NOT NULL, CHANGE agence agence VARCHAR(20) DEFAULT NULL, CHANGE ville ville VARCHAR(20) DEFAULT NULL');
        $this->addSql('ALTER TABLE user CHANGE parent1 parent1 INT DEFAULT NULL, CHANGE avatar_id avatar_id INT DEFAULT NULL, CHANGE adresse1 adresse1 VARCHAR(255) DEFAULT NULL, CHANGE adresse2 adresse2 VARCHAR(255) DEFAULT NULL, CHANGE codepostal codepostal INT DEFAULT NULL, CHANGE password_change_date password_change_date INT DEFAULT NULL, CHANGE confirmation_token confirmation_token VARCHAR(40) DEFAULT NULL, CHANGE password_reset_date password_reset_date DATETIME DEFAULT NULL, CHANGE forgot_token forgot_token VARCHAR(40) DEFAULT NULL');
        $this->addSql('ALTER TABLE ville CHANGE pays_id pays_id INT DEFAULT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE directeurachat (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) CHARACTER SET latin1 NOT NULL COLLATE `latin1_swedish_ci`, acheteurs INT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE abonnement CHANGE offre_id offre_id INT DEFAULT NULL, CHANGE demande_id demande_id INT DEFAULT NULL, CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE zone_id zone_id INT DEFAULT NULL, CHANGE commercial_id commercial_id INT DEFAULT NULL, CHANGE mode_id mode_id INT DEFAULT NULL, CHANGE duree_id duree_id INT DEFAULT NULL, CHANGE currency_id currency_id INT DEFAULT NULL, CHANGE expired expired DATETIME DEFAULT \'NULL\', CHANGE date_peiment date_peiment DATETIME DEFAULT \'NULL\', CHANGE commentaire commentaire VARCHAR(1000) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE acheteur CHANGE pays_id pays_id INT DEFAULT NULL, CHANGE ville_id ville_id INT DEFAULT NULL, CHANGE currency_id currency_id INT DEFAULT NULL, CHANGE secteur_id secteur_id INT DEFAULT NULL, CHANGE civilite civilite VARCHAR(5) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE ice ice VARCHAR(15) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE fix fix VARCHAR(30) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE website website VARCHAR(30) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE role role VARCHAR(50) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE code_client code_client VARCHAR(30) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE autre_ville autre_ville VARCHAR(50) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE autre_currency autre_currency VARCHAR(10) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE acheteur_provisoire CHANGE acheteur_parent_id acheteur_parent_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE actualite CHANGE image_id image_id INT DEFAULT NULL, CHANGE keywords keywords VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE actualite_image CHANGE url url VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE attachement CHANGE url url VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE type type VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE avatar CHANGE url url VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE black_listes ADD team_id INT DEFAULT NULL, CHANGE acheteur_id acheteur_id INT DEFAULT NULL, CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE deblacklister deblacklister DATETIME DEFAULT \'NULL\', CHANGE ice ice VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE pays pays VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE ville ville VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE siret siret VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE fournisseurEx fournisseurEx VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE email email VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE contact_fournisseur CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE date_validation date_validation DATETIME DEFAULT \'NULL\', CHANGE date_read date_read DATETIME DEFAULT \'NULL\'');
        $this->addSql('ALTER TABLE demande_abonnement CHANGE offre_id offre_id INT DEFAULT NULL, CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE zone_id zone_id INT DEFAULT NULL, CHANGE commercial_id commercial_id INT DEFAULT NULL, CHANGE duree_id duree_id INT DEFAULT NULL, CHANGE mode_id mode_id INT DEFAULT NULL, CHANGE suggestions suggestions LONGTEXT CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci` COMMENT \'(DC2Type:array)\'');
        $this->addSql('ALTER TABLE demande_achat DROP FOREIGN KEY FK_D077077F296CD8AE');
        $this->addSql('DROP INDEX IDX_D077077F296CD8AE ON demande_achat');
        $this->addSql('ALTER TABLE demande_achat CHANGE acheteur_id acheteur_id INT DEFAULT NULL, CHANGE team_id team_id INT DEFAULT NULL, CHANGE fournisseur_gagne_id fournisseur_gagne_id INT DEFAULT NULL, CHANGE currency_id currency_id INT DEFAULT NULL, CHANGE motif_rejet_id motif_rejet_id INT DEFAULT NULL, CHANGE reference reference VARCHAR(50) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE nbr_visite nbr_visite INT DEFAULT NULL, CHANGE nbr_share nbr_share INT DEFAULT NULL, CHANGE pays pays VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE ville ville VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE autre_categories autre_categories VARCHAR(250) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE demande_devis CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE produit_id produit_id INT DEFAULT NULL, CHANGE societe societe VARCHAR(50) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE quantity quantity SMALLINT DEFAULT NULL, CHANGE date_validation date_validation DATETIME DEFAULT \'NULL\', CHANGE date_read date_read DATETIME DEFAULT \'NULL\'');
        $this->addSql('ALTER TABLE demande_jeton CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE detail_visite CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE personnel_id personnel_id INT DEFAULT NULL, CHANGE demande_id demande_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE diffusion_demande CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE demande_id demande_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE ext_log_entries CHANGE object_id object_id VARCHAR(64) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE data data LONGTEXT CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci` COMMENT \'(DC2Type:array)\', CHANGE username username VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE faq CHANGE categorie_id categorie_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE fiche CHANGE url url VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE type type VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE fournisseur CHANGE pays_id pays_id INT DEFAULT NULL, CHANGE ville_id ville_id INT DEFAULT NULL, CHANGE currency_id currency_id INT DEFAULT NULL, CHANGE parent parent INT DEFAULT NULL, CHANGE societe_lower societe_lower VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE ice ice VARCHAR(15) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE fix fix VARCHAR(30) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE website website VARCHAR(30) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE code_client code_client VARCHAR(30) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE autre_ville autre_ville VARCHAR(50) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE autre_categories autre_categories VARCHAR(250) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE autre_currency autre_currency VARCHAR(10) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE fournisseur_provisoire CHANGE fournisseur_parent_id fournisseur_parent_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE historique_visite CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE demande_id demande_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE image_produit CHANGE url url VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE image_secteur CHANGE url url VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE jeton CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE paiement_id paiement_id INT DEFAULT NULL, CHANGE demande_id demande_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE mediateur CHANGE acheteur_id acheteur_id INT DEFAULT NULL, CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE deblacklister deblacklister DATETIME DEFAULT \'NULL\'');
        $this->addSql('ALTER TABLE personnel CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE avatar_id avatar_id INT DEFAULT NULL, CHANGE agence agence VARCHAR(20) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE ville ville VARCHAR(20) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE produit CHANGE secteur_id secteur_id INT DEFAULT NULL, CHANGE sous_secteurs_id sous_secteurs_id INT DEFAULT NULL, CHANGE categorie_id categorie_id INT DEFAULT NULL, CHANGE fournisseur_id fournisseur_id INT DEFAULT NULL, CHANGE fiche_technique_id fiche_technique_id INT DEFAULT NULL, CHANGE featured_image_id_id featured_image_id_id INT DEFAULT NULL, CHANGE pays_id pays_id INT DEFAULT NULL, CHANGE ville_id ville_id INT DEFAULT NULL, CHANGE currency_id currency_id INT DEFAULT NULL, CHANGE titre_lower titre_lower VARCHAR(100) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE date_validation date_validation DATETIME DEFAULT \'NULL\', CHANGE videos videos VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE autre_secteur autre_secteur VARCHAR(80) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE autre_activite autre_activite VARCHAR(80) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE autre_produit autre_produit VARCHAR(80) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE secteur CHANGE image_id image_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE select_produit CHANGE produit_id produit_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE sous_secteur CHANGE secteur_id secteur_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE suggestion_secteur CHANGE user_id user_id INT DEFAULT NULL, CHANGE categorie categorie VARCHAR(100) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE team ADD name VARCHAR(150) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE acheteur_id acheteur_id INT NOT NULL, CHANGE avatar_id avatar_id INT DEFAULT NULL, CHANGE zz zz VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE first_name first_name VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE last_name last_name VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE fullName fullName VARCHAR(150) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE phone phone VARCHAR(20) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE del del TINYINT(1) DEFAULT \'NULL\', CHANGE agence agence VARCHAR(20) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE ville ville VARCHAR(20) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE user CHANGE parent1 parent1 INT DEFAULT NULL, CHANGE avatar_id avatar_id INT DEFAULT NULL, CHANGE adresse1 adresse1 VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE adresse2 adresse2 VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE codepostal codepostal INT DEFAULT NULL, CHANGE password_change_date password_change_date INT DEFAULT NULL, CHANGE confirmation_token confirmation_token VARCHAR(40) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE password_reset_date password_reset_date DATETIME DEFAULT \'NULL\', CHANGE forgot_token forgot_token VARCHAR(40) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE ville CHANGE pays_id pays_id INT DEFAULT NULL');
    }
}
