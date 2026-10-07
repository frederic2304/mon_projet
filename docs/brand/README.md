# Lokafête : icône

Un chapiteau de cérémonie (toit, lambrequin festonné, deux mâts) avec une étincelle de fête, sur fond doré.

| Fichier | Usage |
|---|---|
| `icon.svg` | Icône principale, vectorielle (à privilégier) |
| `icon-dark.svg` | Version sombre (fond noir, chapiteau doré) |
| `icon-512.png` | Grande taille, réseaux sociaux, manifest |
| `icon-192.png` | Application installable (PWA) |
| `icon-180.png` | Icône Apple (écran d'accueil iPhone) |
| `icon-32.png` | Petite icône (32 px) |
| `favicon.ico` | **Favicon** de l'onglet (contient 16, 32 et 48 px) |
| `favicon.svg` | Favicon vectoriel, dessin épaissi pour rester lisible en tout petit |
| `favicon-16.png`, `favicon-32.png`, `favicon-48.png`, `favicon-256.png` | Favicon en PNG |
| `apercu-favicon.png` | Aperçu du favicon en taille réelle et dans un onglet |
| `icon-dark-512.png` | Version sombre en PNG |
| `apercu-icone.png` | Aperçu : tailles, logo avec le nom, onglet, écran de téléphone |

## Pour Claude Code (Next.js)

- Copier `favicon.ico` vers `app/favicon.ico` (remplace celui de Next.js), `favicon.svg` vers `app/icon.svg` et `icon-180.png` vers `app/apple-icon.png` : Next.js les utilise automatiquement.
- Utiliser `icon.svg` à côté du mot « Lokafête » dans la barre de navigation et le pied de page, à la place du symbole ✦ des maquettes.
- Couleurs : doré `#c1a26a` (dégradé `#d4b77f` → `#a6874f`), noir `#1a1a1a`, étincelle `#f3e3bd`.

## Image de partage (Open Graph)

`opengraph-image.png` (1200 × 630 px) s'affiche quand on partage le lien du site sur WhatsApp, Facebook, LinkedIn ou X. `twitter-image.png` est la même image. Source : `og.html`.

Pour Next.js :
- copier `opengraph-image.png` vers `app/opengraph-image.png` et `twitter-image.png` vers `app/twitter-image.png` ;
- ajouter dans `app/layout.tsx` :

```ts
export const metadata = {
  metadataBase: new URL("https://lokafete.com"),
  title: "Lokafête — Gérez vos cérémonies sans stress",
  description: "Réservations, devis, matériel et acomptes MoMo pour les décorateurs, loueurs et traiteurs du Bénin.",
  openGraph: { locale: "fr_BJ", siteName: "Lokafête", type: "website" },
};
```
