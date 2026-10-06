# Brief SaaS : l'outil de gestion de tous les prestataires de cérémonies et d'événements au Bénin

Ce brief sert à rédiger le copywriting de la landing page.
Il accompagne la maquette `docs/maquette-landing-page.md` (structure en 16 sections).

Il élargit `docs/brief-saas.md`, centré sur les loueurs de matériel, à **tous les métiers des cérémonies et des événements** : décoration, location, traiteur, sonorisation, photo, organisation, etc.

> **Important :** les douleurs, bénéfices et prix ci-dessous sont des **hypothèses**. Ils seront confirmés ou corrigés par les entretiens clients. Tout ce qui est marqué *(à valider)* peut changer.

**Nom du produit :** Lokafête *(provisoire ; le domaine `lokafete.com` est disponible)*.

---

## Instructions pour Claude Code

- Rédige tous les textes de la landing page **en français**, section par section, en suivant l'ordre de `docs/maquette-landing-page.md`.
- La page s'adresse à **tous les prestataires d'événements**. Le haut de page doit parler à tous ; les sections suivantes peuvent montrer des exemples par métier (décorateur, loueur, traiteur…).
- Propose **2 ou 3 variantes** pour le titre principal, le sous-titre et les boutons CTV.
- Écris pour un prestataire béninois qui lit sur son téléphone : **phrases courtes, mots simples, pas de jargon tech** (pas de « SaaS », « dashboard », « cloud », « workflow »).
- Parle de **résultats concrets** (argent encaissé, événements mieux organisés, temps gagné, clients rassurés), pas de fonctionnalités.
- **N'invente jamais** de témoignages, de chiffres d'utilisateurs, de statistiques ou de logos clients. Laisse des emplacements clairement marqués, par exemple `[TÉMOIGNAGE À RECUEILLIR]` ou `[X prestataires]`.
- Mets les textes finaux dans `content/landing.ts` pour que les composants les lisent.

---

## 1. Le produit en une phrase

Lokafête est l'application sur téléphone qui permet aux décorateurs, loueurs, traiteurs et à tous les prestataires de cérémonies de **gérer leurs réservations, leurs devis, leur matériel, leur équipe et leurs acomptes MoMo**, au même endroit, avec des rappels automatiques sur WhatsApp.

## 2. Le contexte

- Au Bénin, les **cérémonies** rythment la vie : mariages (civil, traditionnel, religieux), funérailles et veillées, baptêmes, communions, anniversaires, fêtes de fin d'année, événements d'entreprise et séminaires.
- Une cérémonie mobilise **plusieurs prestataires à la fois** : décorateur, loueur de chaises et de bâches, traiteur, sonorisation, photographe… Chacun gère son activité de son côté.
- Chaque événement représente plusieurs dizaines ou centaines de milliers de FCFA par prestataire.
- Les prestataires travaillent aujourd'hui avec un **cahier, WhatsApp, des notes vocales et leur mémoire**.
- Le paiement se fait en **espèces et par Mobile Money** (MTN MoMo, Moov Money).
- Les week-ends et la saison des cérémonies sont très chargés : plusieurs événements le même jour, des équipes à répartir, du matériel à déplacer.
- **Concurrence :** aucun outil de gestion béninois trouvé pour ces prestataires. Les outils existants sont étrangers (Booqable, Rentman), en euros et pas adaptés au Mobile Money. Les plateformes locales (annuaires comme Afrika Deal ou mariage.bj, billetterie comme Faevent) aident les clients à *trouver* un prestataire ou à vendre des billets, pas les prestataires à *gérer* leur activité.

## 3. Les métiers visés

| Métier | Ce qu'ils vendent | Priorité |
|---|---|---|
| **Décorateurs** | Décoration de salle et de scène, arches, fleurs, ballons, drapés et tissus, centres de table, éclairage d'ambiance | Principale |
| **Loueurs de matériel** | Chaises, tables, bâches, chapiteaux, tentes, housses, nappes, vaisselle, ventilateurs, groupes électrogènes | Principale |
| **Traiteurs** | Repas, buffets, boissons, service, pâtisserie et gâteaux | Principale |
| Sonorisation, DJ, éclairage | Matériel son et lumière, animation | Secondaire |
| Photographes et vidéastes | Reportage photo et vidéo, albums, drone | Secondaire |
| Organisateurs et wedding planners | Coordination complète de l'événement | Secondaire |
| Maîtres de cérémonie, groupes musicaux, fanfares | Animation | Secondaire |
| Salles de fête | Location de lieu | Plus tard |

Beaucoup de prestataires **cumulent plusieurs métiers** : par exemple un décorateur qui loue aussi ses chaises et ses bâches. L'outil doit gérer à la fois des **prestations** (une décoration, un repas, un reportage) et du **matériel à louer**.

## 4. Le client idéal

| | Description |
|---|---|
| Qui | Décorateur, loueur ou traiteur, souvent les trois à la fois |
| Où | Cotonou, Abomey-Calavi, Porto-Novo, puis les autres villes |
| Taille | Seul ou avec une équipe de 2 à 15 personnes, souvent des journaliers pour le montage |
| Volume | Plusieurs événements par semaine, surtout le week-end |
| Comment il trouve ses clients | Bouche-à-oreille, WhatsApp (statuts), Facebook, Instagram, TikTok |
| Outils actuels | Cahier, WhatsApp, appels, photos dans la galerie du téléphone |
| Équipement | Smartphone Android ; rarement un ordinateur |

## 5. Les points douloureux *(à valider)*

### Communs à tous les métiers

À utiliser dans la section « Exposer le problème », bloc rose.

1. **Double réservation :** deux clients le même samedi, et on s'en rend compte trop tard.
2. **Devis longs à faire :** chaque devis est refait à la main ou dicté sur WhatsApp, avec des oublis et des erreurs de calcul.
3. **Acomptes et soldes difficiles à encaisser :** le client paie l'avance en retard, ou ne paie jamais le solde après l'événement.
4. **Tout est dans le cahier ou dans la tête :** impossible de voir d'un coup d'œil le planning du mois, et le cahier peut se perdre.
5. **Pas de visibilité sur l'argent :** à la fin du mois, impossible de dire combien chaque événement a vraiment rapporté.

### Propres à chaque métier

| Métier | Douleurs spécifiques |
|---|---|
| Décorateurs | Le client change d'avis sur les couleurs et les thèmes ; il faut acheter fleurs et fournitures avant d'avoir reçu l'avance ; les photos des réalisations sont perdues dans la galerie ; difficile de répartir l'équipe de montage quand il y a plusieurs événements |
| Loueurs | Matériel perdu, abîmé ou rendu en retard, sans preuve de ce qui est parti ; ne pas savoir ce qui est libre à une date |
| Traiteurs | Nombre d'invités qui change à la dernière minute ; calcul des quantités et du coût de revient ; achats au marché à prévoir |
| Son, photo, animation | Planning chargé le week-end ; livrables (photos, vidéos) à suivre ; clients qui réclament des prestations non prévues |
| Organisateurs | Coordonner plusieurs prestataires et leurs paiements pour un seul client |

## 6. Les bénéfices correspondants

À utiliser dans le bloc vert, chacun en face de sa douleur commune.

1. **Plus jamais de double réservation :** votre planning de tous les événements, visible en 2 secondes.
2. **Un devis professionnel en 2 minutes :** prestations et matériel choisis dans votre catalogue, total calculé, PDF envoyé sur WhatsApp.
3. **L'avance et le solde arrivent par MoMo :** lien de paiement envoyé au client, rappels automatiques avant et après l'événement.
4. **Votre cahier dans votre téléphone :** clients, événements, matériel et équipe au même endroit, même si vous changez de téléphone.
5. **Vous savez combien vous gagnez :** recettes, dépenses et bénéfice par événement et par mois.

**Bénéfices par métier,** à utiliser dans les exemples et la section « Ta solution » :

| Métier | Bénéfice à mettre en avant |
|---|---|
| Décorateurs | Fiche par événement avec thème, couleurs et photos d'inspiration validées par le client ; portfolio de vos réalisations à partager en un lien ; l'avance encaissée avant d'acheter les fournitures |
| Loueurs | Stock et disponibilités par date ; bons de sortie et de retour signés ; caution calculée automatiquement |
| Traiteurs | Devis selon le nombre d'invités ; menus enregistrés et réutilisables ; coût de revient par événement |
| Son, photo, animation | Planning du week-end clair ; suivi des livrables |
| Équipes | Chaque membre de l'équipe sait où il doit être, à quelle heure, et ce qu'il doit apporter |

## 7. Les 3 bénéfices pour le haut de page

Courts, une ligne chacun, valables pour tous les métiers :

- ✓ Plus de double réservation
- ✓ Devis prêts en 2 minutes
- ✓ Acomptes et soldes payés par MoMo

## 8. Le résultat désiré (titre principal)

Le titre vend **le résultat**, pas l'outil. Pistes à développer :

- Organisez plus de cérémonies, sans stress et sans impayés.
- Toutes vos cérémonies, vos devis et vos paiements MoMo dans votre téléphone.
- Décorateurs, loueurs, traiteurs : gérez vos événements comme un pro.

## 9. Fonctionnalités de la première version

À traduire en bénéfices dans les textes, jamais à lister telles quelles dans le haut de page.

| Fonctionnalité | Bénéfice à mettre en avant |
|---|---|
| Catalogue : prestations et matériel avec prix | Préparer un devis en quelques clics |
| Planning des événements par date | Éviter les doubles réservations, voir le mois d'un coup d'œil |
| Fiche événement : client, lieu, date, thème, couleurs, photos, notes | Ne rien oublier de ce que le client a demandé |
| Devis et factures en PDF | Paraître professionnel, envoyer sur WhatsApp |
| Lien de paiement MoMo (avance, solde, caution) | Être payé sans courir après le client |
| Rappels WhatsApp automatiques | Moins d'oublis, moins d'impayés |
| Stock de matériel et disponibilités | Savoir ce qui est libre à une date |
| Bons de sortie et de retour | Preuve en cas de matériel manquant ou abîmé |
| Équipe et affectations | Chacun sait où aller et quoi apporter |
| Dépenses par événement | Connaître le vrai bénéfice |
| Portfolio partageable | Montrer ses réalisations en un lien, sur WhatsApp ou les réseaux |
| Rapports du mois | Savoir combien vous gagnez |

**Plus tard :** facture normalisée e-MECeF, collaboration entre prestataires sur un même événement, sous-location de matériel entre prestataires, espace client pour suivre son événement.

## 10. Les 3 étapes (section « Ta solution »)

1. **Créez votre catalogue** : vos prestations et votre matériel avec leurs prix, en quelques minutes.
2. **Enregistrez une cérémonie** : l'application vérifie vos disponibilités, prépare le devis et l'envoie au client sur WhatsApp.
3. **Encaissez et organisez** : l'avance et le solde arrivent par MoMo, l'équipe reçoit son planning, les rappels partent tout seuls.

## 11. Objections et réponses

| Objection | Réponse à utiliser |
|---|---|
| « Je ne suis pas fort en informatique » | Aussi simple que WhatsApp. Si vous savez envoyer un message, vous savez l'utiliser. |
| « Mon cahier marche très bien » | Votre cahier ne vous prévient pas d'une double réservation et ne relance pas vos clients. |
| « Ça coûte cher » | Un seul solde récupéré ou une seule double réservation évitée paie l'abonnement du mois. |
| « Je fais plusieurs métiers à la fois » | Lokafête gère vos prestations et votre matériel dans le même devis. |
| « Je n'ai pas d'ordinateur » | Tout se fait sur le téléphone. |
| « Ma connexion est mauvaise » | Application légère, pensée pour les connexions lentes. |
| « Et si je perds mon téléphone ? » | Vos données sont sauvegardées en ligne ; vous les retrouvez sur un nouveau téléphone. |
| « Mes clients paient en espèces » | Vous pouvez aussi noter les paiements en espèces. |

Objection à placer sous le bouton de la section « Ta solution » : **« Aucune compétence en informatique requise. »**

## 12. Tarifs *(à valider)*

- **Modèle recommandé :** abonnement mensuel payé par MoMo, plus facile à accepter qu'un gros paiement unique.
- La maquette conseille un « accès à vie » au lancement. **À tester**, par exemple en offre « membre fondateur » limitée aux 50 premiers clients.
- Fourchettes à confirmer :

| Offre | Pour qui | Prix indicatif |
|---|---|---|
| Essentiel | Prestataire seul, un seul métier | 5 000 à 10 000 FCFA / mois |
| Pro (mise en avant) | Prestataire avec équipe, plusieurs métiers, matériel à louer | 15 000 à 25 000 FCFA / mois |

- Essai gratuit possible : 14 ou 30 jours, sans engagement.
- Titre de la section tarifs : vendre le résultat rêvé, par exemple « Des week-ends de cérémonies sans stress ».

## 13. Questions pour la FAQ

1. Lokafête est-il fait pour mon métier ? (décorateur, loueur, traiteur, sonorisation, photographe…)
2. Je fais plusieurs métiers, puis-je tout gérer au même endroit ?
3. Est-ce que ça marche sur un téléphone Android simple ?
4. Faut-il un ordinateur ?
5. Comment mes clients paient-ils par MoMo ?
6. Puis-je ajouter les membres de mon équipe ?
7. Mes données sont-elles en sécurité ? Que se passe-t-il si je perds mon téléphone ?
8. Puis-je essayer avant de payer ?
9. Puis-je arrêter quand je veux ?
10. Comment obtenir de l'aide ? (réponse : support sur WhatsApp, en français)

## 14. Ton et style

- **Vouvoiement**, ton chaleureux et respectueux, comme un professionnel qui parle à un autre professionnel.
- Phrases courtes. Une idée par phrase.
- Exemples concrets du quotidien béninois : un mariage le samedi, des funérailles, une décoration en blanc et or, 300 invités, 200 chaises, une avance par MoMo.
- Valoriser le métier : les prestataires sont fiers de leur travail. Le ton doit les traiter en professionnels, pas en débutants.
- Optimiste mais crédible : pas de promesses exagérées.

**Mots à utiliser :** cérémonie, événement, réservation, devis, avance, solde, caution, matériel, décoration, équipe, client, MoMo, WhatsApp, cahier, téléphone.

**Mots à éviter :** SaaS, plateforme, solution digitale, dashboard, cloud, workflow, optimiser, synergie, révolutionner.

## 15. Storytelling *(à compléter par le fondateur)*

Section à écrire avec l'histoire réelle du fondateur (Frédéric) : pourquoi ce projet, ce qu'il a vu chez des prestataires de cérémonies autour de lui.
Claude Code doit proposer une **trame** avec des questions à remplir, sans inventer d'histoire.

## 16. Preuve sociale

- Aucun client pour l'instant : **ne rien inventer**.
- Au lancement, remplacer les témoignages par :
  - une offre « clients pilotes » (« Rejoignez les premiers prestataires à tester Lokafête ») ;
  - puis les vrais retours des clients pilotes, avec leur accord, en variant les métiers (un décorateur, un loueur, un traiteur).
- Le Mur de l'Amour peut aussi montrer des **photos de réalisations** des clients pilotes (décorations, installations), avec leur accord.

## 17. Appels à l'action

- Bouton principal (CTV) : vendre le résultat, pas « S'inscrire ». Pistes : « Organiser mes cérémonies sans stress », « Essayer gratuitement pendant 30 jours ».
- Bouton de la barre de navigation (CTA) : court, par exemple « Essai gratuit ».
- Ajouter un contact **WhatsApp** visible : beaucoup de prestataires préféreront poser une question avant de s'inscrire.
