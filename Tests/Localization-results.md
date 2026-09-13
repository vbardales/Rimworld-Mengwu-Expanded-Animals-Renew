# Localization validation — 2026-09-13

Base revision: 93b2e151b08e1e3ce454e88ea75bf8df58516442 plus local localization and
metadata changes. Exact checked XML hashes: Localization-files.json.

## Commands and actual results

`powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Check-Localization.ps1`

Exit 0. Six XML files parsed; 28/28 owned display fields covered in each language.
No duplicate, empty, placeholder, CJK fallback, malformed escape or inconsistent
ThingDef/PawnKind animal name. The inventory is derived from source display fields,
not from agreement between two potentially incomplete language folders. Extra injections
into unowned fields are rejected, including the former incorrect bite-tool targets.

`powershell -NoProfile -ExecutionPolicy Bypass -File ../scripts/Check-DefInjected.ps1 -TransMod ./Mod`

Exit 0. Patch operations applied: 29; Defs indexed: 11590; keys checked: 56; errors: 0.
No UNVERIFIED findings. Game reference installation: 1.6.4871 rev590. The indexed
patches are from game data; this mod has no patches or third-party dependencies.

## Inventory and editorial review

Each language contains 21 ThingDef and 7 PawnKindDef entries: four animal labels and
descriptions, twelve explicit attack labels, one horse meat label, four pawn-kind labels,
two horse gender labels and one horse baby-stage label. The three small animals' head
is tool index 3; their unlabeled bite remains native game body-part text at index 2.
The horse head remains index 0. Technical identifiers, texture paths, internal devNote,
stats and enum values are not translation entries. No C#, Keyed strings, patches,
conditional folders, custom interface or custom grammar exists in the payload.

English and French descriptions were reviewed against the Chinese source. English
animal names were retained as an existing naming convention; descriptive wording,
horse gender naming and paragraph escapes were corrected. French uses cheval mengwu,
gerboise mengwu, chat de Pallas and marmotte mengwu. No substitution parameters or
rich-text/grammar tokens occur in the owned texts. Chinese Def source is preserved;
both languages use the native injection mechanism. No balance or spawn values changed.

README, About, CHANGELOG and both identical ATTRIBUTION copies now describe 28 entries
per language, editorial changes and four Wildness migrations. About remains valid XML
with the required final GitHub link. `git diff --check` passed.

These are static resource and XML tests, not executed in-game scenarios. Generated
meat/corpse names, life-stage labels, attack labels, line breaks and layout still require
runtime review in English and French, including new and existing saves. No game session,
log review or RIMMSQOL integration test is claimed.
