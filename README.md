# Mengwu Expanded - Animals Renew (unofficial)

UNOFFICIAL. This mod is published without the original author's explicit consent.
If the original author contacts me to request its removal, I undertake to take it down promptly.

The four animals of **[SZ] Mengwu Expanded**, brought forward to RimWorld 1.6.

**The animals only.** The source is a Mongolian-themed expansion — weapons, armour, clothing, hats,
backstories and these four animals. Only the animals are here, which is what the name says.

**I am not the author of this mod.** The animals are DiamondJ's, with art by Yu Yan and Frolg; all I
did was the work needed to make them run on 1.6. Credit goes to them, mistakes in the update are mine.

Original mod: https://steamcommunity.com/sharedfiles/filedetails/?id=2894159932 — last supporting
1.4, last updated in December 2022. Abandoned, not withdrawn.

## What the mod does

Four animals.

- **Mengwu horse** — body size 2.6, move speed 7, forty years of life, trainable to Advanced, a pack
  animal, wildness 0.1. A steppe horse that carries, and nearly born tame.
- **Mogul leaping bunny** — body size 0.3, move speed 5.5, twelve years, trainable to Intermediate.
- **Rabbit mantle** — body size 0.75, fifteen years, wildness 0.35.
- **Mongolian woody groundhog** — body size 0.6, twelve years, wildness 0.6.

The Chinese source defs are covered by 28 DefInjected entries in each of English and French, including animal names, descriptions, attacks, horse meat and the foal label. The original English animal names are retained; descriptions and missing fields have been corrected.

No DLC required. No Harmony, no framework, no dependency of any kind.

Content mod: removing it mid-save will lose any of these four animals already in play.

## What changed in the 1.6 update

Wildness migrated on all four animals.

- **`wildness` moved to `<Wildness>` under `statBases`.** It stopped being a field of
  `RaceProperties` in 1.6 and became a StatDef. The old form is not an error, it is simply never
  read, and the stat's default is `-1` — outside the range the game uses, so the horse's 0.1 was
  doing nothing and it tamed like any other animal.

No balance value was changed.

## Terms

The original **states no licence anywhere** — no file in the mod, nothing in its `About.xml`, no
linked repository, and nothing on its Workshop page, which was read looking for a refusal rather
than for a permission. Silence grants nothing and forbids nothing.

This port rests on the Workshop's own custom for abandoned mods: named credit, and a takedown on
request. If DiamondJ comes back to the mod, or asks for this to be taken down, it comes down.

If I do not answer within a reasonable time after being contacted, anyone may freely update this or
any other of my mods, including publishing a continuation of it. All credit must be preserved.

## Credits

- **DiamondJ** — the mod and the animals.
- **Yu Yan** and **Frolg** — the art.
- 1.6 update by nelim. Written with the help of Claude (Anthropic).

See [ATTRIBUTION.md](ATTRIBUTION.md) for the licence check, what was left behind, and the port in
detail.
