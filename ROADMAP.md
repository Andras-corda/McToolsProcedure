# McToolsProcedure — Feuille de route complète

Tout ce que je peux ajouter/améliorer pour que ce plugin devienne une vraie boîte à outils complète.
Classé par catégorie existante, puis nouvelles catégories proposées, puis améliorations transverses.
Priorité : ★★★ (très utile, quasi indispensable) · ★★ (solide plus-value) · ★ (confort/niche).

**Statut : ★★★ fait (v2.1.0), Liste+ ajouté sur demande (v2.2.0), un premier tour de ★★ fait (v2.3.0,
32 blocs + catégorie Combat+).** Les lignes ✅ sont livrées ; les lignes 🚫 ont été volontairement
écartées (déjà natives dans MCreator, ou pas fiablement faisable en 1.20.1) — voir la raison à côté.

---

## 🔢 Math+ — à compléter

- ✅ ~~**Nombre aléatoire dans une plage** (int/float)~~ → `math_random_int`, `math_random_float`
- ✅ ~~**Trigonométrie en degrés** (sin, cos, tan, atan2)~~ → `math_sin/cos/tan/atan2_degrees`
- ✅ ~~**Min / Max**~~ → `math_min`, `math_max` (chaîne-les pour 3+ valeurs)
- ✅ ~~**Fonctions d'easing**~~ → `math_ease_in/out/in_out_quad`
- ✅ ~~**Opérations vectorielles 3D** (longueur, produit scalaire)~~ → `math_vector_length`, `math_vector_dot` (produit vectoriel pas encore fait)
- ★ **PGCD / PPCM**, **opérations binaires** (AND/OR/XOR/décalage)
- ✅ ~~**Conversion couleur** (hex/int ↔ RGB)~~ → `math_color_rgb_to_int`, `math_color_int_to_r/g/b` (HSV pas encore fait)
- ★ **Bruit de Perlin/Simplex 2D** (génération procédurale, terrain custom)

## 🔤 Texte+ — à compléter

- ✅ ~~**Majuscule / minuscule / première lettre en majuscule**~~ → `text_uppercase/lowercase/capitalize`
- ✅ ~~**Longueur d'un texte**, **contient à une position (indexOf)**~~ → `text_length`, `text_index_of`
- ✅ ~~**Nettoyer les espaces (trim)**~~ → `text_trim`
- ✅ ~~**Commence par / se termine par**~~ → `text_starts_with`, `text_ends_with`
- ✅ ~~**Analyse sécurisée nombre↔texte**~~ → `text_to_number_safe`
- ✅ ~~**Ajouter une couleur (§) à un texte**~~ → `text_add_color_code` (16 couleurs) — un vrai Component riche (gras/italique/hover/click) reste à faire, plus complexe
- ★ **Retirer les codes couleur (§)** d'un texte
- ★ **Expression régulière** : correspond / remplacer par regex
- ★ **Encoder/décoder en Base64**

## 🧍 Entité+ — à compléter

- ✅ ~~**Pourcentage de vie**~~ → `entity_health_percentage`
- ✅ ~~**NBT persistant complet**~~ → `entity_get_nbt_text`, `entity_set_nbt_text`
- ✅ ~~**Ajouter/retirer un tag custom**, **a le tag ?**~~ → `entity_add_tag`, `entity_remove_tag`, `entity_has_tag`
- ✅ ~~**Monter/démonter une entité**~~ → `entity_ride`, `entity_dismount`
- ✅ ~~**Obtenir le yaw**~~ → `entity_get_yaw` (le pitch existe déjà nativement dans MCreator)
- 🚫 **Infliger des dégâts avec une source personnalisée** — déjà natif dans MCreator (blocs `Dégâts` + `Source de dégât`)
- ✅ ~~**Activer/désactiver l'IA d'une entité**~~ → `entity_set_ai_enabled`
- 🚫 **Redimensionner une entité** — pas d'attribut d'échelle générique fiable en 1.20.1 (ajouté seulement en 1.20.5+), nécessiterait un mixin/renderer custom, hors de portée d'un plugin de blocs
- ✅ ~~**Entité la plus proche par tag dans un rayon**~~ → `entity_nearest_by_tag`
- ★ **Immunité au feu temporaire**, **entité au sol ?**

## 🌍 Monde+ — à compléter

- ✅ ~~**Hauteur du terrain à une position (x,z)**~~ → `world_get_terrain_height`
- ✅ ~~**Météo** : forcer pluie/orage/beau temps avec durée~~ → `world_set_weather`
- ✅ ~~**Avancer l'heure du monde**~~ → `world_advance_time`
- ✅ ~~**Remplir une zone de blocs**~~ → `world_fill_zone` (plafonné à 262 144 blocs par appel pour éviter tout freeze serveur)
- ⏸️ **Est-ce un village/une structure à proximité ?** — reporté : l'API de recherche de structures a changé plusieurs fois depuis 1.19 (Holder/TagKey), je préfère vérifier plus précisément avant de livrer quelque chose de fiable
- ⏸️ **Copier/coller une zone de blocs** — reporté, mini-système de schématique à concevoir proprement (plus gros morceau)
- ✅ ~~**Biome à une position**~~ → `world_get_biome_name` (température/humidité pas encore fait)
- ★ **Gamerule get/set**, **difficulté get/set**
- ★ **Bordure du monde get/set**
- ★ **Explosion personnalisée sans dégât de bloc** (juste l'effet visuel/dégât d'entités)

## 🔌 Redstone+ — à compléter

- ✅ ~~**Le bloc est-il un conducteur redstone ?**~~ → `redstone_is_conductor`
- ★ **Simuler l'affaiblissement du signal sur une distance** (façon fil redstone)
- ★ **Créer une horloge redstone virtuelle** (callback périodique tant qu'une condition est vraie)

## 🆔 UUID+ — à compléter

- ✅ ~~**Nom de joueur → UUID** et **UUID → nom de joueur**~~ → `uuid_name_to_uuid`, `uuid_uuid_to_name` (joueurs connectés uniquement)
- ★★ **Stocker/lire une valeur arbitraire liée à un UUID** — voir *Données+*, déjà couvert par joueur

## 🖥️ Interface+ (Gui) — à compléter

- ✅ ~~**Barre de progression (Boss Bar)**~~ → `gui_bossbar_set`, `gui_bossbar_remove`
- ✅ ~~**Tableau des scores (sidebar scoreboard)**~~ → `gui_scoreboard_set_sidebar_line`, `gui_scoreboard_remove`
- ✅ ~~**En-tête / pied de la liste des joueurs (tab list)**~~ → `gui_set_tab_list`
- ⏸️ **Toast d'avancement personnalisé** — reporté : nécessite soit un faux avancement, soit un paquet réseau custom, complexité/incertitude trop élevée pour ce lot
- ⏸️ **Ouvrir un GUI custom (menu/coffre)** — reporté : nécessite d'enregistrer un vrai `MenuType` au chargement du mod, ce qu'un plugin de blocs de procédure ne peut pas faire seul (il faudrait un "Java plugin" MCreator, une autre catégorie de plugin plus lourde)
- ★ **Texte cliquable/survolable** (lié au Component riche de Texte+)

## 🎯 Scan+ — à compléter

- ✅ ~~**Cône de vision**~~ → `scan_vision_cone`
- ✅ ~~**Hauteur du sol sous un point (raycast vertical)**~~ → `scan_downward_trace_distance`
- 🚫 **Box Trace** — le Sphere Trace déjà livré couvre le même besoin pratique (détection "épaisse" le long d'un trajet) ; une vraie forme rectangulaire ajoute de la complexité pour un gain marginal, laissé de côté
- ✅ ~~**Joueur le plus proche dans le champ de vision d'une entité**~~ → `scan_nearest_player_in_view`
- ★ **Trace multiple en éventail** (plusieurs rayons parallèles/en cône, façon fusil à pompe)

## 🧠 Logique+ — à compléter

- ✅ ~~**Cooldown / Temporisation par clé**~~ → `logic_start_cooldown`, `logic_is_on_cooldown`, `logic_cooldown_remaining`
- ✅ ~~**Boucle "pour" sécurisée avec limite d'itérations**~~ → `logic_safe_repeat`
- ✅ ~~**Choix aléatoire pondéré**~~ → `logic_weighted_random_index` (prend une liste **Liste+** de poids)
- ✅ ~~**Limiteur de fréquence**~~ → `logic_rate_limit_ready`
- ★ **Petit stockage clé-valeur en mémoire** (dictionnaire texte→valeur, temporaire, sans passer par NBT)

---

## 📦 Nouvelles catégories

### Inventaire+ (`inventory`)
- ✅ ~~Compter un item précis dans tout l'inventaire~~ → `inventory_count_item`
- ✅ ~~Vérifier qu'il reste de la place dans l'inventaire~~ → `inventory_has_space`
- ✅ ~~Transférer des items entre deux inventaires~~ → `inventory_transfer_item`
- ✅ ~~Trier un inventaire~~ → `inventory_sort`
- ✅ ~~Ajouter/vérifier le niveau d'un enchantement~~ → `inventory_add_enchantment_held`, `inventory_get_enchantment_level_held` (limité à l'objet en main, voir note) — retirer un enchantement existe déjà nativement (`itemstack_remove_specific_enchantment`)
- ✅ ~~Durabilité : pourcentage restant~~ → `inventory_get_durability_percentage_held` (lire/modifier la valeur brute existe déjà nativement)
- ★ Vider un inventaire entier

### Données+ (`data`) — persistance
- ✅ ~~**Stockage persistant par joueur**~~ → `data_set_player_value`, `data_get_player_value`
- 🚫 **Stockage persistant global au monde** — nécessiterait une vraie classe `SavedData` enregistrée au chargement du mod (comme pour le GUI custom, hors de portée d'un plugin de blocs JSON pur) ; le stockage par joueur déjà livré couvre déjà la grande majorité des usages réels
- ★ Export/lecture d'un compound NBT complet en une fois (lié au NBT complet d'Entité+)

### Debug+ (`debug`)
- ✅ ~~**Afficher une valeur dans la console avec une étiquette**~~ → `debug_log`
- 🚫 **Exécuter une commande** — déjà natif dans MCreator (`execute_command` / `entity_execute_command`)
- ✅ ~~**Mesurer le temps d'exécution** d'un bloc d'actions~~ → `debug_benchmark`
- ★ **TPS / mémoire serveur actuels**

### Combat+ (`combat`) *(nouvelle catégorie, créée dans ce lot)*
- 🚫 **Pourcentage d'armure** — la valeur brute d'armure existe déjà nativement (`entity_armor_value`, 0 à 20)
- 🚫 **Appliquer un effet de potion avec contrôle fin** — déjà quasi entièrement natif (`entity_add_potion_advanced` gère durée/niveau/ambiant/particules) ; seule la visibilité de l'icône manque, jugé too marginal pour un bloc dédié
- ✅ ~~**Immunité au feu**~~ → `combat_is_fire_immune` (immunité à d'autres types de dégâts trop incertaine niveau API, reportée)
- ★ **Distance d'aggro / de perte de cible** utilitaires pour IA custom

---

## 🛠️ Améliorations transverses (pas de nouveaux blocs, mais qualité du plugin)

- ★★★ **Icônes personnalisées** sur les blocs les plus utilisés (actuellement aucun bloc n'a d'icône ; MCreator le permet via `field_image`) — repérage visuel bien plus rapide dans une longue liste — *pas encore fait, prochain sur la liste*
- ★★ **Fusionner/nettoyer les doublons** : le comptage d'entités existe en version "cube" (Monde+) et "sphère" (Entité+) — garder les deux ou déprécier le cube ?
- ★★ **`toolbox_init` par défaut** sur davantage de blocs (pré-remplir x/y/z avec les blocs "coordonnée du bloc actuel", comme le fait MCreator nativement) — gain de temps à l'usage
- ★ **Régénérer un aperçu visuel** (captures d'écran) pour la page du plugin si publié sur mcreator.net
- ★ **Fichier `CHANGELOG.md` séparé** du README, pour ne pas alourdir la doc principale

---

## 🆕 Idées supplémentaires (tour 2) — nouveaux domaines pas encore couverts

Tout ce qui suit n'existe encore dans aucune catégorie du plugin, contrairement à la première liste
qui complétait l'existant. Classé par nouveau domaine, avec proposition de catégorie MCreator.

### 🌀 Dimensions+ (`dimension`) ✅ fait
- ✅ ~~**Téléporter vers une dimension à une position précise**~~ → `dimension_teleport_to_position` (le natif `entity_switch_dimension` garde les mêmes coordonnées, celui-ci en vise de nouvelles)
- ✅ ~~**Téléportation sûre**~~ → `dimension_safe_teleport` (se cale sur le point le plus haut solide)
- 🚫 **Nom/id de la dimension actuelle** — déjà natif (`entity_dimension_id`, `get_dimensionid`, etc.)
- ★ **La dimension existe-t-elle ?** (optionnel, non fait)

### 🎁 Loot & Recettes+ (`loot`) ✅ fait
- 🚫 **Obtenir le résultat d'une table de loot** — déjà natif (`loot_table_foreach`, `entity_loot_table_foreach`, `world_loot_table_foreach`)
- 🚫 **Une recette est-elle débloquée ?** — déjà natif (`entity_has_recipe`, `entity_add_recipe`, `entity_remove_recipe`)
- ✅ ~~**Donner un livre enchanté aléatoire**~~ → `loot_random_enchanted_book`
- ★ Débloquer/verrouiller une recette manuellement (déjà couvert par les blocs natifs ci-dessus)

### 🧟 IA & Comportement+ (`ai`) ✅ fait
- ✅ ~~**Faire fuir une entité loin d'une autre**~~ → `ai_flee_from_entity`
- 🚫 **Définir la cible d'attaque d'un mob** — déjà natif (`entity_set_target`, `entity_gettargetentity`)
- ✅ ~~**Faire suivre une entité une autre**~~ → `ai_follow_entity`
- 🚫 **Pathfinding vers une position précise** — déjà natif (`entity_pathfind_to`)
- ★ Faire fuir loin d'une position (pas seulement une entité) — non fait

### 🏆 Progression+ (`progression`) ✅ fait
- ✅ ~~**Donner/retirer un avancement personnalisé**~~ → `progression_grant_advancement`, `progression_revoke_advancement`
- 🚫 **Niveaux d'XP** — déjà natif (`entity_add_xp_level`, `entity_remove_xp_level`)
- ✅ ~~**Point de réapparition**~~ → `progression_set_respawn_point` (lecture x/y/z pas encore faite)
- ★ Compteur de statistique custom — non fait

### 💬 Communication+ (`chat`) 🚫 domaine entier déjà natif
- 🚫 **Diffuser un message à tous** — déjà natif (`world_send_chat`)
- 🚫 **Message privé à un joueur** — déjà natif (`entity_send_chat`, avec option barre d'action)
- ★ Texte traduit (clé i18n) — non fait, niche

### ⏱️ Planification avancée+ (`schedule`) ✅ fait
- ✅ ~~**Minuterie répétée annulable**~~ → `schedule_repeat_while` + `schedule_stop_repeating`
- ★ Nombre de jours écoulés depuis la création du monde — non fait
- ★ Est-ce exactement l'aube/le crépuscule ? — non fait

### 🎥 Effets caméra & HUD+ (`camera`) ⏸️ domaine entier reporté
- ⏸️ **Secousse de caméra**, **flash plein écran**, **zoom/FOV** — tout ce domaine nécessite un vrai
  canal réseau (paquet client custom + gestionnaire côté client), ce qu'un plugin de blocs JSON pur ne
  peut pas enregistrer seul (même limite que le GUI custom et le stockage global) ; nécessiterait un
  "Java plugin" MCreator, un projet plus lourd

### 🔒 Sécurité & Permissions+ (`permission`) ✅ fait
- ✅ ~~**Le joueur est-il opérateur ?**, **niveau de permission**~~ → `permission_is_op`, `permission_has_level`
- ★ Whitelist / liste de bannissement — non fait

### 🧮 Physique avancée+ (`physics`) ✅ fait
- ✅ ~~**Trajectoire parabolique**~~ → `physics_calc_launch_speed_for_height`, `physics_calc_time_to_apex` (version simplifiée : hauteur/temps, pas encore l'angle/distance complets)
- ✅ ~~**Force d'explosion sans dégât de bloc**~~ → `physics_explosion_no_block_damage`
- 🚫 **Activer/désactiver la gravité** — déjà natif (`entity_set_nogravity`, `entity_has_nogravity`)

---

## Suite

Le tour ★★ de la première liste ET le "tour 2" (9 domaines) sont terminés — faits, déjà natifs, ou
reportés avec raison documentée à chaque fois. Reste :
- Les points reportés faute d'infrastructure (structures, copier/coller de zone, GUI custom, stockage
  global, effets caméra/HUD) — tous nécessitent un vrai "Java plugin" MCreator (classe Java compilée
  et enregistrée au chargement du mod), une catégorie de plugin différente et plus lourde que celle-ci ;
  je ne les ferai que si tu confirmes vouloir franchir cette étape.
- Les nombreux ★ (confort/niche) laissés de côté dans chaque section ci-dessus.
- Les **icônes personnalisées sur les blocs** (amélioration transverse ★★★ jamais faite).

Dis-moi si tu veux que je continue sur les ★ restants, les icônes, ou qu'on s'arrête là pour l'instant.
