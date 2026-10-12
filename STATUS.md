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
workflow_stage: declareDependencies[0.1.0]
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
  - feature: the four animal-mod integrations (ADS 2, XND Nocturnal Animals, Dogs mate, Better Crossbreeding; ANIMALS.md, AUDIT.md 4.f) are not treated: each needs a guarded optional patch, or a written reason it does not apply to the animal, recorded here. First failing transition: declareDependencies -> auditSettings.
  - unverified: French review by Virginie (4 wording corrections applied to MG_TuSun; review still in progress, TRANSLATIONS.md). translation_fr stays partial; required complete before leaving writeTests (6.g).
  - unverified: juvenile and baby graphics of the four animals (TEST_SCENARIOS.md F04) have no Pickle coverage and no written N/A (7.e).
  - unverified: tested criteria (AUDIT.md 8): Pickle pass 1 green EN and FR, @review captures read, pass 2 green (2026-09-29, non-regression). No @wip, no manual test left (TESTING.md).
  - unverified: working tree holds uncommitted Art/ changes and Mod/About ModIcon.png and Preview.png regenerations (not from this session): not reviewed, not committed.
session:      mengwuexpandedanimals / declareDependencies[0.1.0]
updated:      2026-10-12
protocols_read_sha: 7e2994b43fb5b05d704694cbedc2e08ce4ea08e2
---

# Mengwu Expanded - Animals Renew: status

## Audit 2026-10-12 (replaces the 2026-10-02 stage decision; older journal in docs/runs/status-journal.md)

Audited revision 8d867cb. Old vocabulary l10n maps to declareDependencies (AUDIT.md section 16). First failing transition: declareDependencies[0.1.0] -> auditSettings, criterion 4.f (animal integrations untreated). Gates 4.a-4.e unchanged (Core-only content, no patch, no LoadFolders; audit 2026-09-13), not re-run now.

Retired field stage: removed. protocols_read_sha written by Mark-ProtocolsRead.ps1. Journal moved out (file was 49 KB).

Closing pass 3 (mod root clean), 2026-10-12: `.build/` removed (regression-guard scratch now in the system temp folder, `.gitignore` entry dropped); `_tools/Generate-FrenchReview.ps1` deleted, FRENCH_REVIEW.md regenerated with the shared `scripts/Make-FrenchReview.ps1` (`french-review-sources.json`: Original from the Defs, English from Languages/English); duplicate `TRADUCTION.md` removed. Automated and XML checks replayed green (`Tests/Run-Tests.ps1`, 56 keys, 0 errors). Root entries left to rule on: `.claude`, `.editorconfig`, `output/`, `Workshop/`.

Next: treat or justify the four integrations (own patch and own Pickle pass where a patch lands), then auditSettings.
