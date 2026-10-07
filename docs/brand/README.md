# Lokafête : icône

Un chapiteau de cérémonie (toit, lambrequin festonné, deux mâts) avec une étincelle de fête, sur fond doré.

| Fichier | Usage |
|---|---|
| `icon.svg` | Icône principale, vectorielle (à privilégier) |
| `icon-dark.svg` | Version sombre (fond noir, chapiteau doré) |
| `icon-512.png` | Grande taille, réseaux sociaux, manifest |
| `icon-192.png` | Application installable (PWA) |
| `icon-180.png` | Icône Apple (écran d'accueil iPhone) |
| `icon-32.png` | Favicon |
| `icon-dark-512.png` | Version sombre en PNG |
| `apercu-icone.png` | Aperçu : tailles, logo avec le nom, onglet, écran de téléphone |

## Pour Claude Code (Next.js)

- Copier `icon.svg` vers `app/icon.svg` et `icon-180.png` vers `app/apple-icon.png` : Next.js les utilise automatiquement comme favicon et icône Apple.
- Utiliser `icon.svg` à côté du mot « Lokafête » dans la barre de navigation et le pied de page, à la place du symbole ✦ des maquettes.
- Couleurs : doré `#c1a26a` (dégradé `#d4b77f` → `#a6874f`), noir `#1a1a1a`, étincelle `#f3e3bd`.
