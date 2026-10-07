-- Nettoyage : supprime tout ce que le schéma Lokafête a pu créer en partie.
-- À exécuter AVANT la partie 1 si une erreur « already exists » apparaît.
drop view if exists totaux_devis cascade;
drop table if exists abonnements, photos, mouvements_materiel, affectations, depenses,
  paiements, lignes_devis, devis, ceremonies, articles, clients, equipe, organisations cascade;
drop function if exists mes_organisations, est_admin, creer_organisation, quantite_reservee cascade;
drop type if exists role_equipe, type_article, type_ceremonie, statut_ceremonie, statut_devis,
  type_paiement, moyen_paiement, statut_paiement, type_mouvement, etat_materiel,
  offre_abonnement, statut_abonnement cascade;
