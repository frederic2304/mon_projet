# Base de données de Lokafête (Supabase)

Le schéma complet est dans `schema.sql`. Il a été testé sur PostgreSQL 16 : création des tables, calcul des totaux, réservations de matériel, et isolation entre prestataires (un prestataire ne voit ni ne modifie jamais les données d'un autre).

## Les tables

| Table | Contenu | Liée à |
|---|---|---|
| `organisations` | Un compte prestataire : nom, métiers, téléphone, ville, IFU | — |
| `equipe` | Les membres de l'équipe, avec ou sans accès à l'application, et leur rôle (propriétaire, admin, membre) | organisation, compte utilisateur |
| `clients` | Les clients du prestataire | organisation |
| `articles` | Le catalogue : **prestations** (décoration, repas…) et **matériel** (chaises, bâches…) avec prix, stock et caution | organisation |
| `ceremonies` | Chaque événement : client, type, dates, lieu, nombre d'invités, thème, couleurs, statut | organisation, client |
| `devis` | Les devis d'une cérémonie : numéro, statut, remise | cérémonie |
| `lignes_devis` | Les lignes d'un devis : article, quantité, prix | devis, article |
| `paiements` | Avances, soldes, cautions et remboursements, par MoMo ou en espèces | cérémonie |
| `depenses` | Les dépenses d'une cérémonie (fleurs, transport…), pour calculer le bénéfice | cérémonie |
| `affectations` | Qui travaille sur quelle cérémonie, à quelle heure, pour quelle tâche | cérémonie, équipe |
| `mouvements_materiel` | Bons de sortie et de retour, avec l'état du matériel (bon, abîmé, perdu) | cérémonie, article |
| `photos` | Photos de réalisations, publiques ou non (portfolio) | cérémonie |
| `abonnements` | L'abonnement Lokafête du prestataire (essai, essentiel, pro) | organisation |

## Outils inclus

- **`totaux_devis`** (vue) : total de chaque devis, lignes moins remise.
- **`creer_organisation(nom, nom_utilisateur)`** : crée le compte prestataire, ajoute l'utilisateur comme propriétaire et démarre un essai de 30 jours. À appeler juste après l'inscription.
- **`quantite_reservee(article, debut, fin)`** : quantité d'un article déjà réservée sur une période (devis acceptés, cérémonies non annulées). Disponible = stock − quantité réservée. C'est ce qui évite les doubles réservations.

## Sécurité

La **Row Level Security** est activée sur toutes les tables :
- les membres d'une organisation lisent et gèrent ses données métier ;
- seuls les propriétaires et admins modifient l'organisation et l'équipe ;
- l'abonnement est en lecture seule : il doit être mis à jour **côté serveur** après un paiement confirmé (webhook FedaPay ou KkiaPay, avec la clé `service_role`, jamais exposée dans le navigateur).

## Installer le schéma

1. Dans Supabase, ouvrir **SQL Editor**, puis **New query**.
2. Coller tout le contenu de `schema.sql`, puis cliquer sur **Run**.
3. Vérifier dans **Table Editor** que les 13 tables sont créées.

## Consigne pour Claude Code

> Lis `docs/database/README.md` et `docs/database/schema.sql`. Le schéma est déjà installé dans Supabase. Génère les types TypeScript avec la CLI Supabase, puis branche l'application : après l'inscription, appelle `creer_organisation` ; utilise `quantite_reservee` pour afficher le matériel disponible à une date ; n'utilise jamais la clé `service_role` côté navigateur.
