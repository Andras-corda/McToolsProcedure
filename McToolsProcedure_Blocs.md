# McToolsProcedure — Liste des blocs de procédure (MCreator 2026.2 / Forge 1.20.1)

Plugin : **McToolsProcedure** (`id: mctoolsprocedure`, version `2.0.0`)
**49 blocs** de procédure répartis en **9 catégories** dans l'éditeur de procédures de MCreator,
entièrement en français.

---

## 🔢 Math+ (`math`) — 6 blocs

Purs calculs Java, sans dépendance au monde : utilisables dans **n'importe quelle** procédure.

| Bloc | Description | Entrées | Sortie |
|---|---|---|---|
| **Limiter (clamp)** | Force une valeur à rester entre un minimum et un maximum | value, min, max (Nombre) | Nombre |
| **Interpolation linéaire (lerp)** | Calcule une valeur intermédiaire entre `a` et `b` selon un facteur `t` (0 à 1) | a, b, t (Nombre) | Nombre |
| **Convertir une plage (map range)** | Convertit une valeur d'une plage `[in_min, in_max]` vers une autre `[out_min, out_max]` | value, in_min, in_max, out_min, out_max (Nombre) | Nombre |
| **Arrondir aux décimales** | Arrondit un nombre à N décimales | value, decimals (Nombre) | Nombre |
| **Distance 3D** | Distance euclidienne entre deux points (x,y,z) | x1,y1,z1,x2,y2,z2 (Nombre) | Nombre |
| **Pourcentage** | Calcule le pourcentage de `value` par rapport à `max` | value, max (Nombre) | Nombre |

---

## 🔤 Texte+ (`text`) — 6 blocs

Manipulation de chaînes en pur Java, aucune dépendance non plus.

| Bloc | Description | Entrées | Sortie |
|---|---|---|---|
| **Contient** | Vérifie si un texte contient un sous-texte | text, search (Texte) | Booléen |
| **Remplacer** | Remplace toutes les occurrences d'un texte par un autre | text, target, replacement (Texte) | Texte |
| **Partie découpée (split)** | Découpe un texte selon un séparateur et renvoie la partie n° *index* | text, delimiter (Texte), index (Nombre) | Texte |
| **Compléter avec des zéros** | Formate un nombre avec des zéros devant (ex: `007`) | number, length (Nombre) | Texte |
| **Ticks → temps** | Convertit des ticks Minecraft (20/s) en `mm:ss` | ticks (Nombre) | Texte |
| **Répéter** | Répète un texte N fois | text (Texte), count (Nombre) | Texte |

---

## 🧍 Entité+ (`entity`) — 11 blocs

Tout ce qui agit sur une entité précise (position, physique, apparence, collision entre entités).

| Bloc | Type | Description | Entrées |
|---|---|---|---|
| **Distance entre 2 entités** | Valeur (Nombre) | Distance réelle entre deux entités |  entity1, entity2 |
| **Faire regarder vers une entité** | Action | Oriente le regard d'une entité vivante vers une cible | entity, target |
| **Ajouter une vélocité** | Action | Ajoute un vecteur de vitesse (dx,dy,dz) à une entité existante | entity, dx,dy,dz |
| **Repousser (knockback)** | Action | Applique un recul avec force et direction à une entité vivante | entity, strength, dx, dz |
| **Activer le contour lumineux (glow)** | Action | Active/désactive l'effet "Lueur" sans passer par une potion | entity, glowing (Booléen) |
| **Couleur d'équipe (scoreboard)** | Action | Crée/récupère une équipe et lui applique une couleur — pilote la couleur du glow de ses membres (effet "reskin" visuel) | teamname, couleur |
| **Entité dans une sphère ?** | Valeur (Booléen) | Vraie sphère (distance au centre) | entity, x,y,z (centre), radius |
| **Compter les entités dans une sphère** | Valeur (Nombre) | Version sphérique exacte du comptage d'entités | x,y,z, radius |
| **Deux entités en collision ?** | Valeur (Booléen) | Compare les hitbox réelles (AABB) de deux entités | entity1, entity2 |
| **Entité en collision avec une boîte ?** | Valeur (Booléen) | Teste la hitbox d'une entité contre une boîte définie par 2 coins | entity, x1,y1,z1, x2,y2,z2 |
| **Point dans la hitbox d'une entité ?** | Valeur (Booléen) | Vérifie si un point (x,y,z) tombe dans la hitbox d'une entité | entity, x,y,z |

---

## 🌍 Monde+ (`world`) — 6 blocs

Ce qui agit sur le monde/le terrain lui-même (pas une entité précise).

| Bloc | Type | Description | Entrées |
|---|---|---|---|
| **Bloc relatif** | Valeur (MCItemBlock) | Récupère le bloc à une position décalée (dx,dy,dz) d'une position donnée | x,y,z,dx,dy,dz |
| **Compter les entités dans un cube** | Valeur (Nombre) | Version cubique (boîte) du comptage d'entités par rayon | x,y,z, radius |
| **Boîte en collision avec le terrain ?** | Valeur (Booléen) | Vérifie si une zone (2 coins) touche un bloc solide — utile avant de téléporter/faire apparaître en sécurité | x1,y1,z1, x2,y2,z2 |
| **Ligne de particules** | Action | Trace une ligne de particules entre deux points (12 particules au choix) | type de particule, x1,y1,z1,x2,y2,z2, nb de points |
| **Cercle de particules** | Action | Trace un cercle horizontal de particules autour d'un centre | type de particule, x,y,z,radius, nb de points |
| **Bloc présent dans une sphère ?** | Valeur (Booléen) | Parcourt une sphère de rayon donné et vérifie si un type de bloc précis y est présent | block, x,y,z (centre), radius |

---

## 🔌 Redstone+ (`redstone`) — 3 blocs

MCreator propose déjà en natif "signal redstone direct", "signal indirect" et "bloc alimenté ?"
(donc pas dupliqués ici). Ce qui manquait a été ajouté :

| Bloc | Description | Entrées |
|---|---|---|
| **Mettre à jour le circuit redstone** | Force une mise à jour redstone (fils, comparateurs, pistons…) à une position — utile après avoir changé soi-même l'état d'un bloc custom | x,y,z |
| **Signal de comparateur** | Signal analogique (0-15) émis par un bloc comme s'il était lu par un comparateur (coffre, four…) | x,y,z |
| **Programmer une mise à jour de bloc** | Programme un "tick" différé sur un bloc (façon bouton/plaque de pression/torche redstone) : signal redstone à impulsion | x,y,z, delay (ticks) |

---

## 🆔 UUID+ (`uuid`) — 4 blocs

| Bloc | Description | Entrées | Sortie |
|---|---|---|---|
| **UUID d'une entité** | Renvoie l'UUID (identifiant unique) d'une entité sous forme de texte | entity | Texte |
| **Entité depuis un UUID** | Retrouve l'entité correspondant à un UUID donné, dans le monde | uuid (Texte) | Entité |
| **Comparer deux UUID** | Compare deux UUID (texte) en ignorant la casse | uuid1, uuid2 (Texte) | Booléen |
| **Générer un UUID aléatoire** | Crée un UUID aléatoire — pratique pour identifier soi-même des objets/données custom | — | Texte |

Les UUID sont manipulés comme du **texte** (pas de type UUID dédié dans Blockly) : stocke-les
par exemple dans une variable texte ou en NBT.

---

## 🖥️ Interface+ (`gui`) — 4 blocs

Communication avec le joueur (paquets réseau vanilla) et apparence du modèle joueur.

| Bloc | Description | Entrées |
|---|---|---|
| **Message barre d'action** | Envoie un texte dans la barre d'action (au-dessus des barres de vie/faim) | player, text |
| **Titre avancé** | Affiche un titre + sous-titre avec un contrôle précis des durées d'apparition/maintien/disparition (en ticks) | player, title, subtitle, fadein, stay, fadeout |
| **Donner un objet avec NBT** | Donne un objet au joueur en lui appliquant des données NBT personnalisées (texte NBT brut) | player, item, nbt |
| **Layer du modèle joueur** | Affiche/masque une des 7 couches du skin vanilla (cape, veste, manches, jambes, chapeau) — l'option "Personnaliser le skin" du menu joueur, pilotée par le serveur | player, layer (liste), visible |

**Note technique sur le layer joueur** : le champ vanilla qui stocke ces 7 bits
(`DATA_PLAYER_MODE_CUSTOMISATION`) n'est pas public dans le code de Minecraft — le bloc y accède par
**réflexion Java**, entourée d'un `try/catch` qui le rend silencieusement inopérant si jamais cet accès
venait à être bloqué sur une installation particulière.

---

## 🎯 Scan+ (`scan`) — 6 blocs

Raycasts (**Line Trace**) et balayages sphériques (**Sphere Trace**), comme dans Unreal Engine.

### Line Trace (rayon fin, façon regard vanilla)

| Bloc | Description | Entrées | Sortie |
|---|---|---|---|
| **Bloc touché par un rayon** | Lance un vrai rayon entre 2 points et renvoie le premier bloc solide touché | entity (contexte), x1,y1,z1, x2,y2,z2 | Bloc |
| **Ligne de vue bloquée ?** | Indique si un bloc solide coupe la ligne entre 2 points | entity, x1,y1,z1, x2,y2,z2 | Booléen |

### Sphere Trace (balayage d'une sphère le long d'une ligne — comme `SphereTraceSingle`/`SphereTraceMulti` dans Unreal)

Au lieu d'un rayon infiniment fin, on fait glisser une **sphère de rayon R** le long du segment
`(x1,y1,z1) → (x2,y2,z2)` : tout ce qui touche cette sphère à un moment du trajet est détecté. Utile pour
des tirs "épais" (boules de feu, faisceaux, zones d'effet mobiles) qui ne doivent pas rater leur cible à
cause d'un rayon trop fin.

| Bloc | Style Unreal | Description | Sortie |
|---|---|---|---|
| **Entité la + proche touchée par la sphère** | `SphereTraceSingle` (entité) | Renvoie l'entité la plus proche du point de départ touchée par le balayage | Entité |
| **Bloc le + proche touché par la sphère** | `SphereTraceSingle` (bloc) | Renvoie le premier bloc solide non-air touché par le balayage | Bloc |
| **Nombre d'entités touchées par la sphère** | `SphereTraceMulti` (entités) | Compte toutes les entités touchées le long du trajet | Nombre |
| **Nombre de blocs touchés par la sphère** | `SphereTraceMulti` (blocs) | Compte toutes les positions de bloc non-air touchées le long du trajet | Nombre |

Tous les blocs Sphere Trace prennent `x1,y1,z1, x2,y2,z2, radius` en entrée (+ dépendent du monde).

⚠️ **Coût de calcul** : les blocs "bloc" parcourent un volume ≈ `(2×rayon+2)³` positions — reste rapide
jusqu'à un rayon d'une dizaine de blocs, à éviter en boucle serrée (chaque tick) avec un grand rayon.

---

## 🧠 Logique+ (`logic`) — 3 blocs

Try/catch et exécution différée — pas demandés dans la liste de catégories, gardés car toujours utiles.

| Bloc | Description |
|---|---|
| **Essayer (console)** | Exécute les actions imbriquées ; toute erreur/exception est interceptée et écrite dans la **console du serveur** au lieu de faire planter toute la procédure. |
| **Essayer (tchat)** | Pareil, mais envoie en plus un message d'erreur lisible dans le **tchat Minecraft** du joueur choisi. |
| **Attendre puis exécuter** | Exécute les actions imbriquées après un délai en **ticks** (20 = 1s), sans bloquer le serveur entre-temps. |

---

## Notes techniques générales

- `Convertir une plage` (map range) renvoie une valeur infinie/NaN si `in_min == in_max`.
- `Attendre puis exécuter` : les entités/objets capturés au moment où le délai démarre peuvent avoir
  disparu à l'échéance — combinable avec un bloc *Essayer* pour se prémunir des erreurs.
- Le "changement de texture" d'entité/bloc générique n'est **pas** livré : Minecraft ne permet pas de
  changer la texture d'un élément à la volée avec une ligne de code générique (elle dépend de la classe
  de rendu propre à chaque élément, fixée à la compilation). Ce qui est réellement possible et livré :
  le layer du joueur (Interface+, vanilla réel) et le recolorage par glow + équipe (Entité+, visuel).
  Pour un mob/bloc personnalisé à plusieurs textures, utilise la fonctionnalité native de MCreator
  prévue pour ça (case "textures multiples" à la création de l'élément).
