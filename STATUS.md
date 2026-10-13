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
workflow_stage: settings[0.1.0]
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
  - unverified: the four animal integrations are patched (2026-10-13, Mod/Patches/Compat_*.xml, About.xml loadBefore ADS 2) but no Pickle pass mounts the optional mods yet (ANIMALS.md: "avec facultatifs"). Resolve at playTests, as a small ticket.
  - unverified: French review by Virginie (4 wording corrections applied to MG_TuSun; review still in progress, TRANSLATIONS.md). translation_fr stays partial; required complete before leaving writeTests (6.g).
  - unverified: juvenile and baby graphics of the four animals (TEST_SCENARIOS.md F04) have no Pickle coverage and no written N/A (7.e).
  - unverified: tested criteria (AUDIT.md 8): Pickle pass 1 green EN and FR, @review captures read, pass 2 green (2026-09-29, non-regression). No @wip, no manual test left (TESTING.md).
  - unverified: working tree holds uncommitted Art/ changes and Mod/About ModIcon.png and Preview.png regenerations (not from this session): not reviewed, not committed.
session:      mengwuexpandedanimals / settings[0.1.0]
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
