# Lokafête : feuille de route des fonctionnalités

Priorité : **les décorateurs**, sans oublier les loueurs et traiteurs (beaucoup cumulent les métiers).
Choix validés :
- **Paiements MoMo** : saisie manuelle dans la version 1, intégration FedaPay ou KkiaPay en phase 3.
- **WhatsApp** : bouton « Envoyer sur WhatsApp » (lien `wa.me` avec message prérempli) dès la version 1, envois automatiques via l'API WhatsApp Business dès que possible (phase 3).

Le fil conducteur est le parcours d'une cérémonie :
`Demande → Devis → Avance → Préparation → Jour J → Retour du matériel → Solde → Bilan`

---

## Phase 1 : la version 1 (MVP)

Objectif : un décorateur gère une cérémonie de la demande au bilan, sans cahier.

### 1. Catalogue
- [ ] Prestations (décoration de salle, arche, centre de table, drapé…) avec prix et unité (forfait, pièce, mètre…).
- [ ] Matériel (chaises, housses, nappes, vases, structures…) avec prix, stock et caution.
- [ ] Photo par article.
- [ ] Packs : un ensemble de prestations et de matériel vendu ensemble (ex. « Pack mariage blanc et or »).

### 2. Cérémonies
- [ ] Créer une cérémonie : client, type (mariage, funérailles, baptême…), date et heures, lieu, ville, nombre d'invités.
- [ ] **Fiche décoration** : thème, couleurs (pastilles de couleur), notes du client.
- [ ] **Planche d'inspiration** : photos d'inspiration téléversées (photos envoyées par le client sur WhatsApp, Pinterest…).
- [ ] Statuts : demande → devis envoyé → confirmée → terminée / annulée.
- [ ] Fiche client avec l'historique de ses cérémonies.

### 3. Planning et disponibilités
- [ ] Calendrier du mois et liste « cette semaine », avec plusieurs cérémonies le même jour.
- [ ] Alerte si un matériel est déjà réservé sur la même période (fonction `quantite_reservee`).

### 4. Devis et factures
- [ ] Devis construit depuis le catalogue (prestations, matériel, packs, lignes libres), remise, total automatique.
- [ ] PDF au nom du prestataire (logo, coordonnées, IFU), numérotation automatique.
- [ ] **Lien de partage** : une page web où le client voit le devis **et** la planche d'inspiration, et peut l'accepter.
- [ ] Bouton « Envoyer sur WhatsApp » avec le lien et un message prérempli.
- [ ] Transformer un devis accepté en facture.

### 5. Paiements (saisie manuelle)
- [ ] Enregistrer une avance, un solde, une caution : montant, moyen (MTN MoMo, Moov Money, espèces…), date.
- [ ] Reste à payer calculé automatiquement sur chaque cérémonie.
- [ ] Bouton « Relancer sur WhatsApp » pour le solde, avec message prérempli.

### 6. Tableau de bord et bilan
- [ ] Accueil : cérémonies à venir, montants à encaisser, alertes (matériel en conflit, soldes en retard).
- [ ] Dépenses par cérémonie (fleurs, tissus, transport, journaliers).
- [ ] Bénéfice par cérémonie et par mois.

---

## Phase 2 : organisation et image

### 7. Équipe et préparation
- [ ] Membres de l'équipe, y compris les journaliers sans compte.
- [ ] Affectations par cérémonie : qui, quelle tâche (montage, démontage…), à quelle heure.
- [ ] **Checklist de montage** par cérémonie, cochable sur téléphone.
- [ ] **Liste d'achats** de fournitures (fleurs, ballons, tissus), reliée aux dépenses.
- [ ] Envoi du planning à chaque membre par WhatsApp.

### 8. Matériel : sortie et retour
- [ ] Bon de sortie (ce qui part chez le client).
- [ ] Bon de retour : bon, abîmé, perdu, avec retenue sur la caution.
- [ ] Signature du client sur le téléphone.

### 9. Portfolio
- [ ] Photos des réalisations après chaque cérémonie.
- [ ] Page portfolio publique et partageable (lien à mettre en statut WhatsApp, Instagram, Facebook).

---

## Phase 3 : automatisation

### 10. Paiement MoMo intégré
- [ ] Liens de paiement FedaPay ou KkiaPay (MTN MoMo, Moov Money).
- [ ] Mise à jour automatique du paiement à la réception (webhook côté serveur).

### 11. WhatsApp automatique
- [ ] API WhatsApp Business : envoi automatique du devis, rappel de l'avance, rappel la veille, relance du solde.
- [ ] Modèles de messages en français, validés par Meta.

### 12. Abonnement Lokafête
- [ ] Paiement de l'abonnement des prestataires (Essentiel / Pro) par MoMo.
- [ ] Limites selon l'offre.

### Plus tard
- Facture normalisée e-MECeF.
- Collaboration entre prestataires sur une même cérémonie (décorateur + loueur + traiteur).
- Application installable (PWA) et mode hors connexion.
- Espace client pour suivre sa cérémonie.

---

## Règles pour Claude Code

- Construire **une fonctionnalité à la fois**, dans l'ordre ci-dessus, et la tester avant de passer à la suivante.
- **Mobile d'abord** : chaque écran doit être confortable sur un téléphone Android.
- Respecter la base de données existante (`app/database/schema.sql`) ; proposer les ajouts de tables ou colonnes avant de les créer (ex. packs, planche d'inspiration, checklist).
- Interface en français, montants en FCFA sans décimales, dates au format jour/mois/année.
- Après chaque fonctionnalité : `pnpm build`, commit clair en français, et cocher la case dans ce fichier.
