# Brief SaaS : gestion pour prestataires d'événements au Bénin

Ce brief sert à rédiger le copywriting de la landing page.
Il accompagne la maquette `docs/maquette-landing-page.md` (structure en 16 sections).

> **Important :** les douleurs, bénéfices et prix ci-dessous sont des **hypothèses**. Ils seront confirmés ou corrigés par les entretiens clients en cours. Tout ce qui est marqué *(à valider)* peut changer.

---

## Instructions pour Claude Code

- Rédige tous les textes de la landing page **en français**, section par section, en suivant l'ordre de `docs/maquette-landing-page.md`.
- Propose **2 ou 3 variantes** pour le titre principal, le sous-titre et les boutons CTV, pour que je choisisse.
- Écris pour un prestataire béninois qui lit sur son téléphone : **phrases courtes, mots simples, pas de jargon tech** (pas de « SaaS », « dashboard », « cloud », « workflow »).
- Parle de **résultats concrets** (argent récupéré, matériel retrouvé, temps gagné), pas de fonctionnalités.
- **N'invente jamais** de témoignages, de chiffres d'utilisateurs, de statistiques ou de logos clients. Laisse des emplacements clairement marqués, par exemple `[TÉMOIGNAGE À RECUEILLIR]` ou `[X prestataires]`.
- Le nom du produit n'est pas encore choisi : utilise `[NOM DU PRODUIT]`. Si tu veux, propose 5 idées de noms courts, faciles à prononcer au Bénin, avec un nom de domaine probablement disponible.
- Mets les textes finaux dans `content/landing.ts` pour que les composants les lisent.

---

## 1. Le produit en une phrase

Une application simple sur téléphone qui permet aux loueurs de matériel, traiteurs et décorateurs de **gérer leurs réservations, leur matériel et leurs acomptes MoMo**, et d'envoyer automatiquement les rappels à leurs clients sur WhatsApp.

## 2. Le contexte

- Au Bénin, les **cérémonies** sont très fréquentes : mariages (civil, traditionnel, religieux), funérailles, baptêmes, anniversaires, sorties de deuil, événements d'entreprise.
- Chaque événement mobilise du matériel et de l'argent : un panier de **50 000 à 500 000 FCFA** par événement pour un loueur.
- Les prestataires travaillent aujourd'hui avec un **cahier, WhatsApp et leur mémoire**.
- Le paiement se fait en **espèces et par Mobile Money** (MTN MoMo, Moov Money).
- **Concurrence :** aucun outil de gestion béninois trouvé pour ces prestataires. Les outils existants sont étrangers (Booqable, Rentman), en euros, en anglais et pas adaptés au Mobile Money. Les plateformes béninoises existantes (annuaires comme Afrika Deal ou mariage.bj) aident les clients à *trouver* un prestataire, pas les prestataires à *gérer* leur activité.

## 3. La cible (client idéal)

**Cible principale : les loueurs de matériel événementiel.**

| | Description |
|---|---|
| Qui | Loueurs de chaises, tables, bâches, tentes, vaisselle, nappes, sonorisation |
| Où | Cotonou, Abomey-Calavi, Porto-Novo, puis les autres villes |
| Taille | Seul ou avec 2 à 10 employés |
| Volume | Plusieurs événements par semaine, surtout le week-end ; forte saison des cérémonies |
| Outils actuels | Cahier, carnet, WhatsApp, appels |
| Équipement | Smartphone Android ; rarement un ordinateur |

**Cibles secondaires :** traiteurs et décorateurs, qui partagent les mêmes problèmes de réservations, d'acomptes et de suivi des clients.

## 4. Les 5 points douloureux *(à valider)*

À utiliser dans la section « Exposer le problème », bloc rose. Chaque douleur doit sonner comme une situation vécue.

1. **Double réservation :** le même matériel promis à deux clients le même samedi, découvert trop tard.
2. **Matériel perdu ou abîmé :** chaises manquantes, bâches déchirées, vaisselle cassée, et aucune preuve de ce qui est parti chez le client.
3. **Soldes impayés :** le client a versé l'avance, l'événement est passé, et le reste ne vient jamais.
4. **Tout est dans le cahier ou dans la tête :** impossible de savoir rapidement ce qui est libre à une date, et le cahier peut se perdre.
5. **Pas de visibilité sur l'argent :** à la fin du mois, impossible de dire combien on a vraiment gagné.

## 5. Les 5 bénéfices correspondants

À utiliser dans le bloc vert, chacun en face de sa douleur.

1. **Plus jamais de double réservation :** vous voyez en 2 secondes ce qui est libre à n'importe quelle date.
2. **Chaque chaise compte :** une liste de sortie et de retour signée par le client, et la caution calculée automatiquement.
3. **L'avance et le solde arrivent par MoMo :** lien de paiement envoyé au client, rappels automatiques sur WhatsApp.
4. **Votre cahier dans votre téléphone :** toutes vos réservations, vos clients et votre stock au même endroit, même si vous changez de téléphone.
5. **Vous savez combien vous gagnez :** recettes du mois, soldes à recevoir et articles les plus loués, en un coup d'œil.

## 6. Les 3 bénéfices pour le haut de page

Courts, une ligne chacun :

- ✓ Plus de double réservation
- ✓ Acomptes et soldes payés par MoMo
- ✓ Matériel suivi, de la sortie au retour

## 7. Le résultat désiré (titre principal)

Le titre vend **le résultat**, pas l'outil. Pistes à développer :

- Louer plus de matériel sans jamais perdre une chaise ni un franc.
- Vos réservations, votre matériel et vos paiements MoMo, enfin sous contrôle.
- Fini le cahier : gérez vos locations d'événements depuis votre téléphone.

## 8. Fonctionnalités de la première version

À traduire en bénéfices dans les textes, jamais à lister telles quelles dans le haut de page.

| Fonctionnalité | Bénéfice à mettre en avant |
|---|---|
| Stock de matériel avec quantités | Savoir ce que vous possédez vraiment |
| Calendrier de disponibilité par date | Éviter les doubles réservations |
| Réservations et fiches clients | Retrouver un client et son historique en 2 secondes |
| Devis et factures en PDF | Paraître professionnel, envoyer un devis sur WhatsApp |
| Lien de paiement MoMo (avance, solde, caution) | Être payé sans courir après le client |
| Rappels WhatsApp automatiques | Moins d'oublis, moins d'impayés |
| Bon de sortie et bon de retour | Preuve en cas de matériel manquant ou abîmé |
| Rapports du mois | Savoir combien vous gagnez |

**Plus tard :** facture normalisée e-MECeF, gestion de plusieurs employés, sous-location entre loueurs.

## 9. Les 3 étapes (section « Ta solution »)

1. **Ajoutez votre matériel** : chaises, bâches, tables… en quelques minutes.
2. **Enregistrez une réservation** : l'application vérifie que le matériel est libre et envoie le devis au client.
3. **Encaissez par MoMo** : l'avance et le solde arrivent, les rappels partent tout seuls sur WhatsApp.

## 10. Objections et réponses

| Objection | Réponse à utiliser |
|---|---|
| « Je ne suis pas fort en informatique » | Aussi simple que WhatsApp. Si vous savez envoyer un message, vous savez l'utiliser. |
| « Mon cahier marche très bien » | Votre cahier ne vous prévient pas d'une double réservation et ne relance pas vos clients. |
| « Ça coûte cher » | Une seule chaise retrouvée ou un seul solde récupéré paie l'abonnement du mois. |
| « Je n'ai pas d'ordinateur » | Tout se fait sur le téléphone. |
| « Ma connexion est mauvaise » | Application légère, pensée pour les connexions lentes. |
| « Et si je perds mon téléphone ? » | Vos données sont sauvegardées en ligne ; vous les retrouvez sur un nouveau téléphone. |
| « Mes clients ne paient pas par MoMo » | Vous pouvez aussi noter les paiements en espèces. |

Objection à placer sous le bouton de la section « Ta solution » : **« Aucune compétence en informatique requise. »**

## 11. Tarifs *(à valider)*

- **Modèle recommandé :** abonnement mensuel payé par MoMo, plus facile à accepter pour un petit prestataire qu'un gros paiement unique.
- La maquette conseille un « accès à vie » au lancement. **À tester** pendant les entretiens, par exemple sous forme d'offre « membre fondateur » limitée aux 50 premiers clients.
- Fourchettes à confirmer :

| Offre | Pour qui | Prix indicatif |
|---|---|---|
| Essentiel | Petit loueur seul | 5 000 à 10 000 FCFA / mois |
| Pro (mise en avant) | Loueur avec employés, traiteur, décorateur | 15 000 à 25 000 FCFA / mois |

- Essai gratuit possible : 14 ou 30 jours, sans engagement.
- Titre de la section tarifs : vendre le résultat rêvé, par exemple « Plus de week-ends gâchés par les oublis ».

## 12. Questions pour la FAQ

1. Est-ce que ça marche sur un téléphone Android simple ?
2. Faut-il un ordinateur ?
3. Comment mes clients paient-ils par MoMo ?
4. Mes données sont-elles en sécurité ?
5. Que se passe-t-il si je perds mon téléphone ?
6. Puis-je essayer avant de payer ?
7. Puis-je arrêter quand je veux ?
8. Est-ce adapté aux traiteurs et décorateurs, pas seulement aux loueurs ?
9. Puis-je ajouter mes employés ?
10. Comment obtenir de l'aide ? (réponse : support sur WhatsApp, en français)

## 13. Ton et style

- **Vouvoiement**, ton chaleureux et respectueux, comme un commerçant qui parle à un autre commerçant.
- Phrases courtes. Une idée par phrase.
- Exemples concrets du quotidien béninois : un mariage le samedi, des funérailles, une bâche, 200 chaises, une avance par MoMo.
- Optimiste mais crédible : pas de promesses exagérées (« devenez riche », « 10x vos revenus »).

**Mots à utiliser :** réservation, matériel, avance, solde, caution, cérémonie, client, MoMo, WhatsApp, cahier, téléphone.

**Mots à éviter :** SaaS, plateforme, solution digitale, dashboard, cloud, workflow, optimiser, synergie, révolutionner.

## 14. Storytelling *(à compléter par le fondateur)*

Section à écrire avec l'histoire réelle du fondateur (Frédéric) : pourquoi ce projet, quel problème il a vu chez des prestataires autour de lui.
Claude Code doit proposer une **trame** avec des questions à remplir, sans inventer d'histoire.

## 15. Preuve sociale

- Aucun client pour l'instant : **ne rien inventer**.
- Au lancement, remplacer les témoignages par :
  - une offre « clients pilotes » (« Rejoignez les premiers prestataires à tester [NOM DU PRODUIT] ») ;
  - puis les vrais retours des clients pilotes, avec leur accord.

## 16. Appels à l'action

- Bouton principal (CTV) : vendre le résultat, pas « S'inscrire ». Pistes : « Gérer mes réservations sans stress », « Essayer gratuitement pendant 30 jours », « Fini les doubles réservations ».
- Bouton de la barre de navigation (CTA) : court, par exemple « Essai gratuit ».
- Ajouter un contact **WhatsApp** visible : beaucoup de prestataires préféreront poser une question avant de s'inscrire.
