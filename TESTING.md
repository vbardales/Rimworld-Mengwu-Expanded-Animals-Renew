# Testing

Development only, never in `Mod/`. Created 2026-10-02 from `AUDIT.md` gate 9. Detail of the suite:
`Tests/Pickle/README.md`. One line per run: `docs/runs/pickle.md`.

## Passes (three families)

| Family | Count | Map | Features | Language | Status on the current revision |
| --- | --- | --- | --- | --- | --- |
| Without optional mods | 2 launches | `wsl-deps.sans-facultatifs.map` | 01, 02, 03 | English, French | **Not green.** Map was wrong until 2026-10-02 (InspectTabs companion missing); replay pending |
| With optional mods | 0 | none | none | none | Not applicable: no `loadAfter` mod is an optional integration (Core DLCs only), no patch, no `LoadFolders`. The four animal-mod integrations of `PUBLISHING.md` are untreated (`STATUS.md`); each patch that lands needs its own pass |
| Per declared incompatibility | 1 | `wsl-deps.incompat-source.map` | 04 (`@requires:SZ.MengGu.Expanded`) | English | Green 2026-09-29. Replay only when the source mod changes |

No scenario is `@wip`. The only conditional tag is `@requires:SZ.MengGu.Expanded`, which has its pass.

## Order

Never-run and red scenarios first, as small tickets (`-Filter` on the feature). Non-regression last: the full
suite in both languages, all together, on the final revision. A scenario with a green run on the current
logic is non-regression; a change to `Mod/` or to a step it uses makes it new again.

## Manual scenarios (`TEST_SCENARIOS.md`): disposition

No manual test is left to validate once the Pickle passes are green and the `@review` captures are read.

| ID | Disposition |
| --- | --- |
| F01 clean load | Pickle 01 + `no errors were logged` |
| F02 source conflict | Pickle 04 (pass 3rd family) |
| F03 adult graphics | Pickle 02 `@review` captures (to open and read) |
| F04 life stages | Ages are declarations checked offline. **Juvenile and baby graphics: not covered, open** (`STATUS.md`) |
| F05, F06, F08, F09, F11 | Not applicable: engine behaviour, only the declared fields are the mod's, checked offline |
| F07 combat labels | Offline: 28/28 DefInjected fields, tool-index guard. Engine owns the rest |
| F10 corpses | Not applicable except the groundhog dessicated asset, shipped and size-checked offline |
| F12 language/UI | Pickle 02 label scenarios, one pass per language |
| F13 settings absence | Not applicable: no settings, no MainButton (`settings_audit: not_applicable`) |
| F14 existing save | Pickle 03 (save/reload). Upgrade from an earlier port revision: none exists to load |
| F15 logs | Pickle `no errors were logged` in every scenario |

## Evidence to keep

Per run, in `Tests/Pickle/Evidence/<date>-<pass>-<language>/` (gitignored): `summary.md`, `summary.json`,
`junit.xml`, `Player.log`, `evidence-complete.txt`. Plus only the `@review` screenshots actually opened
and read, minified. Delete `report.html`, `messages.ndjson` (25 MB each) and the whole `screenshots/` folder
of any red run. Keep per scenario the latest report of the revision in the repository, plus an older one only if
it is the sole proof of a check the latest did not repeat. Delete a report once a newer one replaces it, and
repoint any `STATUS.md` field before deleting. Launcher archives in `pickle-reports-archive/`: pick what
this mod needs from its own run, then delete that archive.
