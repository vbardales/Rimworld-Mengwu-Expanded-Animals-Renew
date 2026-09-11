# Changelog

Format inspired by [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This file serves the repository and the writing of Steam patch notes; RimWorld does not display it
in game.

## [1.0.0] — unreleased

On release: add `Mod/About/ModIcon.png` and `Mod/About/Preview.png`, create the `v1.0.0` tag and
the matching GitHub release, then publish to the Workshop.

First release of the 1.6 update of the four animals of **[SZ] Mengwu Expanded**, by DiamondJ, with
art by Yu Yan and Frolg.

### Added

- Twenty-six translation keys, English and French. The mod's defs are written in Chinese, so without
  them every label and description shows up in Chinese. The English is the author's own translation,
  carried over as it stands — `Rabbit mantle` and `Mogul Leaping Bunny` included. The tool labels were
  translated nowhere and are new.

### Changed

- **`wildness` moved to `<Wildness>` under `statBases`, on three of the four animals.** It stopped
  being a field of `RaceProperties` in 1.6 and became a StatDef. The old form is not an error, it is
  simply never read, and the stat's default is `-1` — outside the range the game uses, so the horse's
  0.1, which makes it nearly born tame, was doing nothing.

### Fixed

- **`MG_Horse.labelFemale` was declared as a second `labelMale`** in the source translation. The value
  is plainly the female's; it is injected under the right key here.

### Notes

Those three lines are the entire difference from the original def file. No balance value was changed.

**Only the animals are taken.** The source also holds weapons, armour, clothing, hats and two sets of
backstories, none of which is here. That is why this mod is named for the animals rather than for the
mod it comes from.
