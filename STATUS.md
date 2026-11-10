---
localization: complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
mod:          Mengwu Expanded - Animals Renew (unofficial)
packageId:    nelim.mengwuexpandedanimals
repo:         Rimworld-Mengwu-Expanded-Animals-Renew
visibility:   public
detached:     yes
workflow_stage: shootGallery[1.0.0]
upstream_mod_remotes:
  - N/A
licence:      silent
licence_at:   ATTRIBUTION.md; installed source About.xml checked 2026-09-13
dependencies: none
showcase:     Mod/About/Preview.png
code_review_sha: 8c036caa91d436157d42d630fdfcf4e32e71ef18
echo_review_sha: 772594ec61e71b77a4b1c42a49ef4665dc6fe680
tested_on:    b0f72d0 .. 3f48336 (Mod/ unchanged but Patches/Compat_DogsMate.xml removed at 3f48336); Pickle EN 7f4d, FR c56e+f06f, avec-facultatifs c768+6349, 2026-10-13/14
workshop:     3811291533 (0.1.0 prepublished; target version now 1.0.0, owner decision 2026-10-13, private; PublishedFileId.txt committed ef17ade, 2026-10-02)
remaining:
  - open: gallery rework 2026-11-10 (see "Shotlist rework"): ticket f72c done red (2/3: S2 and S4 captures REDO, S3 wall cell), evidence Tests/Pickle/Inbox/gallery-s2-s4 and gallery-s2-s4-r2 to delete once the scenarios are rewritten. Next: survey ticket on z3 (-DepMap wsl-deps.gallery.map), write S1 to S5, drift check, gallery ticket; then S6, PUBLICATION.md (does not exist yet), subtitles after acceptance.
  - open: TM missions 2026-11-10 not done yet: (a) sort Tests/Pickle/Inbox (gallery-s2-s4, gallery-s2-s4-r2: read, delete once the S2 to S4 scenarios are rewritten) with scripts/Prune-Evidence.ps1 -Mod MengwuExpandedAnimalsRenew (dry run, then -Apply); (b) tests shape: Check-Content.ps1 stays, look at Tests/Rule-OwnValues.ps1 + generated Tests/Test-Mod.ps1 (CI/CD regenerate) and Check-PatchGuards.ps1 -RequireGuards (AGENTS.md, Mod tests shape), tell Audit when pushed; (c) TRANSLATION_REVIEW.md replaces FRENCH_REVIEW.md: scripts/Make-TranslationReview.ps1 -ModRoot <mod> at next regeneration, commit new file and the deletion by path; (d) runner on auto, never -Runner azure; (e) Check-Status INFO: social_preview_sha256 missing (due at writeDocs).
  - open: local scripts cut 2026-11-02 (TM relay, docs/LOCAL-SCRIPTS-CUT.md): only Tests/Check-Content.ps1 kept, row in scripts/LOCAL_SCRIPTS.md; Audit to write Validated (told). Run: command list in Tests/RESULTS.md.
  - open: echo_review_sha (772594e) stale: echo-concept.png and Preview.config.json changed after it (echo mode opaque-lineart, preSized false); re-validate with the owner at mountPreview.
  - open: Preview redone 2026-11-10 (new Preview.config.json schema: titleParts+suffix, background, echo; first render showed a flat teal echo block, fixed by adding echo.mode opaque-lineart and echo.preSized false); echo sits right of the title, close to the dash of "EXPANDED -", owner to eyeball; echo_review_sha still stale.
  - unverified: Mod options list shows no entry for this mod (settings_audit not_applicable, 5.b); sources show no page and no shortcut, in-game confirmation left to the gallery session or the owner.
  - unverified: Dogs mate files the marmot (MG_TuBoShu) in its group Cat, through the mod's own patch for the original defNames; left as the author made it, owner may want it removed.
  - unverified: RimWorld 1.7 pass not recorded (tested_1_7 absent); evidence folders p17-mengwu-01-defs (1/1 passed), p17-mengwu-02-visuals (5/6, one failed) and an empty p17-mengwu-02-visuals-fr sit in Tests/Pickle/Evidence with no line in docs/runs: read them, record tested_1_7 and the run line, or replay (AUDIT.md, "Passe 1.7"; English only).
session:      mengwuexpandedanimals / shootGallery[1.0.0]
updated:      2026-11-10
protocols_read_sha: 150e6a17c12bac5adfad966ec85f0bdc7203139f
---

# Mengwu Expanded - Animals Renew: status

## NSB (sync-nsb-npt, 2026-11-10; replaces the section at each sync)

Places read: 2026-11-10. Tribe read: 2026-11-10. Steps read: 2026-11-10.

Changed in NSB since the shotlist (2026-10-27): the places `hut`, `water-garden`, `river-bridge` and others validated on the DECORATED save (2026-11-06, fixture `Nelims-tribe-decor-mods-z3`, copied to Mod/Pickle/Fixtures 2026-11-09); the old undecorated `Nelims-tribe` stays beside it. `enclosure-south` logo of flowers (growing zones 3 to 15) validated 2026-11-08, nothing may stand on it. Nelim's colour and mouth rules unchanged. Nothing new in the animal catalogue for these four animals.

Rules said back (owner, 2026-11-05/07): everything in NSB is free; a colonist or domestic animal outside NSB needs express validation, except the animal the mod adds (authorized); a colonist property changes only with validation; every outfit free; every animal the mod includes is shown.

Done: hair colour of Nelim set back to the roster value (Hair_DarkSaturatedReddish #382412 = rgb (56, 36, 18)), was (46, 34, 28), in the feature header and the 3 scenarios (S2 and S4 passed in f72c with the old colour: replay with the next ticket, the difference is small).

Open (no owner question, session's work): (1) the gallery DepMap and `Given the save "Nelims-tribe"` load the OLD undecorated save while the places were validated decorated (z3, which needs NSB's decor mods): S3 failed at the brazier cell (146, 74) "already holds Wall", the hut is not the validated tea room. Decide with the S3 replay: move the gallery to z3 and a decor DepMap (ask NSB which map carries z3) or keep Nelims-tribe and say so. (2) S1 and S5 (enclosure-south): read the logo cells before placing lamps, brazier, hay (nothing on the flower logo). (3) Nelim body type Female is set by the scenarios: NSB has no Female body photo yet (VALIDE.md); it is her canonical sex, not a change, left as is. (4) Smile: `MouthSmile` replaces the canon `MouthLipsSmirk` as scene liberty (VALIDE.md "Liberté de scène", 2026-11-06), not a property change.

NPT steps since: new, usable here: `the animals except A, B and C are kept out of the sanctuary` (S3 hut), `I frame the area centred on the point (x, z) at root size` (half-cell framing), `the building X at (x, z) is put out`, `carries the item X made of Y`, `I place the decor X on a cardinal cell`. Steps used by S2 to S4 still exist (`lies at`, `faces`, `PredatorHunt`, `advance exactly N ticks`).

| Place | Shots | Changes made for the gallery | Last read |
|---|---|---|---|
| water-garden (moss bank x 143-158) | S2 | Filth_Dirt mound, Daylily, removed after; geyser (149-150, 173) kept out of frame | 2026-11-10 |
| hut (tea-room, (140, 73)) | S3 | pot, brazier, cat; hut animals kept out; PENDING: decorated vs old save | 2026-11-10 |
| bare-clearing | S4 | YellowTallGrass, Daylily, removed after | 2026-11-10 |
| enclosure-south (gates (159, 207), (130, 219)) | S1, S5 (not written) | emptied, lamps, brazier, grass; logo cells free of objects | 2026-11-10 |
| window-backdrop-for-height | S6 (not written) | none | 2026-11-10 |

| Colonist | Shots | Outfit (garment, why) | Last read | Exceptions |
|---|---|---|---|---|
| Nelim | S1 to S5 | Apparel_Pants brown (70, 56, 44), VAE_Apparel_Jumpsuit emerald (31, 92, 69), VAE_Headgear_Scarf orange (230, 120, 40): working day on the steppe, her emerald and orange accent; one outfit all day | NELIM-PROFIL 2026-11-10 | none (hair colour back to roster 2026-11-10; smile = scene liberty) |

| Animal (NSB) | Shots | Outfit | Last read | Exceptions |
|---|---|---|---|---|
| none: Nelim's pets (Atticus, Shogun) not used | | | | none |

| Included animal (rule 5) | Shot(s) |
|---|---|
| MG_Horse (Mengwu horse) | S1, S5 (not written yet), S6 card |
| MG_TuBoShu (marmot, adult and baby) | S2, S5 |
| MG_TuSun (Pallas's cat) | S3, S4 |
| MG_TiaoShu (jerboa) | S4, S5 |
No MISSING. The mod's four animals are authorized by default (no validation).

## Audit 2026-10-12 (replaces the 2026-10-02 stage decision; older journal in docs/runs/status-journal.md)

Audited revision 8d867cb. Old vocabulary l10n maps to declareDependencies (AUDIT.md section 16). First failing transition: declareDependencies[0.1.0] -> auditSettings, criterion 4.f (animal integrations untreated). Gates 4.a-4.e unchanged (Core-only content, no patch, no LoadFolders; audit 2026-09-13), not re-run now.

Retired field stage: removed. protocols_read_sha written by Mark-ProtocolsRead.ps1. Journal moved out (file was 49 KB).

Closing pass 3 (mod root clean), 2026-10-12: `.build/` removed (regression-guard scratch now in the system temp folder, `.gitignore` entry dropped); `_tools/Generate-FrenchReview.ps1` deleted, FRENCH_REVIEW.md regenerated with the shared `scripts/Make-FrenchReview.ps1` (`french-review-sources.json`: Original from the Defs, English from Languages/English); duplicate `TRADUCTION.md` removed. Automated and XML checks replayed green (`Tests/Run-Tests.ps1`, 56 keys, 0 errors). Root entries ruled 2026-10-13 (Virginie): `.editorconfig`, `output/`, `Workshop/` and `Preview-generation.md` deleted (the Preview and ModIcon prompts and the art provenance moved to README.md); `.claude/` is the local Claude Code folder, untracked.

Next: treat or justify the four integrations (own patch and own Pickle pass where a patch lands), then auditSettings.

## Dependencies and integrations 2026-10-13 (AUDIT.md 4.f, 4.g)

Dependencies: none (Core only, no DLC reference, no LoadFolders). Optional, all guarded, no-op without the mod; defName pairing follows the vanilla analogue in each mod's own files (read 2026-10-13), reasons in the patch headers:
- ADS 2: MG_Horse and MG_TuSun in Cat1, Cat2, Cat3 (Horse; Cat and Lynx); MG_TiaoShu and MG_TuBoShu in Cat1 only (Squirrel, Rat, Chinchilla). `loadBefore` ADS 2 in About.xml.
- Nocturnal Animals: MG_TuSun Nocturnal (Lynx), MG_TiaoShu Crepuscular (Chinchilla). MG_Horse and MG_TuBoShu: nothing (Horse and Squirrel unlisted, diurnal).
- Dogs mate: no patch from this mod. The mod ships its own 1.6/Patches/SZ.MengGu.Expanded.xml, applied because this port keeps the original defNames: MG_Horse in group Horse, MG_TiaoShu in Rat, MG_TuSun and MG_TuBoShu in Cat (found at the first avec-facultatifs play, 2026-10-13; a first Compat_DogsMate.xml written from a search of CompatibleSpecies alone was redundant and removed). Oddity left to the owner: the marmot is in the group Cat, so it can pair with cats.
- Better Crossbreeding: MG_Horse <-> Horse, Maternal both ways. Other three: not a variety of a vanilla animal.
Checked: XPath of every patch resolves on Core + mod defs + each mod's own files (.NET XPath 1.0); files well-formed. In-game proof pending (see remaining).

## Settings audit 2026-10-13 (AUDIT.md 5.a-5.g)

Result: `settings_audit: not_applicable`.
- Inventory: no C# (no `Source/`, no assembly, no `.csproj`), no `ModSettings`, no `MainButtonDef`, no settings keys in `Languages/`, no inherited or optional-integration setting (the four patches in `Mod/Patches/` only add defNames to other mods' lists). Searched `Mod/` for `MainButtonDef`, `ModSettings`, `settings` in XML: no match.
- Decision: content-only mod, four animals with fixed stats. No concrete player need for an option; none invented.
- Contract: no entry under Mod options, no MainButtons shortcut, so no empty page and no shortcut (5.b). The absence of C# is not the proof; the search above is.
- In-game confirmation (Mod options list shows no entry for this mod): `unverified`, joins the `playTests` run.

## Translation audit 2026-10-13 (AUDIT.md 6.a-6.h)

- Inventory: texts shown to the player live in `Mod/Defs/MGAnimal.xml` (Chinese source, 4 animals) and in `Languages/English` and `Languages/French` `DefInjected`. No C#, no Keyed, no LoadFolders. The four optional patches add no displayed text (defNames and extensions only).
- Coverage: `Tests/Run-Tests.ps1` green (28 owned display fields in both languages; injection check "Keys checked: 56 - errors: 0"; five regression guards rejected). `scripts/Check-Translations.ps1`: PASS, 14 source texts, 0 Keyed; one WARN, `ThingDef/MG_Horse.race.meatLabel` outside its inventory, covered in EN ("horse meat") and FR ("viande de cheval") and by the injection check.
- French agreement: names and descriptions are not pawn-bound, no gendered template needed. Reading of every phrase for agreement stays with Virginie's review.
- `FRENCH_REVIEW.md` regenerated with `scripts/Make-FrenchReview.ps1` (revision a78c364).
- `translation_fr`: `partial` at this date, `complete` after Virginie's review (see "French review" below). In-game raw keys, fallback text and clipping: `unverified` until `playTests`.

Decision 2026-10-13 (Virginie): English labels stay faithful to the original author, `Rabbit mantle` (MG_TuSun) and `Mogul Leaping Bunny` (MG_TiaoShu) are kept even though the animals are a Pallas's cat and a jerboa (ATTRIBUTION.md, "The translation"). The descriptions and the French labels name the real animals. Not a defect.

French review 2026-10-13: Virginie validated `FRENCH_REVIEW.md` (revision b5f93d9, corrections applied earlier: 4 wording fixes on MG_TuSun; none new). `translation_fr: complete` (6.g). In-game raw keys, fallback and clipping stay `unverified` until `playTests`.

## writeTests 2026-10-13 (AUDIT.md 7.a-7.h)

- 7.a: `TESTING.md` (F01-F15 with dispositions; merged 2026-11-02 from `Tests/TEST_SCENARIOS.md`, removed).
- 7.b, 7.c: `Tests/Run-Tests.ps1` replayed at 322e882, green (56 keys, 0 errors; patches checked by `Check-Content.ps1`; five regression guards rejected). No new local script.
- 7.d: Pickle suites written, not run. Passes: sans-facultatifs (01, 02, 03, 08), incompat-source (04), avec-facultatifs (05 ADS 2, 06 Nocturnal, 07 Better Crossbreeding and Dogs mate). Each `@requires` has its map line. Local steps: none; the new steps are PickleTools (DefFieldSteps, ScreenshotStudio), written by NPT, uncommitted and not played at this date.
- 7.e: no manual test left; F05, F06, F08, F09, F11 not applicable (engine behaviour, `TESTING.md`).
- 7.g: `localization`, `translation_en`, `translation_fr` complete, French reviewed by Virginie 2026-10-13.

## Audit replay 2026-10-16 (AUDIT.md 1 to 8, current stage playTests[1.0.0])

Replayed against the protocols at 813dbe9 (AGENTS.md, AUDIT.md, STYLE_RIMWORLD.md, scripts.md, USE_THIS_INSTEAD.md diffs since e1a1959b read).
- 1 setupRepo: repository, remote, `.gitignore`, `unofficial` notices, `STATUS.md` fields, licence `silent` documented. OK. 1.a (duplicate search of the Workshop): not rerun, `Search-Workshop.sh` takes about five minutes and the mod is already prepublished (3811291533).
- 2 makeSources: `ModIcon-source.png` and `Preview-source.png` present, derivatives newer than their source (2026-10-12), `0-preview.png` byte copy of `Preview.png`. `Measure-Palette.sh` on `Preview-source.png`: 2 hue families, Vmean 0.399 (rule: at most 3, at least 0.30). ModIcon weight 29 KB. OK. Owner's uncommitted `Art/` work (echo-source.png deleted, echo-preview.png added) not touched; `Art/Preview.config.json` still names `echo.png`.
- 3 code: no code, no build. CHANGELOG `## [Unreleased]` describes the version (it was wrongly set to `[1.0.0] unreleased`, fixed). OK.
- 4 declareDependencies: dependencies none, three guarded optional patches, `loadBefore` ADS 2 checked by `sort-load-order.py` (order: this mod, Dogs mate, Better Crossbreeding, Nocturnal, ADS 2, no cycle). `Check-TypeRefs`, `Check-XmlFields`, `Check-Steps` green. 4.f: Dogs mate needs no patch, it ships its own for the original defNames (docs/runs/pickle.md, 2026-10-13).
- 5 settings: `not_applicable` justified (see Settings audit). OK.
- 6 localize: green offline, French reviewed by Virginie 2026-10-13, FRENCH_REVIEW regenerated at a committed revision. OK. No em dash left outside `docs/runs/status-journal.md` (history).
- 7 writeTests: `Tests/Run-Tests.ps1` green at the current tree (56 keys, 0 errors). Local scripts justified in `scripts/LOCAL_SCRIPTS.md` (4 rows, validation left to Audit workflow). OK.
- 8 playTests: 8.c every pass green (EN, FR, avec-facultatifs, incompat-source unchanged since 2026-09-29); 8.d the 12 adult/baby/juvenile captures read (EN); 8.e no `@wip`; 8.f every `@requires` has its pass and report; 8.i Player.log of the four runs holds no error from this mod (only environment warnings); 8.l evidence minified, two red reruns of 2026-09-29 deleted, runs logged in `docs/runs/pickle.md`, `tested_on` filled. 8.g and 8.k: F01 to F15 dispositions in `TESTING.md`, no manual test left. 8.h not applicable (no settings).
- 8.m code review of `b3d5ff7..HEAD` under `Mod/` (excluding textures): `Defs/MGAnimal.xml` loses one line (`alternateGraphicChance`, intended); `About.xml` gains `loadBefore`, `incompatibleWith`, unofficial notices, description without a version number; three patches read in full, each guarded, no `MayRequire` on an Operation, XPath validated against Core, the mods' own files and the game; DefInjected EN and FR 28 fields each, `Check-DefInjected` 56 keys 0 errors. No defect found.

## Shotlist rework 2026-11-10 (write-shotlist, Opus director pass, score-gallery; full lines in the header of `10-gallery.feature`)

Why: f72c captures S2 and S4 judged REDO (Nelim cropped at the edge with a sweat drop, no mound, scarf detached and red "!" mote in S4, jerboa about 570 px away, bare ground), S3 failed at a wall cell. Director pass kept: the whole series moves to the DECORATED save (z3) with a rebuilt DepMap; thick grouped decor with a lit light source in frame (DR_StickLantern, TorchLamp, the hut's andon); Nelim carries something in every shot (hay, berries, kibble, kibble, empty hands); animals face the action, one front view (S2 pup); S1 wide (root 5.5, not 7: the horse stays about 28 px at 268), S5 20:00 with the jerboa awake and the cat walking in last (the subtitle "All four are home" is true). Not kept: none refused; S1 not emptied (bare soil is thin decor).

| shot | a | b decor | c living | d pawn | e action and instant | f frame | g | j | plan |
|---|---|---|---|---|---|---|---|---|---|
| S1 dawn-gate | enclosure-south 07:00 Clear | TorchLamp, hay bales, grass, z3 decor | horse facing Nelim | emerald jumpsuit, scarf, Highpony, smile | hauls Hay, gate just opened | WIDE root 5.5 | horse waits, hay arrives | horse 28 px | 5 |
| S2 the-mound | water-garden 09:00 | Filth_Dirt mound, Daylily, grass x5, DR_StickLantern | marmot west, pup FRONT | same | hauls RawBerries, marmot just out | TIGHT root 2.5 | marmot meets berries | marmot readable | 5 |
| S3 noon-nap | hut 12:00 | tatamis, table, cushions, andon, bonsai | cat asleep on cushion | same | hauls Kibble, tiptoes in | MEDIUM root 4 | cat sleeps, food set down | cat 40 px | 5 |
| S4 dusk-hop | bare/emerald-clearing 18:00 | grass band x8-10, Daylily x3, DR_StickLantern | jerboa away, cat crouched | same | hauls Kibble, before the pounce | TIGHT root 3 | hunt wakes at dusk | jerboa 27 px | 5 |
| S5 night-gate | enclosure-south W gate 20:00 | TorchLamp x2, Brazier, hay, grass | horse in, marmot asleep, jerboa awake, cat in | same | empty hands, goes to the gate | MEDIUM-WIDE root 5 | everyone home | horse 32 px | 5 |
Series k: ok (one story, wide/medium/tight, opening and closing gates, rhythm moves). S6 info card not scored. Plan scores are on paper (cells marked [READ] not yet read on a z3 photo; "never played" costs nothing). Captures of f72c: S2 REDO, S4 REDO, S3 none; all deleted when the scenarios are rewritten.

Survey ticket 20261110-145550-341-715f filed (10-gallery::survey, 7 empty photos, evidence Tests/Pickle/Inbox/gallery-survey); at RUN_DONE read summary.json, junit.xml and every photo. Next after it: (survey ticket on z3 (empty photos of enclosure-south both gates and the logo, water-garden bank, hut interior, bare-clearing and emerald-clearing, with `-DepMap wsl-deps.gallery.map`), read cells, write S1 to S5 scenarios, reformat the header shot lines as `#   1. name` so `Check-ShotlistVsScenario.ps1` can match them (it printed INFO: no numbered shot line, never enforced here), then drift check, then the gallery ticket.

## Shotlist 2026-10-27 (superseded 2026-11-10 by the rework above) (shootGallery, `write-shotlist`; full lines in `Tests/Pickle/Mod/Pickle/Features/10-gallery.feature` header)

Story: "The steppe comes to the Sanctuary", one day, dawn to night, Nelim only (NSB colon), one outfit all day (VAE jumpsuit deep emerald, orange scarf, Highpony, own face). Director pass: Opus sub-agent, one call. Kept: instants and how each gesture is obtained, hay and grass in place of cup and berries, S2 tight 6-cell rectangle with Filth_Dirt around the burrow and front view moved to S2, S4 "just before the pounce", S5 other gate and other rectangle, nocturnal beat tied to the Nocturnal Animals integration, S3 fallback (cut, nocturnal beat moves to S5), S6 as appendix. Not kept: none refused.

| shot | place, hour | a | b | c | d | e | f | g | j | est. | main risk |
|---|---|---|---|---|---|---|---|---|---|---|---|
| S1 mengwu-1-dawn-gate | enclosure-south, 07:00 | ok | emptied paddock, TorchLamp lit, YellowTallGrass x4 | horse, FRONT view (`faces South`) | emerald jumpsuit, orange scarf, Highpony, smile | hauls Hay through the gate, mid-stride, just before she sets it down | medium-wide root 4.5, gate at the bottom, horse right | one line | horse about 35 px at 268 | 4.5 | gate geometry read on a photo |
| S2 mengwu-2-the-mound | water-garden moss bank, 09:00 | ok | Filth_Dirt, Daylily | marmot + baby, front view | same outfit | stops mid-stride, marmot just out | tight 6 cells | ok | marmot reads | 4 | `faces South` step exists (not played); the "hole" at (149,173) is the steam geyser, not a burrow: S2 stages its own Filth_Dirt mound at x 155-156; bank wildlife may drift in |
| S3 mengwu-3-noon-nap | hut, 12:00 | ok | bonsai pot, lit brazier | Pallas's cat asleep | same outfit | steps in softly, about to leave | medium, zoom 9 | ok | cat reads | 4 | `lies at (x, z) facing` step exists, not played; ticks must pass before the shot |
| S4 mengwu-4-dusk-hop | bare-clearing, 18:00 | ok | YellowTallGrass, flowers | jerboa + cat | same outfit | just before the pounce, carries Kibble | tight-medium, zoom 5 | ok | both small, 268 px risky | 4 | `forced into the job "PredatorHunt"` exists, not played; N ticks to tune |
| S5 mengwu-5-night-gate | enclosure-south west gate, 21:00 | ok | emptied paddock, 2 TorchLamp lit at the gate, Brazier lit | horse walking in, marmot + jerboa asleep (`lies at`) | same outfit, smile | walks back to the gate, mid-stride, just after the horse went in | medium-wide root 5, west gate left | one line | horse about 32 px at 268 | 4 | gate cell (130,219) read on a photo; sleepers need the same ticks as the walks |



Scenarios S2 to S4 written 2026-10-27 in `Tests/Pickle/Mod/Pickle/Features/10-gallery.feature` (names `mengwu-2-the-mound`, `mengwu-3-noon-nap`, `mengwu-4-dusk-hop`) with `Tests/Pickle/wsl-deps.gallery.map`. `Check-Steps.ps1`: every step line resolves to exactly one expression, none played. S1, S5, S6 not written yet. Correction: the "burrow" of water-garden is a steam geyser; S2 stages its own mound. Next: small ticket for S2 to S4 (`file-pickle-ticket`, `-DepMap wsl-deps.gallery.map`, `-Filter` the full feature stem), send NPT the failure text of any step.
