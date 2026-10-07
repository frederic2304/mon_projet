# Inspirations visuelles : Lokafête

Ces captures sont une **maquette visuelle** de la landing page, aux couleurs du thème tweakcn doré (« Porfolio theme »).
Elles servent d'inspiration pour la mise en page. Le numéro dans le nom du fichier correspond à la section de `docs/maquette-landing-page.md`.

- `00-page-complete-desktop.png` / `00-page-complete-mobile.png` : la page entière, sur ordinateur et sur téléphone.
- `lokafete-landing.html` : le fichier source des captures.

## Ce qu'il faut reprendre, section par section

| Fichier | À reprendre |
|---|---|
| `01-navigation.png` | Barre fine et fixe, logo à gauche, bouton « Essai gratuit » doré à droite |
| `02-hero.png` | Titre sur 2 couleurs (fin du titre en doré), 3 coches dorées, 2 boutons, avatars + phrase sans chiffre inventé, **maquette de téléphone** montrant le planning avec des étiquettes « Avance reçue » / « Solde à recevoir » et une notification MoMo |
| `02b-metiers.png` | Bandeau de pastilles listant les métiers visés, juste sous le hero |
| `03-probleme.png` | Deux colonnes « Sans Lokafête » (rose, croix) / « Avec Lokafête » (vert, coches), une douleur en face de chaque bénéfice |
| `04-temoignage.png` | Citation centrée entre deux lignes pointillées |
| `05-solution.png` | 3 cartes numérotées avec illustration, bouton, puis l'objection retirée sous le bouton |
| `07-video.png` | Grand lecteur sombre aux coins arrondis, bouton lecture doré |
| `09-storytelling.png` | Photo du fondateur à gauche, histoire à droite |
| `11-tarifs.png` | Badge « membre fondateur », 2 offres, la Pro plus grande avec bordure dorée et badge « Le plus choisi », prix barré |
| `13-faq.png` | Accordéon dans des cartes blanches, « + » doré |
| `14-mur-amour.png` | Mosaïque de cartes de hauteurs différentes, avec photos de réalisations |
| `15-cta-final.png` | Bloc sombre arrondi, bouton doré, lien WhatsApp |
| `16-footer.png` | Logo, liens, icônes des réseaux sociaux |

## Règles

- Utiliser les couleurs du thème installé dans le projet, pas les valeurs approximatives de ces captures.
- Les textes entre crochets `[...]` sont des emplacements : ne rien inventer (témoignages, chiffres, prix définitifs).
- Les noms de familles et montants dans la maquette du téléphone sont des exemples fictifs de démonstration.
- Version mobile : les colonnes passent les unes sous les autres, l'offre Pro s'affiche en premier.

---

## Sections et composants « de style »

Ces images ne sont **pas** des captures des sites cités : ce sont des sections originales dessinées **dans l'esprit** de ces sites, avec le contenu de Lokafête. Source : `styles.html`.

| Fichier | Section de la page | À reprendre |
|---|---|---|
| `sections/solution-descript.png` | Ta solution (section 5) | Rangées alternées texte / visuel produit, numéro + étiquette au-dessus du titre, visuels sur fonds pastel dégradés avec une carte d'interface (devis, calendrier, paiements) |
| `sections/faq-whoop.png` | FAQ (section 13) | Mise en page de Whoop sur **fond clair** : titre géant en majuscules sur 2 couleurs (noir et doré) à gauche avec le lien WhatsApp, accordéon façon Cal.com à droite (carte blanche bordée, séparateurs fins, icônes rondes, question ouverte en doré) |
| `sections/cta-linear.png` | CTA final (section 15) | Fond très sombre, halo doré en haut, grille discrète, titre centré en dégradé blanc → beige, bouton doré + bouton secondaire translucide |
| `sections/wall-of-love.png` | Mur de l'Amour (section 14) | Étiquette « ♥ Mur de l'Amour », mosaïque 3 colonnes, cartes avec avatar, métier, ville, badge de la source (WhatsApp, Facebook, Instagram), photos de réalisations |
| `sections/footer-tally.png` | Pied de page (section 16) | Logo + phrase + « Fait avec ♥ à Cotonou » à gauche, 4 colonnes de liens, ligne du bas avec copyright et icônes sociales |
| `composants/accordion-cal.png` | Composant accordéon (FAQ) | Conteneur blanc bordé et arrondi, séparateurs fins, chevron qui pivote, question ouverte sur fond légèrement grisé |
| `composants/button-cal.png` | Tous les boutons | Variantes : principal doré, sombre, secondaire bordé, discret, avec icône ; 3 tailles ; états survol et désactivé |

**Seul le CTA final a un fond sombre** : toutes les autres sections restent claires, pour que l'appel final ressorte.

Les étoiles et badges de source du Mur de l'Amour ne doivent apparaître qu'avec de vrais avis.
