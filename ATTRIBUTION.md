# Mengwu Expanded, the animals — where the content comes from, and what had to be changed

Everything in this mod is **DiamondJ's** work, with art by **Yu Yan** and **Frolg**: the four
animals, their textures, and the English labels, which are the author's own translation. This
repository holds the port to RimWorld 1.6 and nothing else.

## The source, and what is not taken

| | |
|---|---|
| Mod | [SZ] Mengwu Expanded |
| Author | DiamondJ, art by Yu Yan and Frolg |
| Workshop | [2894159932](https://steamcommunity.com/sharedfiles/filedetails/?id=2894159932) |
| Last version supported | 1.4 |
| Last updated | 5 December 2022 |
| Licence | none stated |

**This is the animals only, and the name says so.** The source is a Mongolian-themed expansion:
melee and ranged weapons, armour, helmets, commoner clothing and hats, two sets of backstories, and
these four animals. Only `MGAnimal.xml` is taken. The rest stayed where it was, not because there is
anything wrong with it, but because a port that claims a whole mod and delivers a fifth of it is
worse than one that says what it is.

**Abandoned, not withdrawn.** The item is still on the Workshop and still downloadable; it stopped at
1.4, missing 1.5 and 1.6. Nobody else has picked it up: Mlie has no continuation of it, a Workshop
search filtered on the 1.6 tag returns nothing for it, and no installed mod declares `MG_Horse`.

## The licence, looked for in four places

"None stated" is a verdict, not an absence of checking. A refusal never presents itself as a
licence, so each place was searched for the refusal rather than for the permission — `prohibit`,
`forbid`, `do not redistribute`, `no reupload`, `all rights reserved`, `without permission`, and
the Japanese and Chinese forms 禁止, 転載, 無断, 二次配布, 不得.

| Where | What it says |
|---|---|
| A `LICENSE` or `COPYING` file in the mod | there is none |
| The `<description>` of its `About.xml` | nothing about reuse |
| A linked repository | there is none |
| The Workshop page description | nothing about reuse |

Silence grants nothing and forbids nothing. This port rests on the Workshop's own custom for
abandoned mods: named credit, and a takedown on request.

## What the port changed

Wildness migrated on all four animals.

- **`wildness` moved to `<Wildness>` under `statBases`, on all four animals.** It stopped
  being a field of `RaceProperties` in 1.6 and became a StatDef. The old form does not error: nothing
  reads it, and the stat's own default is `-1`, which Core's comment describes as deliberately out of
  range "so we can catch missing wildness stats on animals". The horse's 0.1 — nearly born tame, and
  the point of a steppe mount — was doing nothing.

A diff against the original file shows those four field migrations and nothing else.

## The translation

The Chinese source defs are covered by 28 DefInjected entries in each of English and French.
The original English animal names are retained, including `Rabbit mantle` and
`Mogul Leaping Bunny`; the descriptions were edited for clarity against the Chinese source.
French translations and those editorial corrections are part of this port, not claims
about the original author's wording.

- Corrected the duplicated male label to the female field and kept horse gender names consistent.
- Added the missing horse meat and foal labels.
- Added translated attack labels; on the three small animals, the head is tool index 3,
  while index 2 is the bite and retains the game's native body-part naming.
- Replaced malformed line-break text and completed French coverage.

## What was left alone, and why

- **The horse, jerboa and Pallas's cat corpses** use the base game's horse, squirrel and lynx
  textures. The groundhog retains its own dessicated texture, as the author wrote it.
- **No balance value was touched**, including the horse's 0.1 wildness, which now that it is read
  makes it tamer than a vanilla horse.

## Where this came from

The port was done inside a private pack that had gathered two dozen abandoned animal mods, where
these four were one source among them. They leave the pack to stand on their own, because the rule
that pack follows is that a mod which is dead **and** states nothing gets republished with credit
rather than kept back. The pack keeps only what cannot be published: sources that are alive in 1.6,
and the one whose author refuses redistribution.
