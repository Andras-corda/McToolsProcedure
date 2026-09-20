// Génère le dossier "by-category/" : une VUE DE NAVIGATION organisée par catégorie
// (et sous-catégorie, depuis le champ "parent_category"), à partir des vrais fichiers
// utilisés par MCreator dans src/main/resources/ (qui, eux, DOIVENT rester à plat :
// c'est une exigence du chargeur de plugins de MCreator, pas un choix).
//
// Ne modifie jamais les fichiers dans by-category/ directement : édite ceux de
// src/main/resources/, puis relance ce script (node tools/build-by-category.js).

const fs = require("fs");
const path = require("path");

const root = path.join(__dirname, "..");
const proceduresDir = path.join(root, "src/main/resources/procedures");
const ftlDir = path.join(root, "src/main/resources/forge-1.20.1/procedures");
const byCategoryDir = path.join(root, "by-category");
const langPath = path.join(root, "src/main/resources/lang/texts_fr_FR.properties");

// Nettoyage complet avant régénération
fs.rmSync(byCategoryDir, { recursive: true, force: true });
fs.mkdirSync(byCategoryDir, { recursive: true });

// Noms de catégories lus directement dans le fichier de langue français
// (blockly.category.<id>=<nom>), pour ne pas avoir à les dupliquer ici.
const categoryNames = {};
for (const line of fs.readFileSync(langPath, "utf8").split(/\r?\n/)) {
	const m = line.match(/^blockly\.category\.([a-zA-Z0-9_]+)=(.+)$/);
	if (m) categoryNames[m[1]] = m[2].trim();
}

function sanitize(name) {
	return name.replace(/[\\/:*?"<>|]/g, "").trim();
}

// Lit le parent_category (le cas échéant) de chaque catégorie $xxx.json
const parentOf = {};
for (const file of fs.readdirSync(proceduresDir)) {
	if (!file.startsWith("$") || !file.endsWith(".json")) continue;
	const id = file.slice(1, -5);
	const data = JSON.parse(fs.readFileSync(path.join(proceduresDir, file), "utf8"));
	if (data.parent_category) parentOf[id] = data.parent_category;
}

function folderFor(categoryId) {
	const label = sanitize(categoryNames[categoryId] || categoryId);
	const parent = parentOf[categoryId];
	return parent ? path.join(folderFor(parent), label) : label;
}

const files = fs.readdirSync(proceduresDir).filter(f => f.endsWith(".json") && !f.startsWith("$"));

let count = 0;
const dirsUsed = new Map(); // relative folder -> category id, for the per-folder README

for (const file of files) {
	const jsonPath = path.join(proceduresDir, file);
	const data = JSON.parse(fs.readFileSync(jsonPath, "utf8"));
	const toolboxId = data.mcreator && data.mcreator.toolbox_id;
	if (!toolboxId) {
		console.warn(`(!) Pas de toolbox_id pour ${file}, ignoré`);
		continue;
	}

	const machineName = file.replace(/\.json$/, "");
	const relFolder = folderFor(toolboxId);
	const targetDir = path.join(byCategoryDir, relFolder);
	fs.mkdirSync(targetDir, { recursive: true });
	dirsUsed.set(relFolder, toolboxId);

	fs.copyFileSync(jsonPath, path.join(targetDir, file));

	const ftlFile = machineName + ".java.ftl";
	const ftlPath = path.join(ftlDir, ftlFile);
	if (fs.existsSync(ftlPath)) {
		fs.copyFileSync(ftlPath, path.join(targetDir, ftlFile));
	} else {
		console.warn(`(!) Pas de template .java.ftl trouvé pour ${machineName}`);
	}
	count++;
}

// Petit README par catégorie feuille (celles qui contiennent des blocs)
for (const [relFolder, id] of dirsUsed.entries()) {
	const dir = path.join(byCategoryDir, relFolder);
	const blocks = fs.readdirSync(dir).filter(f => f.endsWith(".json")).map(f => f.replace(/\.json$/, ""));
	fs.writeFileSync(path.join(dir, "_README.md"),
		`# ${categoryNames[id] || id} (\`${id}\`)\n\n${blocks.length} bloc(s) :\n\n${blocks.map(b => `- ${b}`).join("\n")}\n`);
}

console.log(`OK : ${count} blocs répartis dans by-category/ (${dirsUsed.size} sous-catégories, ${new Set(Object.values(parentOf)).size} groupes parents).`);
