# Pickle runs

One line per run. Full reports are not kept (gitignored `Tests/Pickle/Evidence/`, trimmed to summary +
junit + Player.log). A superseded build proves nothing about the current one.

- 2026-09-29 `sans-facultatifs` English, 1 pass / 6 fail / 1 skipped, `exitReason: failed`: `MG_Horse` `alternateGraphicChance` crash (fixed `fc25233`), plus undefined step. Report deleted, superseded.
- 2026-09-29 `incompat-source` English (feature 04, `@requires:SZ.MengGu.Expanded`), 1/1 passed, `exitReason: passed`. Kept: `Evidence/2026-09-29-incompat-source-english/`. Non-regression until the source mod or step changes.
- 2026-09-30 `sans-facultatifs` English rerun, 1 pass / 6 fail / 1 skipped: all failures `Undefined step: Nelim's Pickle Tools: I select the thing of def`. Cause: the pass map named `nelim.pickletools path:PickleTools/Mod`, not the InspectTabs companion. Kept as sole proof of that defect until the corrected map is replayed: `Evidence/2026-09-29-sans-facultatifs-english-rerun/`.
- 2026-09-30 `sans-facultatifs` French rerun, same result and same cause. Kept: `Evidence/2026-09-29-sans-facultatifs-french-rerun/`.
- 2026-10-02: map corrected to `nelim.pickletools.inspecttabs path:PickleTools/InspectTabs/Mod`; EN and FR passes to replay (see `STATUS.md`).
- 2026-10-02 `sans-facultatifs` English and French submitted at `65f8a80` (tickets `20261002-204744-460-bfdd`, `20261002-204744-614-1f76`), evidence to `Evidence/2026-10-02-sans-facultatifs-{english,french}/`. Verdict pending: record it here and delete the two red reruns once these are read.
