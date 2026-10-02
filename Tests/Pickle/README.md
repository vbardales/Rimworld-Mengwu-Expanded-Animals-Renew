# Mengwu Expanded - Animals Renew Pickle suite

Development only. Nothing under `Tests/` is part of the Workshop payload. Written 2026-09-29,
against the audit note in `STATUS.md` (`preTest -> done`). Run history: `docs/runs/pickle.md`; passes and
evidence to keep: `TESTING.md`. Nothing here claims an in-game result; every finding below is a scope decision.

## Scope

The offline suite (`Tests/Run-Tests.ps1`, `Tests/Check-Content.ps1`, `Tests/Test-RegressionGuards.ps1`,
`Tests/Check-Localization.ps1`) owns everything provable without a game: XML validity, the four
Wildness/`statBases` migrations, life-stage ages, `packAnimal`, trainability, the DefInjected
inventory and coverage in both languages, the shipped PNGs' dimensions, and metadata/attribution
text. A Pickle scenario that would only repeat one of those checks was not written.

Pickle is limited to what needs a running game: whether the mod actually loads without error in a
real game, whether the two def types with shared defNames (`MG_Horse`, `MG_TiaoShu`, `MG_TuSun`,
`MG_TuBoShu` each name both a `ThingDef` and a `PawnKindDef`) still resolve cleanly, the
directional/adult graphics a person reads from a capture, the label text a running game actually
draws in each language (catches a raw key or an English fallback that a static XML check cannot),
whether the animals survive a save and reload, and whether the documented symptom beside the
declared-incompatible source mod still holds.

Because of the shared defNames, this suite avoids Pickle's untyped `def` steps (`field`, `stat`,
`raw stat`, `defined by mod`, `was patched by mod`), which refuse or can silently pick the wrong
database on a name two types share. Only `def {string} of type {string} exists` (which is typed)
and the mod-level steps are used. No local C# steps are written: everything here is a built-in
Pickle step or a call into the `InspectTabs` tool of `PickleTools` (`I select the thing of def
... at (...)`, for a selection that does not depend on the pass's language).

## Passes

Two passes, four launches.

| Pass | Map | Features | Language | What it establishes |
| --- | --- | --- | --- | --- |
| 1. Without optional mods | `wsl-deps.sans-facultatifs.map` | `01`, `02`, `03` | English, then French | The mod stands alone: defs load, the four animals spawn and draw, their labels resolve, they survive a reload |
| 2. The declared-incompatible source | `wsl-deps.incompat-source.map` | `04` | English | The documented silent-override symptom still holds |

`01-defs.feature` and the save/reload scenario of `03-persistence.feature` do not depend on
language and only need to run once; the suite still plays them in both launches of pass 1 because
Pickle runs a whole feature file per `-Filter`, and a smaller filter buys little here. Pass 2 is
replayed when the source mod changes, not at every release, per `AUDIT.md`.

From the collection root, once `scripts/Pickle-Status.ps1` says the machine is free (or, since
2026-09-24, by filing a request with `Submit-PickleRun.ps1` instead of calling the launcher
directly — see `AUDIT.md`, "Déposer un run au lieu de le lancer"):

```powershell
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod MengwuExpandedAnimalsRenew -DepMap wsl-deps.sans-facultatifs.map -Filter 'Mengwu Expanded - Animals Renew - Pickle tests,!@french' -Language English
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod MengwuExpandedAnimalsRenew -DepMap wsl-deps.sans-facultatifs.map -Filter 'Mengwu Expanded - Animals Renew - Pickle tests,!@english' -Language French
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod MengwuExpandedAnimalsRenew -DepMap wsl-deps.incompat-source.map -Filter '04-incompatible-source' -Language English
```

Add `-EvidenceDir MengwuExpandedAnimalsRenew/Tests/Pickle/Evidence/<date>-<pass>-<language>` to
each, so the report is copied into the mod before the shared folder is overwritten. Do not run the
Windows game, do not stage by hand, and do not switch language inside a scenario.

### Preconditions that are not in this repository

- The `test-colony` fixture that ships with Pickle, and at least one free colonist on it.
- For pass 2 only: `[SZ] Mengwu Expanded` (Workshop `2894159932`) reachable by the WSL staging.
  Resolved via `wsl-ids.map`; not staged unless `-DepMap wsl-deps.incompat-source.map` is used.

## Tags

- `@requires:<packageId>` skips the scenario when that package is absent. It does not stage it:
  the pass map does. `04-incompatible-source.feature` carries the tag on the Feature line, so the
  whole file is skipped outside pass 2.
- `@review` marks a scenario whose only claim is the captures it attaches. Its green says the
  spawn and the capture happened, not that the picture is right. Each capture is opened and read
  before the pass counts, per `Authoring/README.md` section 7.
- `@english` and `@french` are written against the language the pass was launched in. Each
  scenario asserts the label text itself in that language, which is how a silent fallback to
  English would be caught rather than passed.

## What is deliberately not here, and why

Per `AUDIT.md`, "On ne teste pas le jeu": the engine's own systems are not this content mod's
responsibility, only what it declares. The mod's role in each of these is a def field or stat,
already covered offline; the dynamic behaviour is the game's.

- **Taming and training outcomes** (`TEST_SCENARIOS.md` F05): the RNG and the AI job are the
  game's. The mod's role — the `Wildness` stat and the trainability class — is a `raw stat`/field
  read, offline.
- **Feeding and predation** (F06): diet compatibility is a `foodType` flag, offline. Whether a
  pawn actually eats or hunts is the game's own need/job system.
- **Horse packing** (F08): `packAnimal` is a field, offline. Caravan loading logic is the game's.
- **Reproduction** (F09): gestation days and litter size are fields, offline. The random timing
  and the actual birth event are the game's, and slow to reach even in fast mode.
- **Biome population** (F11): the biome spawn weights are data, offline. Whether the game's own
  wildlife-spawn roll actually produces one of these animals on a given map is not something a
  single run — or a small number of them — can establish either way.
- **Settings absence** (F13): `settings_audit: not_applicable` in `STATUS.md` — there is no
  settings page and no `MainButtonDef` at all, so there is nothing to open, hide or assert against.
- **New colony / existing save from an older port revision** (F14): no prior published revision
  exists to load; `03-persistence.feature` covers the save/reload contract that a future revision
  would also need.

`F02` (source conflict) and `F10` (corpses, which reuse Core's horse/squirrel/lynx graphics and
are not this mod's own asset) are covered narrowly: `04-incompatible-source.feature` for F02, and
the groundhog's own dessicated texture — the one directional asset this mod ships for a corpse —
by `02-visuals.feature`'s adult capture of `MG_TuBoShu`, not a separate corpse scenario.

## Evidence

Keep the summary, the JUnit file, `messages.ndjson`, `Player.log`, and the minified `@review`
captures actually opened and read; never a whole `screenshots/` folder. One line per run goes in
`docs/runs/`. See `Authoring/README.md` section 7 and `AGENTS.md`, "Test evidence".
