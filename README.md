# McToolsProcedure — Plugin MCreator (Forge 1.20.1)

Plugin MCreator 2026.2 qui ajoute **153 blocs de procédure** répartis en **21 catégories**
(`Math+`, `Texte+`, `Entité+`, `Monde+`, `Redstone+`, `UUID+`, `Interface+`, `Scan+`, `Logique+`,
`Données+`, `Debug+`, `Inventaire+`, `Liste+`, `Combat+`, `Dimensions+`, `IA+`, `Loot+`, `Progression+`,
`Permissions+`, `Physique+`, `Planification+`), générés pour le générateur **Forge 1.20.1**. L'affichage
**suit la langue de MCreator** : français si l'appli est en français, anglais sinon.

Voir [`ROADMAP.md`](ROADMAP.md) pour la feuille de route complète (ce qui est fait, ce qui reste ★★/★).

Voir [`McToolsProcedure_Blocs.md`](McToolsProcedure_Blocs.md) pour la liste complète et détaillée des blocs.

## Structure du dossier

```
McToolsProcedure/
├── src/main/resources/          ← LES VRAIS FICHIERS chargés par MCreator (à plat, obligatoire)
│   ├── plugin.json
│   ├── procedures/              ← définitions JSON des blocs + des 12 catégories ($xxx.json)
│   ├── forge-1.20.1/procedures/ ← templates Freemarker (.java.ftl) qui génèrent le vrai code Java
│   └── lang/                    ← traductions (suit la langue de MCreator)
├── by-category/                 ← VUE DE NAVIGATION générée, un sous-dossier par catégorie
│   ├── math/  text/  entity/  world/  redstone/  uuid/  gui/  scan/  logic/  data/  debug/  inventory/  list/
│   └── (chaque bloc y apparaît en paire lisible : nom_du_bloc.json + nom_du_bloc.java.ftl)
└── tools/build-by-category.js   ← régénère by-category/ après une modification
```

⚠️ **Pourquoi les vrais fichiers restent à plat** : je suis allé vérifier directement dans le code
source de MCreator (`TemplateGeneratorConfiguration.java`) comment il charge les templates de
génération de code — il les cherche par **chemin exact** (`forge-1.20.1/procedures/nom_du_bloc.java.ftl`),
sans recherche récursive dans des sous-dossiers. Ranger ces fichiers dans des sous-dossiers casserait
la génération de code (le bloc apparaîtrait dans MCreator mais son code ne se génèrerait plus).

**`by-category/` est donc une vue de lecture/navigation**, régénérée à partir des vrais fichiers.
Pour modifier un bloc : édite-le dans `src/main/resources/`, puis relance :

```bash
node tools/build-by-category.js
```

## Installation — méthode rapide (sans Gradle)

1. Ouvre le dossier `src/main/resources/`.
2. Sélectionne **tout son contenu** (`plugin.json`, `procedures/`, `forge-1.20.1/`, `lang/`) et compresse-le en `.zip`
   (le fichier `plugin.json` doit être **à la racine** du zip, pas dans un sous-dossier).
3. Renomme le zip en `mctoolsprocedure.zip`.
4. Copie-le dans `%USERPROFILE%\.mcreator\plugins\` **ou** installe-le depuis
   MCreator → *File* → *Preferences* → *Plugins* → *Install plugin from file*.
5. Redémarre MCreator. Les nouveaux blocs apparaissent dans l'éditeur de procédures.

## Installation — via Gradle (pour développer / modifier le plugin)

```bash
./gradlew install
```

(nécessite un JDK 21 ; la tâche `install` construit le zip et le copie automatiquement
dans `~/.mcreator/plugins/`).

## Compatibilité

- **MCreator** : 2026.2 (`supportedversions` dans `plugin.json`, à élargir si besoin pour d'autres versions)
- **Générateur** : Forge 1.20.1 uniquement (dossier `forge-1.20.1/procedures/`)
- **Langue** : suit la langue de l'application MCreator — `lang/texts.properties` (anglais, utilisé si
  MCreator n'est pas réglé sur le français) et `lang/texts_fr_FR.properties` (français, utilisé
  automatiquement si l'appli est en français), comme pour n'importe quel bloc natif de MCreator.

## Changelog

- **v1.0.0** : 24 blocs (Math+, Texte+, Monde+, Interface+, un `switch/case` qui ne s'affichait pas).
- **v1.1.0** : `switch/case` remplacé par 3 blocs empilables. Ajout raycast (3), redstone (3), glow/équipe (2), layer joueur (1).
- **v1.2.0** : ajout try/catch (2), délai (1), sphères (3), colliders (4), UUID (4).
- **v1.3.0** : retrait du `switch`/`case`/`default` (jugé inutile à l'usage).
- **v2.0.0** (ce dossier, `McToolsProcedure`) :
  - Renommage complet du projet et réorganisation en **9 catégories** dédiées (au lieu de 5) :
    Math+, Texte+, **Entité+**, Monde+, **Redstone+**, **UUID+**, Interface+, **Scan+**, Logique+.
  - Ajout de 3 blocs **Sphere Trace** façon Unreal Engine dans Scan+ (voir le markdown).
  - Ajout de `by-category/`, une vue de navigation par dossier, et du script qui la régénère.
- **v2.0.1** : l'affichage suit désormais la langue de MCreator (anglais par défaut, français si l'appli
  est en français) au lieu d'imposer le français partout.
- **v2.1.0** : premier lot ★★★ de la feuille de route ([ROADMAP.md](ROADMAP.md)) — 39 blocs ajoutés :
  - **Math+** : nombre aléatoire (int/float), trigonométrie en degrés (sin/cos/tan/atan2) — 6 blocs
  - **Texte+** : majuscule/minuscule/capitalize, longueur, position, trim — 6 blocs
  - **Entité+** : % de vie, NBT complet en texte, tags custom, monter/descendre — 8 blocs
  - **Monde+** : hauteur du terrain, météo (pluie/orage/beau temps) — 2 blocs
  - **UUID+** : nom ↔ UUID pour les joueurs connectés — 2 blocs
  - **Interface+** : barre de boss, tableau des scores (sidebar) — 4 blocs
  - **Scan+** : cône de vision, distance jusqu'au sol — 2 blocs
  - **Logique+** : système de cooldown complet, boucle sécurisée — 4 blocs
  - **Données+** *(nouvelle catégorie)* : stockage persistant clé/valeur par joueur — 2 blocs
  - **Debug+** *(nouvelle catégorie)* : log console avec étiquette — 1 bloc
  - **Inventaire+** *(nouvelle catégorie)* : compter un item, vérifier la place libre — 2 blocs
- **v2.2.0** : ajout de **Liste+** *(nouvelle catégorie, 17 blocs)* — un vrai type Liste/Array pour les
  procédures : créer une liste vide, ajouter/retirer/vider, taille, contient, index de, lire/écrire un
  élément (nombre/texte/entité/booléen), convertir en texte, boucle "pour chaque élément". Les listes se
  stockent normalement dans une variable MCreator comme n'importe quelle autre valeur.
- **v2.3.0** : premier tour ★★ (33 blocs) — min/max, easing, vecteurs, couleurs (Math+) ; starts/ends
  with, parsing sécurisé, couleur de texte (Texte+) ; yaw, IA on/off, entité la plus proche par tag
  (Entité+) ; avancer le temps, remplir une zone, biome (Monde+) ; conducteur redstone (Redstone+) ;
  tab list (Interface+) ; joueur le plus proche dans le champ de vision (Scan+) ; choix pondéré, rate
  limiter (Logique+) ; transférer/trier l'inventaire, enchantement, durabilité (Inventaire+) ; commande
  et benchmark (Debug+) ; nouvelle catégorie **Combat+** (immunité au feu). Plusieurs idées de la
  feuille de route se sont avérées déjà natives dans MCreator (dégâts avec source, exécuter une
  commande, valeur d'armure, effet de potion avancé) — non dupliquées, voir [ROADMAP.md](ROADMAP.md).
- **v2.4.0** : "tour 2" (15 blocs, 7 nouvelles catégories) — **Dimensions+** (téléporter vers une
  position précise dans une autre dimension, téléportation sûre) ; **IA+** (fuir/suivre une entité) ;
  **Loot+** (livre enchanté aléatoire) ; **Progression+** (donner/retirer un avancement, point de
  réapparition) ; **Permissions+** (OP ?, niveau de permission) ; **Physique+** (trajectoire de
  projectile, explosion sans dégât de bloc) ; **Planification+** (minuterie répétée annulable). Là
  aussi, beaucoup de doublons natifs détectés et évités (changer de dimension, définir une cible,
  pathfinding, niveaux d'XP, tables de loot, tchat/broadcast, gravité) — voir [ROADMAP.md](ROADMAP.md).
