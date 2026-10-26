# Functional validation scenarios

Written 2026-09-13. **Not executed.** These are the future `done -> tested` checks.
Automated resource validation is recorded separately in Tests/RESULTS.md. Do not mark
a scenario passed from code inspection, a successful XML test or an animal merely spawning.

## Common setup and evidence

Use RimWorld 1.6 and the exact Mod payload recorded in Tests/Payload-files.json.
Record full game version, language, active mods/DLC, payload revision, save and scenario ID,
observations, screenshots and relevant Player.log excerpts. Work on disposable saves/copies.
Baseline mod list: Core and this mod only; do not enable the original Mengwu expansion.
Use development mode to create test animals and control age/time where appropriate.
Run text/UI scenarios once in English and once in French, restarting when changing language.
Keep the original save untouched. A run on a different payload requires a new manifest.

| ID | Preconditions | Actions | Expected results |
| --- | --- | --- | --- |
| F01: clean load | Clean test configuration; Core and this mod; English. | Start game; inspect mod list, name, icon, description and startup log. Start a temperate-forest colony. | Correct unofficial name/icon/description; no unresolved defs, duplicate defs, XML/injection errors or exceptions attributable to this mod. All four pawn kinds are available in the development spawn menu. No DLC or framework required. |
| F02: source conflict | Disposable configuration; original source is installed. | Select both mods in the mod list and inspect incompatibility warning. Stop before starting a game with both; restore baseline configuration. | The declared conflict with SZ.MengGu.Expanded is surfaced. Original source is never required to load the port. |
| F03: adult graphics | F01 colony; spawn one adult of each MG_Horse, MG_TiaoShu, MG_TuSun, MG_TuBoShu. | Observe all animals while moving north/east/south/west; inspect their info cards. | Four distinct animals match their textures; no missing/pink graphics, unexpected scaling or errors. West fallback is usable. Each animal has the correct name and description. |
| F04: life stages | Disposable colony; both sexes of horse, plus juveniles of every species. | Spawn/age through baby, juvenile and adult stages; inspect names and sprites at each stage. Inspect male and female horse labels. | Stage transitions occur at the definition ages (horse 0/0.15/0.25 years; other ages read from the delivered defs). Graphics remain valid at every stage; horse baby and gender labels are localized. No raw keys or Chinese fallback. |
| F05: wildness and training | Adult animals spawned wild; capable handler, food and safe work area. | Inspect wildness; attempt taming; inspect available training and train a tamed horse and bunny with sufficient time/skill. | Wildness is horse 10%, bunny 35%, cat 35%, groundhog 60%, rather than a default/missing value. Horse permits Advanced training; bunny Intermediate; groundhog None. Taming can fail normally; no deterministic success is expected. |
| F06: food and predation | Tamed herbivores with compatible plant food; cat in a separate safe enclosure with meat and disposable small prey. | Observe actual feeding and hunger changes; let cat hunt appropriate prey. | Horse, bunny and groundhog can eat compatible plant food; cat exhibits its declared carnivorous/predatory behaviour. No starvation caused by unusable food definitions or runtime errors. Consumption amounts follow current defs, not flavour-text claims. |
| F07: combat labels | Disposable test animals and targets; EN then FR. | Inspect available attacks/tool labels and combat log; exercise head, hoof/claw and bite attacks. | Head labels apply to HeadAttackTool, not Teeth; left/right attacks match their body parts. Bite uses native localized naming. No raw key, Chinese text or exceptions. Damage/cooldowns remain those of the delivered defs. |
| F08: horse packing | Tamed adult horse, colonist and packable goods; reachable world destination. | Form a caravan with horse and goods; check carrying capacity, travel, return and inspect loaded horse graphics. | Horse participates as a pack animal, carries goods and returns without missing assets or save errors. Cargo and ownership persist. |
| F09: reproduction | Tamed adult male/female pair of a species; safe enclosure, suitable food and enough simulated time. Repeat for each species. | Allow mating/gestation/birth; inspect offspring, age and growth. | Birth/offspring definitions work, newborn graphics and labels are valid, juveniles grow without exceptions. Random delays are not failures; record sufficient observed time and actual gestation. |
| F10: corpses and products | Disposable adults of each species; butcher table and worker. | Kill one of each; inspect fresh corpse and butcher products. Retain another corpse until dessicated; inspect orientations. | Meat/leather and corpse names resolve; horse meat is localized. Horse/squirrel/lynx Core corpse graphics and the groundhog east-only dessicated fallback render without pink/missing textures. No null reference or repeated log errors. |
| F11: biome population | New disposable maps in supported biomes (e.g. temperate forest and arid shrubland); record biome weights from delivered defs. | Generate maps or trigger natural wildlife arrival over repeated trials; inspect which animals arrive. | Animals can populate biomes with positive configured weights, with plausible group sizes. Zero-weight biomes do not naturally select that animal. Random absence on a single map is not failure; forced spawning does not prove natural population. |
| F12: language/UI | Complete F03/F04/F07/F10 once in English and once in French after restart. | Inspect names, descriptions, paragraph breaks, genders, foal, attacks, meat and generated corpse/product labels. Open information panels at ordinary UI scale. | All owned text resolves in the chosen language without raw keys, Chinese fallback, literal escape sequences, clipped text or inconsistent labels. Long descriptions wrap correctly. |
| F13: settings absence | Baseline configuration with no customization mod; EN and FR. | Open Mod options and inspect main buttons. | No empty settings page and no visible or greyed-out shortcut belonging to this mod. No settings persistence test is applicable. RIMMSQOL is not needed and no integration compatibility is claimed. |
| F14: existing save and persistence | Copy of a 1.6 colony created without this mod; separate copy with prior version of this port and existing MG animals if available. | Enable/update the mod in the copies. Spawn or inspect all four species; save, quit to desktop and reload. Repeat language inspection after reload. | Existing colony loads; animal identity, age, gender, training, inventory and health persist. No missing-def or translation errors. If a prior-port save is unavailable, record that upgrade case as unverified rather than passed. |
| F15: final logs/regression | All applicable scenarios completed on recorded payload. | Review logs after startup, spawning, actions, saves and reloads; repeat affected scenarios after any fix. | No new or repeated mod-attributable errors. Record unrelated errors separately. Corrections invalidate affected scenarios, not unrelated results. |

## Completion record

All scenarios currently **NOT RUN**, by user request. For each future execution record:
ID, date, language, game/mod versions, save, actual observations, pass/fail/unverified,
evidence paths and any regression rerun. Only successful applicable runtime coverage
permits `tested`; writing this document permits no runtime claim.

Not applicable: code compilation/C# unit tests (no code/assemblies), configurable-value
persistence and input boundaries (no settings), shortcut reveal integrations (no shortcut),
conditional patch branches (no patches/LoadFolders). Save persistence of animals still applies.
