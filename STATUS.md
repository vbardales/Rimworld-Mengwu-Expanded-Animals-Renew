---
localization: complete
translation_en: complete
translation_fr: partial
settings_audit: not_applicable
mod:          Mengwu Expanded - Animals Renew (unofficial)
packageId:    nelim.mengwuexpandedanimals
repo:         Rimworld-Mengwu-Expanded-Animals-Renew
visibility:   public
detached:     yes
workflow_stage: writeTests[0.1.0]
upstream_mod_remotes:
  - N/A
licence:      silent
licence_at:   ATTRIBUTION.md; installed source About.xml checked 2026-09-13
dependencies: none
showcase:     Mod/About/Preview.png
tested_on:
workshop:     3811291533 (0.1.0 prepublished, private; PublishedFileId.txt committed ef17ade, 2026-10-02)
remaining:
  - defect: Pickle pass 1 (EN/FR) never produced a verdict. The two 2026-09-30 reruns were red (map lacked the InspectTabs companion, fixed 2026-10-02) and the two 2026-10-02 tickets (20261002-204744-460-bfdd, -614-1f76) ended `invalid` at the dispatcher (empty owner and mod, log gone). No pass-1 ticket is queued. Resubmit at playTests only (AUDIT.md 8.c).
  - unverified: the four animal integrations are patched (2026-10-13, Mod/Patches/Compat_*.xml, About.xml loadBefore ADS 2). Pickle: `Tests/Pickle/wsl-deps.avec-facultatifs.map` and `05-animal-prosthetics.feature` written, not run (7.d). Nocturnal, Dogs mate and Better Crossbreeding scenarios are not written: they need shared Pickle steps (body clock, crossbreeding partner and outcome, mating group) that exist only as local steps in Funny Creatures Renew and A Certain Series; owed to NPT (PickleTools). Run at playTests as a small ticket.
  - unverified: French review by Virginie (4 wording corrections applied to MG_TuSun; review still in progress, TRANSLATIONS.md). translation_fr stays partial; required complete before leaving writeTests (6.g).
  - unverified: juvenile and baby graphics of the four animals (TEST_SCENARIOS.md F04) have no Pickle coverage and no written N/A (7.e).
  - unverified: Mod options list shows no entry for this mod (settings_audit not_applicable, 5.b); check in game at playTests.
  - unverified: tested criteria (AUDIT.md 8): Pickle pass 1 green EN and FR, @review captures read, pass 2 green (2026-09-29, non-regression). No @wip, no manual test left (TESTING.md).
  - unverified: working tree holds uncommitted Art/ changes and Mod/About ModIcon.png and Preview.png regenerations (not from this session): not reviewed, not committed.
session:      mengwuexpandedanimals / writeTests[0.1.0]
updated:      2026-10-13
protocols_read_sha: 2f4e0002e2543fcde57999c51ff8b2f0dfc8efdb
---

# Mengwu Expanded - Animals Renew: status

## Audit 2026-10-12 (replaces the 2026-10-02 stage decision; older journal in docs/runs/status-journal.md)

Audited revision 8d867cb. Old vocabulary l10n maps to declareDependencies (AUDIT.md section 16). First failing transition: declareDependencies[0.1.0] -> auditSettings, criterion 4.f (animal integrations untreated). Gates 4.a-4.e unchanged (Core-only content, no patch, no LoadFolders; audit 2026-09-13), not re-run now.

Retired field stage: removed. protocols_read_sha written by Mark-ProtocolsRead.ps1. Journal moved out (file was 49 KB).

Closing pass 3 (mod root clean), 2026-10-12: `.build/` removed (regression-guard scratch now in the system temp folder, `.gitignore` entry dropped); `_tools/Generate-FrenchReview.ps1` deleted, FRENCH_REVIEW.md regenerated with the shared `scripts/Make-FrenchReview.ps1` (`french-review-sources.json`: Original from the Defs, English from Languages/English); duplicate `TRADUCTION.md` removed. Automated and XML checks replayed green (`Tests/Run-Tests.ps1`, 56 keys, 0 errors). Root entries left to rule on: `.claude`, `.editorconfig`, `output/`, `Workshop/`.

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
- `translation_fr: partial`: Virginie's review not finished (4 corrections applied to MG_TuSun so far); required complete before leaving `writeTests` (6.g). In-game raw keys, fallback text and clipping: `unverified` until `playTests`.

Decision 2026-10-13 (Virginie): English labels stay faithful to the original author, `Rabbit mantle` (MG_TuSun) and `Mogul Leaping Bunny` (MG_TiaoShu) are kept even though the animals are a Pallas's cat and a jerboa (ATTRIBUTION.md, "The translation"). The descriptions and the French labels name the real animals. Not a defect.
