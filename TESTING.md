# Testing

Development only, never in `Mod/`. Created 2026-10-02 from `AUDIT.md` gate 9. Single written source of the mod's test
scenarios (Audit ruling 2026-11-02, `AUDIT.md` 7.a). The `.feature` files in `Tests/Pickle/Mod/Pickle/Features/` are the
executable form; a row below names the scenario and its feature, it never copies the steps. Detail of the suite:
`Tests/Pickle/README.md`. One line per run: `Docs/runs/pickle.md`. Automated resource checks: `Tests/RESULTS.md`.

## Passes (three families)

| Family | Count | Map | Features | Language | Status on the current revision |
| --- | --- | --- | --- | --- | --- |
| Without optional mods | 2 launches | `wsl-deps.sans-facultatifs.map` | 01, 02, 03, 08 (baby and juvenile stages) | English, French | Green: English `7f4d` 2026-10-13; French `c56e` plus replay `f06f` 2026-10-14 (`Docs/runs/pickle.md`) |
| With optional mods | 1 launch | `wsl-deps.avec-facultatifs.map` | 05 ADS 2; 06 Nocturnal; 07 Better Crossbreeding and Dogs mate | English | Green: `c768` 9 of 10 2026-10-13, feature 07 replayed alone `6349` 3 of 3 2026-10-14 |
| Per declared incompatibility | 1 | `wsl-deps.incompat-source.map` | 04 (`@requires:SZ.MengGu.Expanded`) | English | Green 2026-09-29. Replay only when the source mod changes |

No scenario is `@wip`. The only conditional tag is `@requires:SZ.MengGu.Expanded`, which has its pass. `10-gallery.feature`
is not a test pass: it takes the Steam gallery captures at `shootGallery`.

## Order

Never-run and red scenarios first, as small tickets (`-Filter` on the feature). Non-regression last: the full
suite in both languages, all together, on the final revision. A scenario with a green run on the current
logic is non-regression; a change to `Mod/` or to a step it uses makes it new again.

## Scenarios F01 to F15 and their disposition

Setup for any manual run: RimWorld 1.6, Core and this mod only (the original Mengwu expansion off), disposable saves,
development mode to spawn animals and move time, text scenarios once in English and once in French. No manual test is
left to validate once the Pickle passes are green and the `@review` captures are read.

| ID | Preconditions | Actions | Expected results | Disposition |
| --- | --- | --- | --- | --- |
| F01 clean load | Clean configuration; Core and this mod; English. | Start game; inspect mod list, name, icon, description and startup log. Start a temperate-forest colony. | Correct unofficial name, icon and description; no unresolved or duplicate defs, XML or injection errors, exceptions from this mod. All four pawn kinds in the dev spawn menu. No DLC or framework required. | Pickle `01-defs` + `no errors were logged` |
| F02 source conflict | Original source installed. | Select both mods in the mod list and inspect the incompatibility warning. | The declared conflict with SZ.MengGu.Expanded shows. The original is never required to load the port. | Pickle `04-incompatible-source` (third family) |
| F03 adult graphics | F01 colony; one adult of each MG_Horse, MG_TiaoShu, MG_TuSun, MG_TuBoShu. | Watch them move in four directions; inspect info cards. | Four distinct animals match their textures; no missing or pink graphics, odd scaling or errors; west fallback usable; right name and description. | Pickle `02-visuals` `@review` captures (read, EN) |
| F04 life stages | Both sexes of horse, juveniles of every species. | Spawn or age through baby, juvenile, adult; inspect names and sprites; male and female horse labels. | Transitions at the def ages (horse 0, 0.15, 0.25 years; others from the delivered defs); graphics valid at every stage; horse baby and gender labels localized; no raw key or Chinese fallback. | Ages checked offline; Pickle `08-life-stages` captures (baby and juvenile, read) |
| F05 wildness and training | Wild adults; handler, food, safe area. | Inspect wildness; try taming and training. | Wildness horse 10%, bunny 35%, cat 35%, groundhog 60%; horse Advanced training, bunny Intermediate, groundhog None. Taming may fail normally. | Not applicable: engine behaviour; declared values checked offline (`Tests/Check-Content.ps1`) |
| F06 food and predation | Tamed herbivores with plant food; cat with meat and small prey. | Watch feeding and hunger; let the cat hunt. | Herbivores eat compatible plant food; cat shows its predatory behaviour; no starvation from unusable food defs. | Not applicable: engine behaviour |
| F07 combat labels | Test animals and targets; EN then FR. | Inspect attack and tool labels and the combat log. | Head labels on HeadAttackTool, not Teeth; left and right attacks match body parts; bite uses native naming; no raw key. | Offline: 28 of 28 DefInjected fields, tool-index guard; engine owns the rest |
| F08 horse packing | Tamed adult horse, colonist, goods. | Form a caravan with the horse; check capacity, travel, return. | The horse packs and returns without missing assets or save errors. | Not applicable: engine behaviour |
| F09 reproduction | Tamed male and female pair of a species; time. | Allow mating, gestation, birth; inspect offspring. | Offspring defs work, newborn graphics and labels valid, juveniles grow without exceptions. | Not applicable: engine behaviour |
| F10 corpses and products | Adults of each species; butcher table. | Kill one of each; inspect corpses and butcher products; keep one corpse until dessicated. | Meat, leather and corpse names resolve; horse meat localized; the groundhog east-only dessicated fallback renders without pink textures. | Not applicable except the groundhog dessicated asset, shipped and size-checked offline |
| F11 biome population | Maps in supported biomes. | Generate maps or wait for wildlife arrival. | Animals can arrive in biomes with positive weights; zero-weight biomes never pick them. | Not applicable: engine behaviour |
| F12 language and UI | F03, F04, F07, F10 once per language after restart. | Inspect names, descriptions, genders, foal, attacks, meat, labels at normal UI scale. | All owned text resolves without raw keys, Chinese fallback, escape sequences or clipping. | Pickle `02-visuals` label scenarios, one pass per language |
| F13 settings absence | No customization mod; EN and FR. | Open Mod options and the main buttons. | No empty settings page, no visible or greyed shortcut of this mod. | Not applicable: no settings, no MainButton (`settings_audit: not_applicable`) |
| F14 existing save | Copy of a 1.6 colony made without this mod. | Enable the mod; inspect all four species; save, quit, reload. | The colony loads; identity, age, gender, training, health persist; no missing-def errors. Upgrade from an earlier port revision: none exists to load. | Pickle `03-persistence` (save and reload) |
| F15 final logs | All applicable scenarios done. | Review logs after startup, spawning, saves, reloads. | No new or repeated error from this mod; unrelated errors recorded apart. | Pickle `no errors were logged` in every scenario |

## Evidence to keep

Per run, in `Tests/Pickle/Evidence/<date>-<pass>-<language>/` (gitignored): `summary.md`, `summary.json`,
`junit.xml`, `Player.log`, `evidence-complete.txt`. Plus only the `@review` screenshots actually opened
and read, minified. Delete `report.html`, `messages.ndjson` (25 MB each) and the whole `screenshots/` folder
of any red run. Keep per scenario the latest report of the revision in the repository, plus an older one only if
it is the sole proof of a check the latest did not repeat. Delete a report once a newer one replaces it, and
repoint any `STATUS.md` field before deleting. Launcher archives in `pickle-reports-archive/`: pick what
this mod needs from its own run, then delete that archive.
