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

No DLC required. No Harmony, no framework, no dependency of any kind (the optional integrations below are patches that do nothing without their mod).

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
- 1.6 update by Nelim. Written with the help of Claude (Anthropic).

See [ATTRIBUTION.md](ATTRIBUTION.md) for the licence check, what was left behind, and the port in
detail.

## Optional integrations

Four guarded patches in `Mod/Patches/` add the animals to other mods when those mods are loaded, and do nothing otherwise: A Dog Said... Animal Prosthetics 2, [XND] Nocturnal Animals, Dogs mate and Better Crossbreeding. None is required. The reason for each pairing is in the header of its patch.

## Art provenance

The Preview illustration (`Art/Preview-source.png`, text-free) was generated on 2026-09-13 with the built-in image_gen tool, with the four shipped south-facing animal textures as species, colour and silhouette references. The ModIcon badge source (`Art/ModIcon-source.png`) comes from a generated variant of a reference mascot. The final Preview is composed by `node ../scripts/Render-Preview.cjs` from `Art/Preview.config.json`.

Preview prompt:

> Create a landscape 16:9 RimWorld mod Workshop illustration WITHOUT ANY TEXT. Four animals only, modeled on the four reference sprites (reference art for species, colour and silhouette, not edit targets): one stocky dark reddish-brown Mongolian horse with dark mane, one tiny sandy-orange jerboa with long thin tufted tail and small pointed ears, one squat grey-brown Pallas's cat with broad flat face and rounded ears, one stout tan groundhog. All exactly once. Scene: a small steppe colony animal yard on olive sage grass and compacted square patches of earth, short worn timber fence across upper right, a hay bundle and a single low warm lamp beside the fence. The horse wears a simple faded teal saddle blanket and stands on the RIGHT side, oriented diagonally down-left. The three distinct small animals form a loose triangle in the lower-right yard, with visible gaps and believable size differences; Pallas cat larger than jerboa. Leave the LEFT 50 percent as very calm olive ground with subtle tile rhythm and no subjects, for later title overlay. No humans. Camera high oblique overhead 65-70 degrees above horizon, near orthographic exactly like RimWorld: ground fills entire frame, see animals mostly from above, no horizon, sky or vanishing point. Matte gouache-like game illustration, low texture detail, simple functional slightly worn shapes, soft edges and dark contact shadows, not realistic fur. Dominant olive/sage family across the yard, warm brown horse/wood and small warm lamp pool, a distinct teal blanket accent. Strong clear separated silhouettes, readable at 268 pixels wide. Absolutely no text, letters, numbers, logo, watermark, UI, border, letterboxing, sparkles, lens flare, dramatic landscape, anime, Ghibli, Disney, cartoon mascot, 3D render or isometric diorama. No extra animals.

ModIcon prompt:

> Create one square logo-brand raster variant for "Mengwu Expanded Animals". Reference image: preserve its very bold black outlines, glowing orange and golden-yellow gradients, near-black warm background, cheerful winking expression, small four-point sparkle, clean simple mascot aesthetic. Reinterpret the round smiley as an adorable stylized Mongolian steppe horse head, rounded and compact, with two short horse ears, flowing forelock and a swept mane echoing the ponytail shape in the reference, subtle rounded muzzle and nostrils, one large open black eye with white glint and one winking eye, friendly curved smile. Keep the instantly readable orange emoji family resemblance. Main mascot centered in upper 75 percent, below it beautifully legible bold warm-gold uppercase title on two centered lines: "MENGWU" then "EXPANDED ANIMALS". Strong polished game mod emblem, generous margins, crisp silhouette, no extra animals, no additional text, no watermark. The reference is style and composition guidance.

