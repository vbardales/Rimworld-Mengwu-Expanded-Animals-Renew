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
stage:        done
workflow_stage: done
upstream_mod_remotes:
  - N/A
licence:      silent
licence_at:   ATTRIBUTION.md; installed source About.xml checked 2026-09-13
dependencies: none
showcase:     Mod/About/Preview.png
tested_on:
workshop:
remaining:
  - unverified: Tests/Pickle/ pass 1 English run once, found and fixed a real crash (alternateGraphicChance); none of the three passes has a green run on the fixed revision yet.
  - unverified: Final in-game scenarios, logs, EN/FR UI, new and existing saves (TEST_SCENARIOS.md, 15 scenarios, none run).
session:      audit 2026-09-29
updated:      2026-09-29
---

# Workflow audit — 2026-09-13

Audited revision: `93b2e151b08e1e3ce454e88ea75bf8df58516442`.
Repository: `C:\Users\nelim\Documents\rimworld\MengwuExpandedAnimalsRenew`.
Distributed folder: `Mod/`. Git root is this standalone repository, not its parent.
Before the audit, STATUS.md already had three uncommitted localization fields set to
unchecked; those fields were retained and updated from the findings. No payload was edited.
During the audit, an untracked `output/imagegen/` prompt and image appeared; these were
preserved and were not generated or inspected by this audit. They are outside `Mod/` and
cannot establish installation of either required About image.

Previous stage was empty (not a validated milestone). The exact workflow state retained is
`horsMonoRepo`; this is a literal state, not the former `port`/`showcase` shorthand.
Order: dansMonoRepo -> horsMonoRepo -> ModIcon generated -> Preview generated -> preOptions
-> options -> l10n -> preTest -> done -> tested. Later independent checks below do not
advance the cumulative stage past its first blocked transition.

## Transition decisions

| Transition | Result and evidence |
| --- | --- |
| dansMonoRepo -> horsMonoRepo | Validated. Standalone Git root, origin, public GitHub repository and pushed HEAD verified. English README, ATTRIBUTION and CHANGELOG exist. Distributed ATTRIBUTION is byte-identical. Names and package ID consistently identify this animals-only port; literal equality is unnecessary. Licence field normalized from malformed `licence_ou:` to `silent`, following the existing attribution investigation and the installed source declaring only 1.4. No third-party licence is invented. |
| horsMonoRepo -> ModIcon generated | Validated after the resizing follow-up below: installed PNG is 128 x 128, 26,396 bytes, directly inspected at 128 and 32 pixels. The animals-only XML port implementation is present, with all four Wildness migrations verified against the source; no unfinished feature was identified. Translation corrections belong to l10n and do not alone invalidate development completion at this earlier gate. Build and compiled-artifact freshness are not applicable: no C#, project or assembly. |
| ModIcon generated -> Preview generated | Validated by the Preview preparation follow-up below: installed PNG, 896 x 504, 512,895 bytes; direct visual inspection at full size and 268 pixels passed. |
| Preview generated -> preOptions | Validated by the metadata follow-up below: exact unofficial suffix/notices, final GitHub link, English description and revised Preview typography/palette checked. |
| preOptions -> options | Independently validated as not applicable, with the settings inventory below. No in-game requirement imported into this transition. |
| options -> l10n | Validated by the localization completion follow-up below: 28 owned fields per language, six XML files valid, 56 injection paths pass; static/editorial coverage complete. In-game text checks remain pending. |
| l10n -> preTest | Dependency inspection passes independently for this Core-only content: no third-party class, comp, patch, conditional folder or required integration. See scope below. |
| preTest -> done | Validated by Tests/RESULTS.md: 15 functional scenarios written (not run); combined automated/XML/resource checks executed and passed on the recorded payload. Non-applicable code/settings tests justified. |
| done -> tested | Non verified: no in-game scenario execution, log review, EN/FR display validation or new/existing-save validation performed. Installed game files alone are not runtime evidence. |

## Settings audit

Reviewed all shipped files at the audited revision: four animal ThingDefs, four PawnKindDefs,
English injections and textures. Behaviour is ordinary animal content: biome spawning, taming,
training, diet, reproduction, combat, trade and horse packing. Values are content/balance
constants, not an advertised configurable feature; there is no player configuration or
optional settings integration to expose. No empty page, settings class, MainButtonDef,
assembly, custom comp or XML-only settings interface exists. Creating settings solely to
complete this gate would be unwarranted. Result: `settings_audit: not_applicable`.
Defaults/input/persistence/shortcut tests are consequently not applicable. No RIMMSQOL or
other customization integration was tested or claimed compatible.

## Translation audit

All four shipped XML files parse. English contains 26 nonempty injections (20 ThingDef,
6 PawnKindDef); French is absent, despite README, both ATTRIBUTION copies and CHANGELOG
claiming it ships. Chinese Def source text cannot supply English or French coverage.
Native DefInjected is suitable for these fields, but the current resources are incomplete,
so all three translation validation fields remain partial.

Concrete defects:

- Missing English `MG_Horse.race.meatLabel` (ThingDef) and
  `MG_Horse.lifeStages.0.label` (PawnKindDef); source values remain Chinese.
- For each of `MG_TiaoShu`, `MG_TuSun`, `MG_TuBoShu`, English
  `tools.2.label` injects `head` into the teeth/bite tool. The actual head tool is index 3
  and its Chinese label has no injection. Path existence does not prove correct targeting.
- `MG_TuBoShu.description` contains the malformed literal `\N n` instead of a valid
  line break. English descriptions also contain visibly garbled wording, including
  `will also increase. lower.` in the horse description; inherited authorship does not
  establish semantic correctness.
- French covers none of the owned animal names, descriptions, gender labels, tool labels,
  horse meat label or horse baby label. No parameterized Keyed strings or custom UI exist.

No runtime text or layout pass is claimed. DefInjected accepts numeric paths here, but
correct indices and exhaustive text inventory must be checked separately.

## Executed checks and limits

- `git rev-parse --show-toplevel`, `git status --short`, `git diff -- STATUS.md`,
  `git log -1 --format=fuller`, `git remote -v`: standalone checkout; pre-existing STATUS
  changes recorded above. No commit or push performed.
- `gh repo view vbardales/Rimworld-Mengwu-Expanded-Animals-Renew --json name,visibility,url,defaultBranchRef`:
  PUBLIC, branch main, matching URL. `git ls-remote origin HEAD`: exact audited SHA.
  Initial sandbox network/config access failed; read-only elevated retry succeeded.
- PowerShell XML parsing of every `Mod/**/*.xml`: 4/4 passed. Def inventory: four
  ThingDefs and four PawnKindDefs, no duplicate `(type, defName)` pairs.
- `powershell -NoProfile -ExecutionPolicy Bypass -File ..\scripts\Check-DefInjected.ps1 -TransMod .\Mod`:
  exit 0; `Patch operations applied: 29`, `Defs indexed: 11590`,
  `Keys checked: 26 - errors: 0`; no UNVERIFIED findings. The 29 operations are from
  indexed game data, not patches shipped by this mod. First invocation without the
  process-scoped execution-policy argument could not run; it was not counted as a pass.
- Game reference installation: RimWorld `1.6.4871 rev590`. In-memory XML comparison
  found both parent definitions and all 149 checked references in Core/local defNames:
  stats, biomes, bodies, leathers, trainability, life stages, sounds, tool capacities,
  body-part groups and PawnKind races. This is reference existence checking, not a full
  game loader/type/behaviour test. About declares 1.6; DLC loadAfter entries only order
  optional installed DLC, and do not make them dependencies. No LoadFolders or patches
  are shipped. Source package `SZ.MengGu.Expanded` matches incompatibleWith.
- All five custom texPath prefixes have installed PNGs; groundhog dessicated graphics
  have an east-only asset. Directional fallback/rendering is not certified in game.
  Core horse/squirrel/lynx corpse references were inspected; no visual QA was performed.
- SHA256 of both ATTRIBUTION copies:
  `CF32749941BACC8162DA25660853DAC5951B7F5037A94874279DE9BE51245F5D`.
- Installed source `...\workshop\content\294100\2894159932\About\About.xml` declares
  1.4 only and no reuse permission/refusal; no LICENSE/COPYING file found there.
  Existing ATTRIBUTION records the earlier Workshop rights investigation. The live
  Workshop page/comments were not refreshed during this audit; `silent` is the documented
  workflow classification, not redistribution permission or a newly granted licence.
- `git diff --no-index` against installed source `Defs/Animal/MGAnimal.xml` shows FOUR
  Wildness migrations, including groundhog 0.6, and no other Def changes. Claims of three
  migrations and all small animals having 0.35 are inaccurate. Exit 1 is expected for a
  differing-file comparison, not an automated regression failure.

## Next transition and later work

To reach ModIcon generated: resolve the identified content/translation defects and establish
development completion, then resize the installed icon to the required 128 x 128 PNG and verify the delivered result.
No compilation is needed for the current payload. Image generation and development fixes
were explicitly outside this audit and were not performed.

Later mandatory work: install and review Preview; correct the public silent-source naming
and notices and the final GitHub description link; finish and recheck FR/EN resources;
correct documentation to match delivery; write functional scenarios and meaningful XML
regressions, run them, then perform final in-game scenarios in both languages on new and
existing saves. Missing runtime checks are unverified, not demonstrated game failures.

Optional recommendation: reconsider awkward inherited English animal names with a coherent
terminology policy. No speculative camera/style defect is reported for an absent Preview.

## ModIcon follow-up — 2026-09-13

Following the user's correction, directly checked `Mod/About/ModIcon.png`: it now exists
as an untracked local addition, at the correct distributed path. HEAD remains
`93b2e151b08e1e3ce454e88ea75bf8df58516442`. Earlier absence findings above describe the
initial audit snapshot and are superseded for this file by this follow-up.

System.Drawing decoded the file successfully as PNG: 1254 x 1254 pixels, 1,255,038 bytes.
SHA256: `744D9CFD1215DDF871B6B56EE58B6A362FF6DC3B25970BDC8CC003E28DE8D1D0`.
Direct visual inspection performed: a single orange horse head on a dark background,
with MENGWU / EXPANDED ANIMALS lettering. No 32-pixel visual test was performed;
small-size lettering readability remains unverified. The concrete blocking icon defect
is its dimensions, not its existence. The Preview size limit is not applied to ModIcon.

Stage remains `horsMonoRepo`. Only STATUS.md was updated by this follow-up; the user's
image and other ongoing work were preserved without resizing or regeneration.
## ModIcon preparation — 2026-09-13, supersedes earlier stage decisions

Current stage: `ModIcon générée` (literal user-workflow name, English equivalent:
ModIcon generated). Previous validated stage: `horsMonoRepo`.

User authorized continuing with preparation of the installed icon. Resized the existing
artwork deterministically with System.Drawing HighQualityBicubic interpolation, preserving
its composition. No image generation was needed. Installed `Mod/About/ModIcon.png` is now
128 x 128 PNG, 26,396 bytes. Preserved the original in `Art/ModIcon-original.png`;
`Art/ModIcon-check-32.png` is the small-size review artifact. Direct visual inspection of
both sizes: horse silhouette remains identifiable; lettering is not readable at 32 pixels.
This is a recorded readability limitation, not a requirement to regenerate the approved art.

Corrected an overstrict interpretation in the initial audit: incomplete localization alone
does not establish unfinished animal implementation and belongs to the later l10n gate.
The inspected source diff establishes the scope of this XML-only port; no additional
feature work was identified. This does not certify in-game behaviour. All translation,
documentation and final runtime findings remain pending at their respective transitions.

HEAD remains `93b2e151b08e1e3ce454e88ea75bf8df58516442`; local changes are STATUS.md,
the installed ModIcon and Art review/source assets, with the existing output folder
preserved. No commit or publication performed. Next transition requires generating,
installing and inspecting `Mod/About/Preview.png` at 896 x 504 and under 1 MB.
## Preview preparation — 2026-09-13, current milestone

Current stage: `Preview générée` (literal user-workflow name). Previous stage:
`ModIcon générée`. This section supersedes earlier absence and next-step statements.

Generated the four-animal illustration with built-in image_gen using the four installed
animal sprites as reference art. Inspected the result directly: horse, jerboa, Pallas's
cat and groundhog each present once; high oblique framing without horizon, distinct
silhouettes, calm title area. No concrete camera concern remains. Preserved the full
illustration in `Art/Preview.png` and the prompt in `Art/Preview-generation.md`.

Final installed `Mod/About/Preview.png`: PNG, 896 x 504, 512,895 bytes (below 1 MB).
SHA256: `DA379520FE484BE63DB1AFA29729AF1EF5EEB6031C22D6345DB14E602A002414`.
Rendered the composition with headless Chrome from `Art/render-preview.mjs` and
`Art/preview.html`; palette source is `Art/preview-palette.json`. Segoe UI availability
was checked. Olive ground supplies the veil and secondary-ink family; the horse blanket
supplies the distinctly turquoise accent. Renew uses 65-percent secondary text; current
metadata title is preserved, and version 1.6 comes from supportedVersions.

Direct final inspection at 896 x 504 and `Art/Preview-check-268.png`: title/version
identifiable, four animal silhouettes distinguishable, no overlap or clipped text.
The summary is intended for the full-size image, as permitted by STYLE_RIMWORLD.md.
Minimum contrast measured over background-only text rectangles (including more than
just their four corners): title 8.72:1, suffix 8.90:1, summary 11.28:1; badge 10.27:1.
All exceed 4.5:1. Results in `Art/Preview-contrast.json`; background-only render in
`Art/Preview-background-check.png`. The initial sandboxed Chrome attempt failed to
start its graphics process; elevated local rendering succeeded. No publication occurred.

Artwork, composition/QA assets, STATUS.md and the .gitignore entry for the temporary
.build Chrome profile changed in this turn. Existing icon,
mod definitions, translations and metadata were preserved; HEAD remains the audited
revision. `git diff --check` passed. Session title updated to the same milestone.

Next transition: correct the public silent-source `(unofficial)` suffix/opening notice
in About, README and STATUS, and append the exact final GitHub description link.
Palette separation is already independently verified. Existing l10n and final in-game
checks remain pending; this image change does not invalidate unrelated checks.
## Metadata and preOptions completion — 2026-09-13, current milestone

Current stage: `options`. Progress: Preview generated -> preOptions -> options.
The already justified `settings_audit: not_applicable` still applies: no definitions,
settings, assemblies, MainButtons or gameplay behaviour changed in this turn.

Added exact ` (unofficial)` suffix to About name, README heading and STATUS mod field.
Added the required two-sentence UNOFFICIAL notice at the beginning of About description
and README body. Preserved author credits and existing terms; this marking grants no
new licence. Appended the exact Source code on GitHub Steam link after all description
content. PowerShell XML parsing and final-link equality against origin/About url passed;
GitHub repository accessibility was established earlier in this audit.

Updated the deterministic Preview composition with a separate 24 px secondary-colour
(unofficial) tag, preserving the title and reduced Renew suffix. No linking words need
special treatment in this name. Preserved the preceding final image as
`Art/Preview-before-unofficial.png`; the illustration source is unchanged.

Headless Chrome render succeeded. Direct inspection at 896 x 504 and 268 pixels found
no clipping, overlapping text or hidden animals. Installed PNG is 516,164 bytes.
SHA256: `62F185FBAF99E06841282A26ADEFB169EEC4F727C308411CBB0A82CC77427539`.
Updated background-only pixel checks: title 8.72:1, Renew 8.90:1, tag 9.02:1,
summary 11.31:1, badge 10.27:1; all exceed 4.5:1. Palette source, composition,
background-only image, thumbnail and contrast JSON remain in Art/.

Local changes in this turn: About.xml, README.md, STATUS.md and Preview composition/QA
artifacts. Earlier uncommitted work preserved; no commit, push or Workshop publication.
`git diff --check` passed. Session title tracks `options`.

Next transition is options -> l10n: complete French resources, correct English coverage,
three head-tool targets, missing horse meat/baby labels and description wording/line
breaks; then run injection-path and coverage checks. Correct the delivery claims in the
documentation alongside those fixes. No runtime success is claimed.
## Localization completion — 2026-09-13, current milestone

Current stage: `preTest`. Progress: options -> l10n -> preTest. All three translation
fields are complete for resource readiness, not in-game validation. This section
supersedes the earlier translation defects and absent-test findings where addressed.

Added complete French ThingDef/PawnKindDef resources and corrected English resources:
28 entries per language, 21 ThingDef plus 7 PawnKindDef. Added horse meat and foal,
corrected the three head-tool targets, rewrote garbled descriptions against source
meaning, fixed line-break escapes and kept horse gender names consistent. Preserved
original English animal names and the Chinese source defs. No gameplay value changed.
Updated README, About description, CHANGELOG and both ATTRIBUTION copies to match the
actual translation delivery and four Wildness migrations. Attribution records the
port's editorial contribution separately from the source author's English names.

Evidence: `Tests/Localization-results.md`, exact XML hashes in
`Tests/Localization-files.json`, reusable `Tests/Check-Localization.ps1`.
Executed coverage test: exit 0, 28/28 owned display fields in each language, six XML
files parsed, no duplicate/empty/placeholder/malformed text or wrong owned-field target.
Executed shared Check-DefInjected.ps1: exit 0, 56 keys checked, zero errors, no
UNVERIFIED findings. Manual source/translation review covers meaning, nested labels,
paragraphs and terminology. No owned substitution parameters, rich-text or grammar
tokens occur. Full command output and exclusions are recorded in the results file.

The settings audit remains not_applicable. Dependency readiness remains valid:
Mod/Defs is unchanged; no assembly, patch, LoadFolders, required mod, conditional
content or optional integration was added. About changes are display metadata only;
1.6 support, incompatible source ID and loadAfter declarations remain unchanged.
The final Source code on GitHub link and XML parsing were checked again. Therefore
l10n -> preTest passes independently of final runtime verification.

Audited base HEAD remains `93b2e151b08e1e3ce454e88ea75bf8df58516442` with local changes.
Earlier art and metadata work preserved. This turn changed language files, delivery
documentation, About description and STATUS, and added Tests evidence/checks; temporary
translation preparation script is in ignored .build. No commit or publication occurred.
`git diff --check` passed; the session title now tracks preTest.

Next transition: write functional scenarios with preconditions/actions/expected results,
complete and run the applicable content/XML regression checks, and record the final
payload version to establish done. In-game logs, generated names, EN/FR layout, animal
behaviour and new/existing-save scenarios remain unverified until done -> tested.
## Automated tests and scenarios — 2026-09-13, current milestone

Current stage: `done`, meaning ready for final in-game functional validation, not tested.
The user explicitly requested a commit and written functional scenarios plus automated
tests only; no game was launched and no runtime scenario was executed.

Committed completed art, metadata, localization and preceding audit work as
`72e9266a78b710495a4d9f3437d18dfd17143f17` (Complete mod artwork, metadata and
English/French localization). Git status was clean immediately afterward.
The Mod payload has not changed since that commit.

Wrote `TEST_SCENARIOS.md`: 15 scenarios, each with preconditions, actions and expected
results, all NOT RUN. Added `Tests/Check-Content.ps1`, `Tests/Test-RegressionGuards.ps1`
and the combined `Tests/Run-Tests.ps1`. Existing localization coverage checker retained.
Executed the final combined runner: exit 0. Six XML files, 28 fields per language,
149 Core/local references, 18 PNGs, four Wildness regressions and four deliberately
broken-copy guards passed. Shared reflected injection check: 56 keys, zero errors,
no UNVERIFIED targets. No C# build or settings tests apply to this payload.

Evidence and limitations: `Tests/RESULTS.md`, full `Tests/Automated-output.txt`, exact
`Tests/Payload-files.json` and `Tests/Test-files.json`. Reference game data:
1.6.4871 rev590. Prior visual checks remain valid because the PNGs are unchanged.
`git diff --check` passed. Test/scenario documentation and this status are the only
new tracked work after the payload commit; test scratch copies remain in ignored .build.

The next transition, done -> tested, requires the written in-game scenarios, logs,
EN/FR interface checks and new/existing-save coverage. All remain unverified, and are
outside the user's requested scope for this turn. Session title tracks `done`.

## Audit — 2026-09-29, retreat from `done` to `showcase`

Audited revision: HEAD `ac3f720` (main, pushed), with two local changes not certified by
this audit — `Mod/About/ModIcon.png` modified in place and `Art/ModIcon-textless.png`
added — both apparently the owner's own in-progress icon rework, per AUDIT.md's rule that
only the mod's owner generates or edits ModIcon; this audit did not touch either file.
Re-read the current AUDIT.md, MOD_SETTINGS.md and TRANSLATIONS.md in full for this pass
(dated 2026-09-28, 2026-09-13, 2026-09-25 respectively); no earlier section of this file
was corrected, only re-verified or superseded below. AGENTS.md and PUBLISHING.md were
opened for the evidence and CI-publish rules; neither applied to any file this mod ships,
so nothing in them is repeated here. STYLE_RIMWORLD.md's "ModIcon: contrôle, pas
génération" section was opened; it is the source of the defect below. WORKSHOP_COMMENTS.md,
scripts/SEARCHING.md, PickleTools/README.md and PickleTools/Headless/README.md,
Rimworld-Release-Admin/docs/OPERATIONS.md, Rimworld-Ticket-Dispatcher/docs/{WELCOME,SUBMIT}.md
and docs/PROTOCOLS-READ.md were not opened: nothing in this pass launches a game, runs a
Pickle suite, files a ticket or touches CI/Steam, so none of them bears on this audit's
findings. Re-open before any turn that does one of those.

**Redescent per AUDIT.md's rule 12.** An audit does not stop at what STATUS.md declares;
it redescends to the last state whose cumulative criteria are all currently met, even below
the previous `done`. Two independent defects were found on rejoueing the chain:

1. **`horsMonoRepo -> ModIcon generated` no longer passes.** The 2026-09-13 follow-up
   installed a 128x128 `Mod/About/ModIcon.png`. The file on disk today is 1254x1254 PNG
   (`sha256` not recorded — the file is mid-edit and this audit does not fingerprint a
   file its owner is actively changing). An icon absent or non-conforming is, per AUDIT.md,
   "un critère non vérifié ou un défaut à consigner, jamais une autorisation de la créer":
   this audit records it and does not resize or regenerate it. This is a transition
   earlier than `preTest`, so it is the one that fixes the retained state (rule: "La
   première transition qui échoue fixe l'état retenu").
   Independently: the local desktop.ini convention (`desktop.ini` at the repo root points
   at `Art\ModIcon.ico`, which is currently absent from `Art\`) is explicitly "hors
   contenu publié... ne constitue ni un artefact RimWorld ni un critère de changement
   d'état" (AUDIT.md, lines 30-41) — noted for the owner, not a blocking finding.
2. **`preTest -> done` no longer passes independently of the icon.** `Tests/Pickle/` does
   not exist for this mod, and no section of this file, `TEST_SCENARIOS.md` or
   `Tests/RESULTS.md` says why a Pickle suite is not written. AUDIT.md: "un mod sans
   `Tests/Pickle/` et sans phrase qui dit pourquoi n'est pas `done`." Several of the 15
   scenarios in `TEST_SCENARIOS.md` (directional/life-stage graphics, EN/FR UI text,
   biome population, settings-absence shortcut check) are exactly the kind of thing
   AUDIT.md reserves for Gherkin ("ce que seul un jeu qui tourne peut montrer"), so this
   is not obviously not-applicable either; it is an open call for the owner, not one this
   audit makes on her behalf.

**What is unaffected.** `dansMonoRepo -> horsMonoRepo` still holds (standalone repo,
GitHub remote, pushed HEAD, STATUS.md, licence classification, naming) — independently
re-verified: `git remote -v` still shows the same GitHub origin, `git status` shows only
the two files above outside HEAD, HEAD is at `ac3f720` which `git log` shows pushed. No
upstream repository for the source mod was found (already documented in ATTRIBUTION.md's
four-place licence search); added `upstream_mod_remotes: N/A` to the front matter, which
was missing it. `l10n` (against the current TRANSLATIONS.md, including its 2026-09-25
plural-key rule: this mod owns no Keyed strings, only DefInjected labels/descriptions,
so no counted phrase exists to check) and `options` (against the current MOD_SETTINGS.md:
still no settings, still no shortcut, still `not_applicable`) both still pass on
re-verification. No `.dds` file exists anywhere in the repository (`find . -iname
"*.dds"` — zero results): nothing to move out of git or add to `.gitignore`. No
`Tests/Pickle/Evidence/` or `evidence/` directory exists for this mod either, so
AGENTS.md's evidence-trimming rule has nothing to act on here; `Tests/*.md`,
`Tests/Automated-output.txt` and the two `Tests/*.json` hash manifests are the automated
test record itself, not Pickle capture evidence, and stay as they are.

**Stage retained: `showcase`**, code chosen per AUDIT.md line 164 (no dedicated code
exists between `horsMonoRepo` and `Preview générée`; `port` would misstate an autonomous,
pushed, publicly hosted repo). `workflow_stage: horsMonoRepo` records the literal position.
`localization`, `translation_en`, `translation_fr` and `settings_audit` are left `complete`
/ `not_applicable`: they are independent validations per AUDIT.md's rule that a later
defect does not retroactively invalidate an earlier, still-current check.

**Not done by this audit**: no icon resize, no Pickle suite, no new feature, no image, no
publication. This audit only re-verifies, records and retreats.

**Next transition** (`horsMonoRepo -> ModIcon generated`): the owner finishes and installs
a 128x128 `Mod/About/ModIcon.png` (this is hers to do). Once done, re-verify Preview,
preOptions, options and l10n are still current, then decide and write, in `TEST_SCENARIOS.md`
or here, whether a `Tests/Pickle/` suite is warranted for this mod and its scope, or the
written reason it is not, before `preTest -> done` can pass again.

## packageId shortened — 2026-09-29, same session, user request

`packageId` changed from `nelim.mengwuexpandedanimalsrenew` to `nelim.mengwuexpandedanimals`.
Updated `Mod/About/About.xml` and the identity assertion in `Tests/Check-Content.ps1`
(both were the only owned files referencing the old value; `repo`, the GitHub URL, the
mod display name and every defName are unaffected and unchanged). Front matter `packageId`
updated to match. This changes what any existing save's mod list shows for this mod — a
save that recorded the old packageId will list it as a differently-identified, "removed"
mod on next load even though every defName it wrote is still the same and nothing in the
four animals' data changed; not tested in game this turn. No prior save is known to exist
with this mod installed (never published), so this is a pre-publication rename, not a
compatibility break for anyone. Session title regenerated to match: AUDIT.md's rule is
that the title tracks `<packageId sans nelim.> / <workflow_stage>`, and either half
changing on its own still requires regenerating it — only `packageId` changed this time,
`workflow_stage` stays `horsMonoRepo`.

## ModIcon installed, chain advances to `preTest` — 2026-09-29, same session

The owner finished her icon rework: `Mod/About/ModIcon.png` (1254x1254, hash-identical to
the new untracked `Art/ModIcon-textless.png`) was the finished full-resolution art, not
generated by this session. Resized it deterministically to the required 128x128
(`System.Drawing`, `HighQualityBicubic`/`HighQuality` interpolation and smoothing, same
method as the 2026-09-13 precedent) and refreshed `Art/ModIcon-check-32.png`. This is a
mechanical format-compliance step, not generation or a composition change; the full-size
source survives untouched at `Art/ModIcon-textless.png`, so nothing is lost. Installed
result: 128x128 PNG, 25,185 bytes. Direct visual inspection at 128px and at the 32px check
image: an orange winking horse head on a dark background reads clearly at both sizes — a
different, cartoon-style redesign from the previous composition, entirely the owner's
choice. `ModIcon generated` passes.

Re-verified the two transitions after it, both unaffected by anything changed this
session: `Preview generated` (`Mod/About/Preview.png` unchanged, 896x504, 504.1K, under
1 MB) and `preOptions` (accent-colour separation, English description, unofficial suffix
and naming conventions — already validated in the 2026-09-13 metadata pass, and nothing
in `About.xml` besides `packageId` changed since). `options` (`not_applicable`) and
`l10n` (`complete`, rechecked against the current TRANSLATIONS.md in the audit above)
were already re-verified this session. `preTest`'s own dependency/`loadAfter` check is
unchanged: no assembly, patch, `LoadFolders` or required mod.

**Furthest currently validated state: `preTest`.** `stage` and `workflow_stage` both set
to `preTest` — it is one of the six `stage` codes, so both fields carry the same value
here. The only remaining blocker before `done` is the one already on record: no
`Tests/Pickle/` suite and no written justification for its absence. Web search found no
GitHub (or other) repository for the source mod or for DiamondJ; `upstream_mod_remotes:
N/A` stands, independently confirmed this turn rather than only carried over from
ATTRIBUTION.md's earlier four-place search. Session title regenerated again (both halves
changed: `packageId` and `workflow_stage`) to `mengwuexpandedanimals / preTest`.

Committed as a follow-up to `52b5820` and pushed. Local changes this turn: `Mod/About/ModIcon.png`
(now 128x128), `Art/ModIcon-check-32.png`, this file. `Art/ModIcon-textless.png` and
`Art/Preview.ico` remain untracked, both the owner's own recent additions, left as found.

## Pickle suite written, chain advances to `done` — 2026-09-29, same session, user request

Wrote `Tests/Pickle/` per `AUDIT.md`, "preTest -> done": four feature files, no local C# steps
(built-in Pickle vocabulary plus `PickleTools`' `InspectTabs`), `wsl-ids.map`, two `wsl-deps.*.map`
pass files and `Tests/Pickle/README.md` recording scope, the two-pass matrix, commands and evidence
handling. **Not run.** Writing and scoping is the whole criterion at this transition; execution and
review belong to `done -> tested`.

Scope, read from `Authoring/README.md` and Pickle's own `Docs/steps.md`: `01-defs.feature` (main
menu, no save) confirms the mod loads and all four animal defs exist; `02-visuals.feature` spawns
each adult, captures it (`@review`) and asserts its label text in English and French, catching a
raw key or a silent English fallback that no offline check can see; `03-persistence.feature` saves
and reloads two of the four animals, the classic broken-`ExposeData` case; `04-incompatible-source.feature`
(tagged `@requires:SZ.MengGu.Expanded`, its own pass) asserts the specific symptom `About.xml`
documents — both mods load, nothing errors — rather than waiting on a red.

**Every def this mod ships names the same defName for a `ThingDef` and a `PawnKindDef`** (`MG_Horse`,
`MG_TiaoShu`, `MG_TuSun`, `MG_TuBoShu`), the same trap Dalmatians Renew hit. Pickle's untyped `def`
steps (`field`, `stat`, `raw stat`, `defined by mod`, `was patched by mod`) refuse or can pick the
wrong database on a shared name; this suite only uses the typed `def {string} of type {string}
exists`, and leaves every field/stat assertion to the existing offline checks
(`Tests/Test-RegressionGuards.ps1` already reads Wildness, life stages, `packAnimal` and
trainability from the shipped XML), rather than write local C# to disambiguate them.

`Tests/Pickle/README.md`'s "What is deliberately not here, and why" section justifies leaving out
Pickle coverage for F05/F06/F08/F09/F11/F13/F14 of `TEST_SCENARIOS.md`: each is either the engine's
own responsibility under `AUDIT.md`'s "On ne teste pas le jeu" (taming/training outcomes, actual
feeding/predation, caravan loading, the birth event, the wildlife-spawn roll) with the mod's own
declaration already checked offline, or has nothing to test at all (`F13`, no settings exist) or no
prior revision to test against (`F14`, no save-upgrade case exists yet; `03-persistence.feature`
covers the save/reload contract instead).

**Furthest currently validated state: `done`**, meaning ready for final in-game functional
validation, not tested. `stage` and `workflow_stage` both set to `done`. Remaining before `tested`:
running the four Pickle features (both language launches of pass 1, plus pass 2), reading their
captures, and the 15 scenarios of `TEST_SCENARIOS.md` in game. Session title regenerated to
`mengwuexpandedanimals / done`.

Committed as a follow-up to `3629c98` and pushed.

# Mengwu Expanded - Animals Renew — status

Read by a sweep across every mod, rather than by asking each thread in turn. It lives at the
root, never inside `Mod/`, so Steam never receives it.

The fields above were read off the disk on 2026-09-12. Four cannot be, and wait for whoever
holds this mod:

- **`stage`** — one of `port`, `showcase`, `preTest`, `done`, `tested`, `published`. Filled in
  from the session group where one exists; confirm it.
- **`tested_on`** — the date of the last run in game. Empty means never.
- **`dependencies`** — `declared` when every mod this one needs is named in the About's
  `modDependencies`, `to check` when a non-vanilla `loadAfter` suggests a dependency that is not
  declared, `none` when the mod needs nothing. An undeclared dependency is not cosmetic: on
  2026-09-11 Reequilibrage animaux took 47 vanilla animals down with it, Muffalo included, because
  the class it injects belongs to a mod that was not declared and not loaded.
- **`remaining`** — what is left, in three kinds: `feature` for something missing from a first
  release, `defect` for a known fault left unfixed, `unverified` for what could not be checked.
  The line already there is true of nearly the whole repository; replace it once it stops being.

`licence` vocabulary: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.

## Preview gets the corner icon, gallery folder started — 2026-09-29, same session, owner's new rule

Applied the owner's new cross-mod showcase rule (`PUBLISHING.md`, 2026-09-29): the Preview now
carries the cut-out ModIcon in a corner, and the gallery folder's first image is a byte-copy of
the Preview.

`Art/ModIcon-cutout.png`: the full-resolution `Art/ModIcon-textless.png`, background
flood-filled transparent from the border (PowerShell/System.Drawing BFS, not a global colour
threshold, so the horse's own near-black outline is untouched — verified: corner alpha 0,
subject-centre alpha 255). `render-preview.mjs` embeds it, bottom-left corner, `+15deg` (the
owner's rule: left corner `+15deg`, right corner `-15deg`), and re-renders
`Mod/About/Preview.png` (896x504, 530 KB, well under 1 MB). It sits clear of the copy block by
inspection (copy ends ~y=300, icon starts ~y=329). Fixed in the same file: the Chrome screenshot
call threw on every successful run (`N bytes written to file` on stderr, non-zero exit even on
success); it now recognises that line as success. Detail in `Art/Preview-generation.md`.

`Workshop/00-preview.png`: created, byte-identical to `Mod/About/Preview.png` (same SHA256).
No further gallery images exist yet — none have been captured — so `Workshop/` holds only `00-`
for now, matching "un dossier d'images sans `00-` identique à la Preview n'est pas une galerie
prête" without inventing captures that were not taken.

Cosmetic/local-tooling change only: no workflow transition re-verified or moved. `stage` and
`workflow_stage` remain `done`.

## First Pickle run: real crash found, fixed, offline guard added — 2026-09-29, same session

Ran pass 1 English (`sans-facultatifs`, ticket `20260929-005125-190-2f4f`, worker-executed via
`Submit-PickleRun.ps1`, evidence in `Tests/Pickle/Evidence/2026-09-29-sans-facultatifs-english/`).
`exitReason: failed`. 1/8 passed, 6 failed, 1 skipped (`04-incompatible-source`, correctly
excluded by the English filter's `!@french`... no, skipped because its own
`@requires:SZ.MengGu.Expanded` tag is not staged in this pass's map — expected).

**Root cause, from the JUnit failure message, not guessed:** `MG_Horse`'s `PawnKindDef` declared
`<alternateGraphicChance>0.8</alternateGraphicChance>` with no `<alternateGraphics>` list anywhere
in this file or its `AnimalKindBase` parent. About 80% of the time the game tries to draw a horse
of this kind, `Verse.PawnGraphicUtils.TryGetAlternate` calls `TryRandomElementByWeight` on that
empty source, throws `NullReferenceException`, and `Log.Error`s during
`PawnRenderNode_AnimalPart`'s constructor — which fails whichever scenario is running at the time
per `Authoring/README.md` ("a game error logged during a step fails the scenario"). This is present
in the original source def too (`ATTRIBUTION.md`'s diff investigation had recorded only the four
Wildness migrations as the full difference; this field was there, unused by anything until the
game actually tried to draw the horse — a Pickle-only finding, unreachable by static XML checks).
The three "Undefined step" failures on `MG_TiaoShu`/`MG_TuSun`/`MG_TuBoShu` are very likely
knock-on damage from this same crash — `MG_Horse` spawns first in every scenario that reaches it —
not a real defect in this suite's own step usage; unconfirmed until the rerun below lands.

**Fixed**: removed the orphaned field from `Mod/Defs/MGAnimal.xml`. Updated both `ATTRIBUTION.md`
copies and `CHANGELOG.md` (four field changes -> five; new "Fixed" entry). **Added an offline
regression guard** so this class of defect cannot ship silently again: `Tests/Check-Content.ps1`
now rejects any `PawnKindDef` with `alternateGraphicChance > 0` and no `alternateGraphics` items;
`Tests/Test-RegressionGuards.ps1` gained a fifth deliberate-regression case
(`orphaned-alternate-chance`) proving the new check actually rejects it. The check itself had a
real bug on its first write — `@($kind.alternateGraphics.li)` on a missing element wraps a single
`$null` into a one-element array in PowerShell, so the naive `.Count -gt 0` always passed; fixed to
check `$kind.alternateGraphics` truthy first. `Tests/Run-Tests.ps1` reran clean: 5/5 regression
guards, 56/56 DefInjected keys, 149 Core/local references, 18 PNGs, all green.

Per `AUDIT.md`, "aucun scénario rouge sans rejeu vert": all three Pickle tickets (pass 1 English,
pass 1 French, pass 2 incompatible-source) are resubmitted against this fix before any of their
prior results are trusted. `stage`/`workflow_stage` stay `done`; `preTest -> done` is unaffected
(it certifies written/scoped tests, not a green run), and this is exactly what `done -> tested`
exists to catch. Not yet `tested`: none of the three passes has a green run on the fixed revision.
