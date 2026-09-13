---
localization: complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
mod:          Mengwu Expanded - Animals Renew (unofficial)
packageId:    nelim.mengwuexpandedanimalsrenew
repo:         Rimworld-Mengwu-Expanded-Animals-Renew
visibility:   public
detached:     yes
stage:        done
licence:      silent
licence_at:   ATTRIBUTION.md; installed source About.xml checked 2026-09-13
dependencies: none
showcase:     Mod/About/Preview.png
tested_on:
workshop:
remaining:
  - unverified: Final in-game scenarios, logs, EN/FR UI, new and existing saves.
session:      audit 2026-09-13
updated:      2026-09-13
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
## Historical status note (2026-09-12; retained, superseded by the audit above)

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
