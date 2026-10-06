# Maquette : Landing page pour haute conversion

Spécification complète d'une landing page de SaaS, à donner à Claude Code pour qu'il la construise.
Elle reprend la maquette Figma « Landing Page pour SaaS (haute conversion) » section par section, dans l'ordre de la page.

Les textes entre crochets `[...]` sont des emplacements à remplacer par le contenu réel du produit.

---

## Instructions pour Claude Code

- Construis la page avec Next.js (App Router) et Tailwind CSS.
- Crée un composant par section dans `components/landing/`, assemblés dans `app/page.tsx`.
- Garde **exactement l'ordre des 16 sections** ci-dessous.
- La page doit être **responsive, mobile d'abord** : la plupart des visiteurs viendront d'un téléphone.
- Mets tous les textes dans un seul fichier (par exemple `content/landing.ts`) pour pouvoir les modifier sans toucher aux composants.
- Les liens « Témoignages », « Tarifs » et « FAQ » de la navigation font défiler la page jusqu'à la section correspondante (ancres `#temoignages`, `#tarifs`, `#faq`).
- Tous les boutons CTA/CTV pointent vers la même action (inscription ou essai), définie à un seul endroit.
- Les images, la vidéo et les témoignages sont des emplacements (placeholders) tant que le contenu réel n'existe pas.

---

## Style visuel de la maquette

| Élément | Style |
|---|---|
| Fond général | Blanc |
| Fond de la section principale (hero) | Vert très clair |
| Boutons CTA / CTV | Fond jaune clair, bordure foncée, coins arrondis, texte gras |
| Bloc « points douloureux » | Fond rose clair |
| Bloc « bénéfices » | Fond vert clair |
| Séparateurs autour des témoignages | Ligne pointillée horizontale |
| Titres de section | Majuscules, gras, centrés |
| Emplacements d'images | Rectangles gris clair |

---

## Structure de la page

### 1. Barre de navigation

- **Contenu, de gauche à droite :** `LOGO` · liens `Témoignages` · `Tarifs` · `FAQ` · bouton `CTA`.
- **Règle :** navigation simple et **sticky**, qui reste fixée en haut de l'écran pendant le défilement.
- Sur mobile : logo + bouton CTA visibles, les liens peuvent passer dans un menu.

### 2. Section principale (hero) : le résultat désiré

- **Titre (très grand) :** `[RÉSULTAT DÉSIRÉ]`, le résultat que le client veut obtenir.
- **Sous-titre :** `[Explique avec des mots simples comment ton produit aide à obtenir le résultat]`.
- **3 bénéfices** sur une ligne, chacun précédé d'une coche :
  - ✓ `[Bénéfice 1]`
  - ✓ `[Bénéfice 2]`
  - ✓ `[Bénéfice 3]`
- **Bouton CTV** (« call to value ») : `[Obtenir le résultat désiré]`.
- **Preuve sociale :** une rangée de 5 avatars ronds qui se chevauchent, avec en dessous `[X] utilisateurs adorent utiliser ce produit`.

**Règles :**
- Bénéfices ≠ fonctionnalités. Les bénéfices montrent que l'outil simplifie la vie de l'utilisateur. Exemple : « Configuration sans code en 1 minute ».
- Le bouton ne dit **pas** « Commencer gratuitement ». Il dit « Obtenir [le résultat désiré] ».

### 3. Exposer le problème

- **Titre :** `EXPOSER LE PROBLÈME` (à remplacer par un titre adapté au produit).
- **Deux blocs côte à côte** (empilés sur mobile) :
  - **Bloc rose :** liste des **5 choses que ton client idéal fait ou vit en l'absence de ton produit** (5 points douloureux).
  - **Bloc vert :** liste des **5 solutions que ton client idéal expérimentera avec ton produit** (5 bénéfices, chacun répondant à un point douloureux).

### 4. Témoignage

- Bloc encadré par deux lignes pointillées.
- Petit titre : `UN TÉMOIGNAGE`.
- Citation : `"Cet outil m'a permis d'obtenir [X résultat(s)]"`.
- Avatar rond + nom `[M. X]` + réseau social `[social]`.

**Règle :** ajoute un nouveau témoignage sur la page chaque fois que tu en reçois un qui a un fort impact.

### 5. Ta solution expliquée en toute simplicité

- **Titre :** `TA SOLUTION EXPLIQUÉE EN TOUTE SIMPLICITÉ`.
- **3 étapes** côte à côte (empilées sur mobile), chacune avec :
  - une image (emplacement gris) ;
  - un titre : `ÉTAPE 1`, `ÉTAPE 2`, `ÉTAPE 3` ;
  - une petite description.
- **Bouton CTV**.
- Sous le bouton : ✓ `[Une phrase qui retire une objection]`. Exemple : « Pas d'expérience requise ».

**Règle :** cette section peut prendre la forme de 3 étapes illustrées, ou d'une seule grande illustration, selon l'outil.

### 6. Témoignage

Même format que la section 4.

### 7. Vidéo de démonstration

- Un grand lecteur vidéo centré, coins arrondis, avec un bouton lecture au milieu.
- Contenu : **une vidéo démo d'environ 3 minutes** expliquant l'outil.
- **Bonus :** le fondateur montre son visage dans la vidéo.

### 8. Témoignage

Même format que la section 4.

### 9. Storytelling

- **Titre :** `STORYTELLING` (à remplacer par un titre adapté).
- Contenu : l'histoire du fondateur, pourquoi il a créé l'outil et le problème qu'il a lui-même vécu.
- Note de la maquette (partiellement lisible) : « Cette section est vraiment sous-estimée : je la retrouve dans peu de SaaS, mais elle est très commune chez… ».

### 10. Témoignage

Même format que la section 4.

### 11. Tarifs

- **Badge de promotion** au-dessus du titre (petite étiquette encadrée) : `[BADGE DE PROMOTION]`.
- **Titre :** il vend le résultat rêvé, pas le prix. Exemple : « Gagne en liberté ».
- **2 offres côte à côte :**

| | Offre de base | Offre mise en avant |
|---|---|---|
| Taille | Normale | Plus grande, légèrement surélevée |
| Prix | ~~Prix avant promo~~ Prix après promo | ~~Prix avant promo~~ Prix après promo |
| Fonctionnalités | 4 lignes cochées | 6 lignes cochées |
| Bouton | CTA | CTA |

- Sous les offres : `ACCÈS À VIE (sans abonnement)`.

**Règles :**
- Afficher le prix avant la promo barré, puis le prix après la promo.
- L'offre mise en avant doit donner l'impression d'être la plus avantageuse par rapport à son prix.
- Une formule d'accès à vie avec un paiement unique est ce qui fonctionne le mieux au lancement.

### 12. Témoignage

Même format que la section 4.

### 13. Foire aux questions

- **Titre :** `FOIRE AUX QUESTIONS`.
- Liste de questions en accordéon : un clic sur une question affiche sa réponse.
- **Règle :** répondre aux questions que les clients posent le plus souvent.

### 14. Mur de l'Amour (témoignages)

- **Titre :** `Mur de l'Amour (Témoignages)`.
- Grille de témoignages en mosaïque, sur 2 rangées, avec des cartes de largeurs différentes.
- Chaque carte peut contenir une capture d'écran, un message ou un avis.
- Ancre `#temoignages` sur cette section.

### 15. Dernier appel à l'action

- Un **bouton CTV** seul, centré, pour ceux qui ont lu toute la page.

### 16. Pied de page

- **À gauche :** `LOGO`.
- **Au centre :** liens de navigation et liens légaux (mentions légales, confidentialité, conditions d'utilisation).
- **À droite :** icônes des réseaux sociaux (X et Instagram).

---

## Récapitulatif de l'ordre

1. Barre de navigation (sticky)
2. Hero : résultat désiré, 3 bénéfices, CTV, preuve sociale
3. Exposer le problème : 5 douleurs / 5 bénéfices
4. Témoignage
5. Solution en 3 étapes + CTV + objection retirée
6. Témoignage
7. Vidéo démo (~3 min)
8. Témoignage
9. Storytelling
10. Témoignage
11. Tarifs (badge promo, 2 offres, prix barré)
12. Témoignage
13. FAQ
14. Mur de l'Amour
15. CTV final
16. Pied de page
