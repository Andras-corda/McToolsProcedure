# McToolsProcedure — document de spécification

Ce document explique pourquoi le projet est construit comme il l'est, ce qui a été fait, et sur quelle
base. Pour l'installation, voir [README.md](README.md). Pour les évolutions futures, voir
[ROADMAP.md](ROADMAP.md).

## Objectif

Plugin MCreator ajoutant des blocs de procédure supplémentaires pour le générateur Forge 1.20.1, non
fournis nativement, organisés par domaine. Le but n'est pas de tout réinventer : chaque ajout est
vérifié contre les blocs déjà natifs de MCreator pour ne pas dupliquer ce qui existe.

## État actuel

- 153 blocs de procédure, répartis en 21 catégories.
- Les 21 catégories sont regroupées en 5 sous-catégories imbriquées (Math & Texte+, Entités & Combat+,
  Monde & Environnement+, Joueur & Interface+, Données & Logique+).
- Bilingue : l'affichage suit la langue de MCreator (anglais par défaut, français si l'appli est en
  français), comme les blocs natifs.
- Cible : MCreator 2026.2, générateur Forge 1.20.1 uniquement.
- Version du plugin : voir `src/main/resources/plugin.json`.

## Pourquoi cette structure de fichiers

MCreator charge les plugins de deux façons différentes selon le type de fichier, et les deux
contraintes ont été vérifiées directement dans le code source de MCreator plutôt que supposées :

- Les définitions de blocs (`procedures/*.json`) sont indexées par un scan de ressources
  (`ExternalBlockLoader`) qui matche sur le nom de fichier, pas sur l'emplacement exact.
- Les templates de génération de code (`forge-1.20.1/procedures/*.java.ftl`) sont chargés par
  `TemplateGeneratorConfiguration` via un `ClassTemplateLoader` qui résout un **chemin exact**
  (`forge-1.20.1/procedures/<nom_du_bloc>.java.ftl`), sans recherche récursive.

Conséquence : les fichiers réels dans `src/main/resources/` doivent rester à plat. Un bloc dont le
template serait rangé dans un sous-dossier apparaîtrait dans l'éditeur mais ne générerait plus de code
valable. C'est une contrainte du chargeur, pas un choix de rangement.

Pour compenser sans casser le plugin, `by-category/` est un miroir de lecture régénéré par
`tools/build-by-category.js`, qui n'est jamais édité directement.

## Pourquoi des sous-catégories imbriquées

MCreator supporte nativement des catégories imbriquées via un champ `"parent_category"` dans les
fichiers `$categorie.json` (mécanisme utilisé par exemple par ses propres catégories de blocs). Chaque
catégorie enfant pointe vers un `$group_xxx.json` sans parent ; MCreator construit l'arborescence à
l'affichage. Ça ne change ni les blocs ni leur `toolbox_id`, seulement leur rangement visuel.

## Méthode de travail

1. Avant d'écrire un bloc, vérifier s'il existe déjà nativement dans le générateur Forge 1.20.1 de
   MCreator (dépôt `MCreator/Generator-Forge-1.20.1`) pour ne pas dupliquer. Plusieurs lots ont ainsi
   évité des doublons : dégâts avec source, exécuter une commande, valeur d'armure, changer de
   dimension, définir une cible d'IA, pathfinding, niveaux d'XP, tables de loot, tchat/broadcast,
   gravité.
2. Vérifier les signatures Java exactes (noms de méthode, ordre des paramètres) contre le code source
   réel de MCreator ou de Minecraft/Forge plutôt que de les deviner, en particulier pour les API moins
   courantes (boîtes aux lettres de score, barres de boss, avancements).
3. Documenter ce qui est écarté et pourquoi, plutôt que de l'omettre silencieusement (voir ROADMAP.md,
   marqueurs "déjà natif" et "reporté").
4. Garder les fichiers de langue anglais et français strictement synchronisés (mêmes clés).

## Décisions techniques notables

- **Switch/case** : la première version (un bloc unique à 5 zones imbriquées) ne s'affichait pas dans
  MCreator. Remplacée par 3 blocs empilables (`switch`/`case`/`default`), sur le même principe qu'un
  bloc "pour chaque" à une seule zone imbriquée, seul schéma dont le bon fonctionnement était confirmé.
  Finalement retiré (v1.3.0), jugé inutile à l'usage.
- **Liste+** : type Liste/Array générique ajouté via un type de connexion Blockly personnalisé
  (`MTPList`), sans avoir besoin d'enregistrer un nouveau type de variable MCreator. Une liste se
  stocke dans une variable MCreator comme n'importe quelle autre valeur.
- **Sphere Trace** (Scan+) : balayage d'une sphère le long d'un segment, façon Unreal Engine, pour
  détecter blocs/entités sans la limite d'un rayon infiniment fin.
- **Cooldowns et limiteurs de fréquence** : stockés en NBT persistant directement sur l'entité
  concernée (pas de registre global à maintenir).
- **Barre de boss et tableau des scores** : utilisent les registres déjà gérés par le serveur vanilla
  (`CustomBossEvents`, `Scoreboard`) plutôt qu'un état propre au plugin — évite d'avoir à maintenir une
  structure de données qui survivrait aux rechargements.
- **Exécution différée et répétée** : implémentée par ré-ordonnancement successif via
  `MinecraftServer.execute(...)`, sans dépendre d'un event handler enregistré par le plugin.

## Limites assumées

- **Changement de texture générique** (entité/bloc) : impossible avec une ligne de code générique en
  1.20.1 sans classe de rendu dédiée. Le layer du modèle joueur (vanilla, réel) et le recolorage par
  contour lumineux + équipe sont livrés à la place ; `CustomModelData` (voir ROADMAP) est la vraie piste
  pour les objets, mais suppose un resource pack fourni séparément.
- **GUI personnalisé, stockage persistant global, effets caméra/HUD** : nécessitent l'enregistrement
  d'une vraie classe Java au chargement du mod (un `MenuType`, un `SavedData`, un canal réseau). Un
  plugin de blocs JSON pur ne peut pas le faire seul ; il faudrait un "Java plugin" MCreator, catégorie
  de plugin différente et plus lourde que celle-ci.
- **Redimensionner une entité** : pas d'attribut d'échelle générique fiable en 1.20.1 (ajouté en
  1.20.5+).

## Validation

Avant chaque ajout : validité JSON de tous les fichiers de catégories/blocs, correspondance stricte
1-pour-1 entre chaque bloc JSON et son template `.java.ftl`, et parité de clés entre les deux fichiers
de langue. Ces trois vérifications sont systématiques, pas ponctuelles.
