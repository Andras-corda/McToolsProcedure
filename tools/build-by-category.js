// Génère le dossier "by-category/" : une VUE DE NAVIGATION organisée par catégorie
// (entity, world, redstone, math, text, uuid, gui, scan, logic), à partir des vrais
// fichiers utilisés par MCreator dans src/main/resources/ (qui, eux, DOIVENT rester
// à plat : c'est une exigence du chargeur de plugins de MCreator, pas un choix).
//
// Ne modifie jamais les fichiers dans by-category/ directement : édite ceux de
// src/main/resources/, puis relance ce script (node tools/build-by-category.js).

const fs = require("fs");
const path = require("path");

const root = path.join(__dirname, "..");
const proceduresDir = path.join(root, "src/main/resources/procedures");
const ftlDir = path.join(root, "src/main/resources/forge-1.20.1/procedures");
const byCategoryDir = path.join(root, "by-category");

// Nettoyage complet avant régénération
fs.rmSync(byCategoryDir, { recursive: true, force: true });
fs.mkdirSync(byCategoryDir, { recursive: true });

const categoryNames = {
	math: "Math+",
	text: "Texte+",
	entity: "Entité+",
	world: "Monde+",
	redstone: "Redstone+",
	uuid: "UUID+",
	gui: "Interface+",
	scan: "Scan+",
	logic: "Logique+",
	data: "Données+",
	debug: "Debug+",
	inventory: "Inventaire+",
	list: "Liste+",
	combat: "Combat+",
	dimension: "Dimensions+",
	ai: "IA+",
	loot: "Loot+",
	progression: "Progression+",
	permission: "Permissions+",
	physics: "Physique+",
	schedule: "Planification+",
};

const files = fs.readdirSync(proceduresDir).filter(f => f.endsWith(".json") && !f.startsWith("$"));

let count = 0;
for (const file of files) {
	const jsonPath = path.join(proceduresDir, file);
	const data = JSON.parse(fs.readFileSync(jsonPath, "utf8"));
	const toolboxId = data.mcreator && data.mcreator.toolbox_id;
	if (!toolboxId) {
		console.warn(`(!) Pas de toolbox_id pour ${file}, ignoré`);
		continue;
	}

	const machineName = file.replace(/\.json$/, "");
	const targetDir = path.join(byCategoryDir, toolboxId);
	fs.mkdirSync(targetDir, { recursive: true });

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

// Petit README par catégorie
for (const [id, label] of Object.entries(categoryNames)) {
	const dir = path.join(byCategoryDir, id);
	if (fs.existsSync(dir)) {
		const blocks = fs.readdirSync(dir).filter(f => f.endsWith(".json")).map(f => f.replace(/\.json$/, ""));
		fs.writeFileSync(path.join(dir, "_README.md"),
			`# ${label} (\`${id}\`)\n\n${blocks.length} bloc(s) :\n\n${blocks.map(b => `- ${b}`).join("\n")}\n`);
	}
}

console.log(`OK : ${count} blocs répartis dans by-category/ (${Object.keys(categoryNames).length} catégories).`);
