# Automated validation — 2026-09-13

**PASS. No in-game tests executed.** Payload revision:
`72e9266a78b710495a4d9f3437d18dfd17143f17`. Mod/ is unchanged from that commit.
Exact delivered-file hashes and byte sizes: [Payload-files.json](Payload-files.json).
Executed repository test hashes: [Test-files.json](Test-files.json).
Full successful output: [Automated-output.txt](Automated-output.txt).

## Reproduce

Run from the repository root on Windows:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Run-Tests.ps1
```

Requirements: Windows PowerShell/.NET Framework, System.Drawing, local RimWorld 1.6
Core data and managed assemblies, and the shared `../scripts/Check-DefInjected.ps1`.
Override `-GameRoot` and `-InjectionChecker` for other installations. The runner fails
when required references/checker are unavailable, on errors or on UNVERIFIED injection
findings; it does not silently skip them. It reads game files without launching the game.
The regression-guard tests create isolated copies under ignored .build/.

Reference game: `1.6.4871 rev590`. Final combined runner exited **0**.

| Check | Actual result |
| --- | --- |
| XML parsing and localization inventory | Six XML files parsed; 28/28 owned fields in English and French. No duplicate, empty, placeholder, malformed escape, extra unowned injection or inconsistent race/pawn-kind name. |
| Content regressions | Four Wildness values at statBases checked; no obsolete race/wildness; race IDs, life-stage counts/ages and horse packing/training contracts passed. |
| Dependencies/references | Both abstract parents and 149 referenced Core/local names resolved without using DLC data; unexpected custom classes/conditional content/dependencies trigger review failure. This is static name resolution, not complete loader/type validation. |
| Assets/distribution | All 18 PNGs decoded; required custom directional textures present; icon 128 x 128 and Preview 896 x 504 below 1 MB; identity, incompatibility, unofficial notice, final repository link and attribution-copy equality passed. |
| Regression detection | Four deliberately broken copies rejected for the intended reason: missing French meat label, head injected into bite, obsolete Wildness location, missing north texture. Shipped files unchanged. |
| Reflected DefInjected paths | 56 keys; zero errors; no UNVERIFIED findings. 11,590 indexed defs and 29 applied operations belong to the reference context, not patches shipped by this mod. |

## Functional scenarios and applicability

[TEST_SCENARIOS.md](../TEST_SCENARIOS.md) defines 15 future scenarios with preconditions,
actions, expected results and evidence requirements. Every scenario is **NOT RUN**.
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
