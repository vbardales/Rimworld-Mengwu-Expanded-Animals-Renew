# Protocols read for this mod

Tracks which monorepo-wide docs were read, at which revision, so a later session does not reread an
unchanged doc and rereads one that moved. Last pass: 2026-10-02.
Revision = `git log -1 --format=%h -- <path>`. Protocol docs live in the protocols repo: from the monorepo
root use `git --git-dir=../rimworld-protocols.git --work-tree=. log -1 --format=%h -- <path>` (the plain form
returns a stale hash). PickleTools, Release-Admin and Ticket-Dispatcher are their own repos.

"Read" = opened this session. "Carried" = read by an earlier session of this mod, revision not re-checked by
opening it now; reread if the revision moved.

| Doc | Revision | Status | Useful for this mod? |
| --- | --- | --- | --- |
| `AGENTS.md` | `7fd7475` | Read (given in context) | Yes: ordered gates, evidence rule (latest report per scenario), CI-only publish |
| `AUDIT.md` | `5a975b5` | Read in full | Yes: every audit. Gate 9 (`tested`), WSL rules, step 12 retreat, session title |
| `PUBLISHING.md` | `4e44398` | Read in part: animal-mod integrations (l298-337), after-upload and release (l485-531) | Partly. The four animal integrations (ADS 2, XND, Dogs mate, Better Crossbreeding) apply to this mod and are not treated: see `STATUS.md` `remaining`. Skip upload, CI, Steam text |
| `MOD_SETTINGS.md` | `b83933b` | Carried (2026-09-29 audit) | Once: `settings_audit: not_applicable` already justified |
| `TRANSLATIONS.md` | `af8427f` | Carried (2026-09-30, section 3 in full) | Yes: French gender-agreement rule, French review by Virginie |
| `STYLE_RIMWORLD.md` | `4e44398` | Not read | Only for ModIcon/Preview work, done and validated |
| `WORKSHOP_COMMENTS.md` | `4e44398` | Not read | Later: thanks round at publication. No source author reachable yet |
| `scripts/SEARCHING.md` | `50de695` | Not read | Situational: defName collision checks, `scripts/Search-Workshop.sh` |
| `PickleTools/README.md` | `ff20d89` | Grepped (InspectTabs row) | Catalogue. Needed: InspectTabs companion line `nelim.pickletools.inspecttabs path:PickleTools/InspectTabs/Mod` |
| `PickleTools/Headless/README.md` | `ed4e73a` | Carried | Yes: submit-only, `-DepMap`, `path:` for non-Workshop mods, `-EvidenceDir` |
| `PickleTools/docs/steps.md` | `da7c3b0` | Carried | Reference when writing steps |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | `3c03f51` | Not read | Not before a CI publish (Virginie approves `steam-production`) |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | `77ca9d7` | Carried | Yes: freeze the tree until `RUN_DONE`, SHA in `-Label` |
| `Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | `d07b2b8` | Carried | Yes: `-EvidenceDir`, `-DepMap` bare file name, exit codes |

Mod-local docs read 2026-10-02: `STATUS.md`, `CHANGELOG.md`, `TEST_SCENARIOS.md`, `Tests/Pickle/README.md`,
`Mod/About/About.xml`. Not read: `LICENSE` (none at the root), `FRENCH_REVIEW.md` and
`TRADUCTION.md` (generated), `ATTRIBUTION.md` (only grepped).
Absent, confirmed by listing: `PUBLICATION.md`, `BACKLOG.md`, `NOTES.md`, `BUGS.md`, `TESTING.md` before
2026-10-02 (now created).

Reread any row whose revision no longer matches.
