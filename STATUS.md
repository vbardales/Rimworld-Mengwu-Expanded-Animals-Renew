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
workflow_stage: playTests[1.0.0]
upstream_mod_remotes:
  - N/A
licence:      silent
licence_at:   ATTRIBUTION.md; installed source About.xml checked 2026-09-13
dependencies: none
showcase:     Mod/About/Preview.png
tested_on:
workshop:     3811291533 (0.1.0 prepublished; target version now 1.0.0, owner decision 2026-10-13, private; PublishedFileId.txt committed ef17ade, 2026-10-02)
remaining:
  - defect: Pickle pass 1 (EN/FR) never produced a verdict. Initial diagnostic tickets filed 2026-10-13 at b0f72d0 (sans-facultatifs EN and FR, avec-facultatifs; ids in docs/runs/pickle.md). Verdicts pending: Mod/ and Tests/ stay on b0f72d0 until RUN_DONE.
  - unverified: the four animal integrations are patched (2026-10-13, Mod/Patches/Compat_*.xml, About.xml loadBefore ADS 2). Pickle written, not run (7.d): `Tests/Pickle/wsl-deps.avec-facultatifs.map`, features 05 (ADS 2), 06 (Nocturnal), 07 (Better Crossbreeding). Steps of 06 and 07 come from NPT (DefFieldSteps, built, uncommitted, not played: wait for NPT's next message). Dogs mate scenario added to 07 (NPT step "the pawn kind ... is in the mating group ...", written, not played). Run at playTests as a small ticket.
  - unverified: juvenile and baby graphics (F04): `08-life-stages.feature` written (ScreenshotStudio step "an animal of kind ... at the life stage ..."), not run; captures to read at playTests.
  - unverified: Mod options list shows no entry for this mod (settings_audit not_applicable, 5.b); check in game at playTests.
  - unverified: tested criteria (AUDIT.md 8): Pickle pass 1 green EN and FR, @review captures read, pass 2 green (2026-09-29, non-regression). No @wip, no manual test left (TESTING.md).
session:      mengwuexpandedanimals / playTests[1.0.0]
updated:      2026-10-13
protocols_read_sha: b9e70d5f65c63f769ac01131f6873b6055e4face
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
- Dogs mate: MG_Horse joins group Horse. Other three: no group fits (no documented hybrid; joining Squirrel would alter the vanilla squirrel).
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
