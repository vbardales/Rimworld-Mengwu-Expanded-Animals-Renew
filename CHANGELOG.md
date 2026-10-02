# Changelog

Format inspired by [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This file serves the repository and the writing of Steam patch notes; RimWorld does not display it
in game.

## [1.0.0] — unreleased

ModIcon and Preview are installed. Release tagging and Workshop publication remain pending.

First release of the 1.6 update of the four animals of **[SZ] Mengwu Expanded**, by DiamondJ, with
art by Yu Yan and Frolg.

### Added

- Complete English and French coverage: 28 entries per language, including attacks, horse meat and the foal label. Original English animal names are retained; descriptions are corrected for clarity.

### Changed

- **`wildness` moved to `<Wildness>` under `statBases`, on all four animals.** It stopped
  being a field of `RaceProperties` in 1.6 and became a StatDef. The old form is not an error, it is
  simply never read, and the stat's default is `-1` — outside the range the game uses, so the horse's
  0.1, which makes it nearly born tame, was doing nothing.

### Fixed

- Corrected the three small animals' head-tool translation targets from index 2 (bite) to index 3.
- Added missing horse meat and foal labels and corrected malformed description line breaks.

- **`MG_Horse.labelFemale` was declared as a second `labelMale`** in the source translation. The value
  is plainly the female's; it is injected under the right key here.

- **Removed `MG_Horse`'s `alternateGraphicChance` (0.8), declared with no `alternateGraphics` list.**
  The roll crashed pawn render initialisation about 80% of the time a horse of this kind was drawn
  (`TryGetAlternate` -> `TryRandomElementByWeight` on an empty source). Found by a Pickle run,
  2026-09-29.

### Notes

Those five field changes are the entire difference from the original def file. No balance value was changed.

**Only the animals are taken.** The source also holds weapons, armour, clothing, hats and two sets of
backstories, none of which is here. That is why this mod is named for the animals rather than for the
mod it comes from.

## [0.1.0] — 2026-10-01

Creation of the publishIdFile. This upload only created the Workshop item (private, as Steam creates
every item) and its `About/PublishedFileId.txt`. It contains `Mod/` as it stood at commit `198df47`,
with nothing changed since. It does not mean the mod is public or tested.
