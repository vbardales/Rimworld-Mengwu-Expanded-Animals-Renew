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
  - open: shotlist written 2026-10-27 (10-gallery.feature header, STATUS "Shotlist"); series 4.1, the three NPT steps exist (not played); next: write scenarios + wsl-deps.gallery.map, small ticket S2 to S4. PUBLICATION.md (Gallery table, Gallery subtitles) does not exist yet; write it with the subtitle lines of the shotlist.
  - unverified: Mod options list shows no entry for this mod (settings_audit not_applicable, 5.b); sources show no page and no shortcut, in-game confirmation left to the gallery session or the owner.
  - unverified: Dogs mate files the marmot (MG_TuBoShu) in its group Cat, through the mod's own patch for the original defNames; left as the author made it, owner may want it removed.
  - unverified: RimWorld 1.7 pass not run (tested_1_7 absent); follows the green 1.6 playTests, English only (AUDIT.md, "Passe 1.7").
session:      mengwuexpandedanimals / shootGallery[1.0.0]
updated:      2026-10-26
protocols_read_sha: 43dd90d4b7873c500347fba1be01275a48d5795b
---

# Mengwu Expanded - Animals Renew: status

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

- 7.a: `TEST_SCENARIOS.md` (F01-F15), dispositions in `TESTING.md`.
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

## Shotlist 2026-10-27 (shootGallery, `write-shotlist`; full lines in `Tests/Pickle/Mod/Pickle/Features/10-gallery.feature` header)

Story: "The steppe comes to the Sanctuary", one day, dawn to night, Nelim only (NSB colon), one outfit all day (VAE jumpsuit deep emerald, orange scarf, Highpony, own face). Director pass: Opus sub-agent, one call. Kept: instants and how each gesture is obtained, hay and grass in place of cup and berries, S2 tight 6-cell rectangle with Filth_Dirt around the burrow and front view moved to S2, S4 "just before the pounce", S5 other gate and other rectangle, nocturnal beat tied to the Nocturnal Animals integration, S3 fallback (cut, nocturnal beat moves to S5), S6 as appendix. Not kept: none refused.

| shot | place, hour | a | b | c | d | e | f | g | j | est. | main risk |
|---|---|---|---|---|---|---|---|---|---|---|---|
| S1 mengwu-1-dawn-gate | enclosure-south, 07:00 | ok | TorchLamp lit, YellowTallGrass, Hay | horse | emerald jumpsuit, orange scarf, Highpony, smile | carries Hay, just before she sets it down | wide rectangle, off-centre horse | one subject, one line | horse readable at 268 px | 4.5 | horse leaves its spawn pose (60 ticks) |
| S2 mengwu-2-the-mound | water-garden moss bank, 09:00 | ok | Filth_Dirt, Daylily | marmot + baby, front view | same outfit | stops mid-stride, marmot just out | tight 6 cells | ok | marmot reads | 4 | `faces South` step exists (not played); the "hole" at (149,173) is the steam geyser, not a burrow: S2 stages its own Filth_Dirt mound at x 155-156; bank wildlife may drift in |
| S3 mengwu-3-noon-nap | hut, 12:00 | ok | bonsai pot, lit brazier | Pallas's cat asleep | same outfit | steps in softly, about to leave | medium, zoom 9 | ok | cat reads | 4 | `lies at (x, z) facing` step exists, not played; ticks must pass before the shot |
| S4 mengwu-4-dusk-hop | bare-clearing, 18:00 | ok | YellowTallGrass, flowers | jerboa + cat | same outfit | just before the pounce, carries Kibble | tight-medium, zoom 5 | ok | both small, 268 px risky | 4 | `forced into the job "PredatorHunt"` exists, not played; N ticks to tune |
| S5 mengwu-5-night-gate | enclosure-south west gate, 21:00 | ok | TorchLamp, Brazier lit | horse, marmot, jerboa outside | same outfit | latches the gate, last animal just in | wide, other rectangle | ok | horse reads | 4 | night light |



Scenarios S2 to S4 written 2026-10-27 in `Tests/Pickle/Mod/Pickle/Features/10-gallery.feature` (names `mengwu-2-the-mound`, `mengwu-3-noon-nap`, `mengwu-4-dusk-hop`) with `Tests/Pickle/wsl-deps.gallery.map`. `Check-Steps.ps1`: every step line resolves to exactly one expression, none played. S1, S5, S6 not written yet. Correction: the "burrow" of water-garden is a steam geyser; S2 stages its own mound. Next: small ticket for S2 to S4 (`file-pickle-ticket`, `-DepMap wsl-deps.gallery.map`, `-Filter` the full feature stem), send NPT the failure text of any step.
