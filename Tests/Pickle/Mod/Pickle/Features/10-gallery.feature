# Gallery of Mengwu Expanded - Animals Renew (unofficial). SHOTLIST ONLY: no scenario is written until the steps asked of NPT
# are answered and every scene is estimated at 4 or more (GALLERY.md, "Shotlist : critères d'une scène à 4/5"). Written 2026-10-27.
#
# STORY: "The steppe comes to the Sanctuary". One day, dawn to night, in the Sanctuary of Nelim (SanctuaryBacklot, the Nelims-tribe save).
# Nelim, the only colonist, welcomes a Mengwu horse and its three small companions: arrival (S1), the marmot's home (S2), the noon
# nap of the night hunter (S3), the hunt that wakes at dusk (S4), the last latch at night (S5). S1 opens (wide, sets the paddock), S5
# closes (wide, other gate, other rectangle). One start hour per scene (`I set the hour to N`, photographer's choice, 2026-10-14);
# weather Clear except S5 (night). Shots: wide S1, S5; medium S3; tight S2, S4.
#
# NELIM, whole day (continuity, no change of outfit: the day is one): VAE_Apparel_Jumpsuit dyed rgb (31, 92, 69) deep emerald,
# VAE_Headgear_Scarf dyed rgb (230, 120, 40) orange accent (NELIM-PROFIL.md, "Quotidien"), hair Roo_HD_Hair_Highpony (no hat: no hat-hair
# mod needed), "Nelim's Sanctuary: Nelim has her own face" as the LAST step before each shot (small smile). Only Nelim: no other colonist.
#
# DEPMAP (to write at the first scenario, `wsl-deps.gallery.map`): the Sanctuary map as base, nothing challenged
# (SanctuaryBacklot/Tests/Pickle/wsl-deps.sanctuary.map), plus nelim.mengwuexpandedanimals (path:MengwuExpandedAnimalsRenew/Mod) and
# Mlie.XNDNocturnalAnimals 2269731409 (the cat sleeps by day, the jerboa wakes at dusk: the integration is what makes S3 and S4 true).
#
# STEPS ASKED OF NPT (via the TM, 2026-10-27): (1) an animal lies down asleep; (2) an animal faces a direction; (3) an animal starts
# hunting a target (or gets a job). Until answered: S2 (front view), S3 (asleep), S4 (hunt) score 3.5 and are not played.
#
# SHOTLIST (index, name | place, hour, weather, time | subject, what it says | composition | living | decor | steps, DepMap | type):
#
# S1 mengwu-1-dawn-gate | enclosure-south, 07:00, Clear, setup 60 ticks then the horse is spawned and 60 more ticks pass | the Mengwu
#   horse has arrived and Nelim feeds it: "A steppe horse and a gate left open." | WIDE, rectangle (128,204) to (170,224): fence and gate
#   foreground, horse off-centre right just inside the gate (159,207), bamboo behind, low sun | horse adult; Nelim at (158,208) facing
#   east, carries the item Hay, mid-stride; INSTANT: just after she opens the gate, just before she sets the hay down; obtained by
#   placing her facing the horse and `carries the item` after the 60 ticks (the horse has left its spawn pose) | TorchLamp lit at the gate
#   (warm at dawn), Plant_YellowTallGrass fully grown along the fence, a Hay decor pile one cell ahead of her; all removed after the shot |
#   steps: StageDecor, rectangle frame, `carries the item`, Nelim's own face | story scene, subtitle "The steppe horse has come."
#
# S2 mengwu-2-burrow | water-garden west bank (x 143-158, z 168-176), 09:00, Clear | the marmot comes out of its burrow as Nelim
#   passes: "The marmot's home is a hole in the bank." | TIGHT, rectangle of about 6 cells around (149,173) (not zoom 14), marmot
#   centre-left in the foreground FACING SOUTH TO THE CAMERA, Nelim at the right edge, shallow water and lilies behind | marmot adult
#   (MG_TuBoShu) plus one baby at its side, Nelim facing west, mid-stride, hands free (no item: a box reads as nothing); INSTANT: the
#   marmot has just come out, Nelim stops; obtained by `an animal faces south` (asked) and Nelim placed mid-step | Filth_Dirt
#   around the hole so it reads as dug earth, Plant_Daylily fully grown on the bank; the steam geyser at (150,173) stays out of the
#   rectangle or is kept as a wisp behind | steps: spawn at life stage, `faces` (NPT, asked) | story scene, subtitle "A marmot and its burrow."
#
# S3 mengwu-3-noon-nap | hut (tea room), 12:00, Clear, 120 ticks of setup | the night hunter sleeps through noon: "The Pallas's cat
#   keeps night hours." | MEDIUM, `hut` frame zoom 9: cat in the foreground left on the floor, low table and braziers behind, Nelim
#   centre-right | Pallas's cat (MG_TuSun) lying asleep (Nocturnal Animals makes it natural), Nelim stands at the low table looking at it,
#   holding the pose of a person who steps softly (facing west, mid-step); INSTANT: she has just come in, she is about to leave
#   quietly; obtained by `an animal lies down asleep` (asked) | PlantPot_Bonsai on the low table, a Brazier near the cat lit | steps:
#   lie-down step (NPT, asked), decor lit | story scene, subtitle "The Pallas's cat sleeps by day."
#   FALLBACK if NPT refuses and the owner does not arbitrate for it: cut S3, move the nocturnal beat into S5 (cat awake on the prowl).
#
# S4 mengwu-4-dusk-hop | bare-clearing, 18:00 dusk, Clear, 30 to 60 ticks of setup | the hunter wakes at dusk, the jerboa has not
#   seen it: "At dusk the hunt begins." | TIGHT-MEDIUM, zoom 5 (x 186-204, z 147-157): jerboa foreground right, Plant_YellowTallGrass
#   between the two, cat 3 cells behind it in the grass, Nelim at the left edge | jerboa (MG_TiaoShu, crepuscular, awake), cat adult
#   (MG_TuSun) low in the grass, Nelim facing east, carries the item Kibble; INSTANT: just before the pounce, no contact; obtained by
#   `starts hunting <target>` (asked) or, failing it, 30 to 60 ticks after the spawn, paused before contact | Plant_YellowTallGrass
#   fully grown, flowers of the clearing | steps: hunt step (NPT, asked), `carries the item` | story scene, subtitle "Dusk wakes the hunter."
#
# S5 mengwu-5-night-gate | enclosure-south, west gate (130,219), 21:00 night, Clear, 120 ticks | all four are in for the night: "Everyone is
#   home; Nelim latches the gate." | WIDE, rectangle (126,210) to (152,226) (not the S1 frame): west gate foreground, horse walking in
#   from the left, marmot near the egg boxes, jerboa left outside the fence in the grass | horse adult, marmot adult, jerboa adult; Nelim at
#   the gate facing north, back to the camera, hand-height pose at the latch; INSTANT: just after the last animal is in; obtained by
#   placing her facing north | TorchLamp and Brazier lit (warm pools at night), the paddock egg boxes as they are | steps: decor lit,
#   rectangle frame | story scene (closing), subtitle "All four are home."
#
# S6 mengwu-6-info-card | window-backdrop-for-height, any hour | the "i" information card of the Mengwu horse (body size 2.6, pack
#   animal, 40 years): not scored, interface window cropped laterally, no subtitle | placed after S5 as an appendix.
#
# NOT SHOWN: A Dog Said Animal Prosthetics 2, Better Crossbreeding, Dogs mate (invisible in a still); only the Nocturnal Animals
# behaviour is read in S3 and S4. Baby life stage appears in S2 only; juvenile is not staged (declared, not shown).
@wip
Feature: The gallery of the Mengwu animals tells one day at the Sanctuary
