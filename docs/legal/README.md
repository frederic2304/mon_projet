# Pages légales de Lokafête (Bénin)

> **Important :** ces documents sont des **modèles de départ**, pas un avis juridique. Ils s'appuient sur la loi n° 2017-20 du 20 avril 2018 portant Code du numérique en République du Bénin (modifiée en 2020). Le texte officiel n'a pas pu être relu article par article lors de la rédaction : **faites-les relire par un juriste béninois** et vérifiez les démarches auprès de l'APDP avant la mise en ligne.

## Les 4 pages à publier

| Fichier | Page du site | Pourquoi |
|---|---|---|
| `mentions-legales.md` | `/mentions-legales` | Identifier l'éditeur du site : obligation générale d'information du commerce électronique (Livre IV, art. 328) |
| `politique-confidentialite.md` | `/confidentialite` | Informer les utilisateurs sur leurs données personnelles (Livre V) |
| `conditions-generales.md` | `/conditions` | Conditions d'utilisation et de vente de l'abonnement (Livre IV) |
| `politique-cookies.md` | `/cookies` | Expliquer les cookies et recueillir le consentement si nécessaire |

Les liens vers ces pages doivent être **visibles depuis toutes les pages**, au minimum dans le pied de page, et accessibles depuis la page d'accueil.

## Les démarches à faire avant la mise en ligne

- [ ] **Créer une structure légale** : statut d'entreprenant (OHADA) ou société (SARL / SASU), avec un numéro **RCCM** et un **IFU**. Sans cela, vous ne pouvez pas compléter les mentions légales ni facturer.
- [ ] **Déclarer les traitements de données à l'APDP** (Autorité de Protection des Données à caractère Personnel, [apdp.bj](https://apdp.bj)). L'APDP propose un formulaire complémentaire spécifique aux sites web. Indiquer ensuite le numéro de récépissé dans les mentions légales et la politique de confidentialité.
- [ ] **Vérifier l'hébergement et les transferts de données** : si les données sont hébergées hors du Bénin (Vercel, Supabase…), le transfert doit être encadré (pays offrant un niveau de protection adéquat ou garanties appropriées). À confirmer avec l'APDP.
- [ ] **Facture normalisée (e-MECeF)** : vos factures d'abonnement devront être normalisées auprès de la DGI.
- [ ] **Compléter tous les champs `[entre crochets]`** dans les 4 documents.
- [ ] **Faire relire** par un juriste.

## Point particulier : les données des clients de vos clients

Les prestataires enregistrent dans Lokafête les données de **leurs propres clients** (noms, téléphones, adresses d'événements). Pour ces données, le prestataire est **responsable du traitement** et Lokafête agit comme **sous-traitant**. Les conditions générales le prévoient (article 9) : à faire valider par le juriste.

## Pour Claude Code

> Crée les pages `/mentions-legales`, `/confidentialite`, `/conditions` et `/cookies` à partir des fichiers de `docs/legal/`. Mets les liens dans le pied de page. Si le site utilise des cookies non essentiels (statistiques, publicité), ajoute un bandeau de consentement avec « Accepter » et « Refuser » au même niveau.
