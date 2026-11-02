# Automated validation, 2026-09-13

**PASS. No in-game tests executed.** Payload revision:
`72e9266a78b710495a4d9f3437d18dfd17143f17`. Mod/ is unchanged from that commit.
Exact delivered-file hashes and byte sizes: [Payload-files.json](Payload-files.json).
Executed repository test hashes: [Test-files.json](Test-files.json).
Full successful output: [Automated-output.txt](Automated-output.txt).

## Reproduce

Run from the repository root on Windows:

```powershell
$R = "$PWD"; $S = '../scripts'
powershell -NoProfile -ExecutionPolicy Bypass -File $S/Check-ModBasics.ps1 -ModRoot $R -Unofficial
powershell -NoProfile -ExecutionPolicy Bypass -File $S/Check-Translations.ps1 -ModRoot $R
powershell -NoProfile -ExecutionPolicy Bypass -File $S/Check-DefRefs.ps1 -ModPath $R/Mod -Brief
powershell -NoProfile -ExecutionPolicy Bypass -File $S/Check-TypeRefs.ps1 -ModPath $R/Mod
powershell -NoProfile -ExecutionPolicy Bypass -File $S/Check-XmlFields.ps1 -ModPath $R/Mod
powershell -NoProfile -ExecutionPolicy Bypass -File $S/Check-DefInjected.ps1 -TransMod $R/Mod
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Check-Content.ps1
```

Requirements: Windows PowerShell/.NET Framework, System.Drawing, local RimWorld 1.6
Core data and managed assemblies, and the shared checks in `../scripts/`.

Reference game: `1.6.4871 rev590`. 2026-11-02: the local localization, runner and regression-guard scripts were cut in favour of the shared checks above; rerun green (table below dates from 2026-09-13).

| Check | Actual result |
| --- | --- |
| XML parsing and localization inventory | Six XML files parsed; 28/28 owned fields in English and French. No duplicate, empty, placeholder, malformed escape, extra unowned injection or inconsistent race/pawn-kind name. |
| Content regressions | Four Wildness values at statBases checked; no obsolete race/wildness; race IDs, life-stage counts/ages and horse packing/training contracts passed. |
| Dependencies/references | Both abstract parents and 149 referenced Core/local names resolved without using DLC data; unexpected custom classes/conditional content/dependencies trigger review failure. This is static name resolution, not complete loader/type validation. |
| Assets/distribution | All 18 PNGs decoded; required custom directional textures present; icon 128 x 128 and Preview 896 x 504 below 1 MB; identity, incompatibility, unofficial notice, final repository link and attribution-copy equality passed. |
| Reflected DefInjected paths | 56 keys; zero errors; no UNVERIFIED findings. 11,590 indexed defs and 29 applied operations belong to the reference context, not patches shipped by this mod. |

## Functional scenarios and applicability

[TESTING.md](../TESTING.md) defines 15 scenarios (F01 to F15) with preconditions,
actions, expected results and their disposition. Pickle results: `Docs/runs/pickle.md`.
They cover Core-only startup, source conflict, four animals and directional/life-stage
graphics, taming/training, feeding/predation, attack labels, packing, reproduction,
corpses/products, natural biome populations, EN/FR UI, settings absence, new/existing
saves and persistence, and final logs/regressions.

Compilation and C# unit tests are not applicable: no code, assembly or project exists.
Settings input/default/persistence and shortcut integration tests are not applicable:
no useful settings or shortcut exists, as recorded in STATUS. Conditional patch testing
is not applicable: no patches or LoadFolders. Tests do not add features to fill these areas.

Remaining runtime limitations: actual spawning/AI, item generation and translated generated
names, Core packed textures, east-only groundhog corpse fallback, UI rendering and save
compatibility. These are unverified until the functional scenarios run, not known failures.
The payload is ready for final functional validation (`done`), not `tested`.
