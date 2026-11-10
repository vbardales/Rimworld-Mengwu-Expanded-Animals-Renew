# Gallery of Mengwu Expanded - Animals Renew (unofficial). Shotlist reworked 2026-11-10 (sync-nsb-npt, Opus director pass, score-gallery); first written 2026-10-27.
# STATE: the shotlist below is the plan of record. The scenarios S2 to S4 under it are the OLD ones (undecorated save, thin decor, played in f72c: S2 and S4 captures REDO, S3 failed
# at a wall cell): they are rewritten from this plan once the cells of the DECORATED save are read on photographs (survey ticket, GALLERY.md: cells are read on a photo, never guessed).
# S1, S5, S6 are written after that. No gallery ticket before every scene is at 5 on paper and `Check-ShotlistVsScenario.ps1` passes.
# A ticket needs `-DepMap wsl-deps.gallery.map` (decorated Sanctuary, rebuilt 2026-11-10); any ticket on another pass map excludes this suite (`!10-gallery`).
#
# STORY: "The steppe comes to the Sanctuary". One day, dawn to night, in the Sanctuary of Nelim (SanctuaryBacklot, save Nelims-tribe-decor-mods-z3: the decorated Sanctuary the places were
# validated on, NSB 2026-11-06 to 09). Nelim, the only colonist (NSB), is busy all day looking after a Mengwu horse and its three small companions, and each image catches her mid-task with what
# she carries: hay (S1), berries (S2), kibble (S3, S4), empty hands to close the gate (S5). Arrival (S1), the marmot's mound (S2), the noon nap of the night hunter (S3), the hunt that wakes
# at dusk (S4), everyone home (S5), the horse's info card (S6, appendix). One start hour per scene (`I set the hour to N`), weather Clear except S5 (night). Frames, wide to tight:
# S1 WIDE (root 5.5, about 20 cells: opens, sets the paddock; the horse about 28 px at 268), S2 TIGHT (root 2.5), S3 MEDIUM (root 4, about 14 cells), S4 TIGHT (root 3, about 10 cells), S5 MEDIUM-WIDE (root 5).
#
# NELIM, whole day (continuity, no change of outfit: the day is one): Apparel_Pants dyed rgb (70, 56, 44) first (legs), VAE_Apparel_Jumpsuit dyed rgb (31, 92, 69) deep emerald,
# VAE_Headgear_Scarf dyed rgb (230, 120, 40) orange accent (her palette, NELIM-PROFIL.md), hair Roo_HD_Hair_Highpony rgb (56, 36, 18) (roster Hair_DarkSaturatedReddish #382412, 2026-11-10;
# no hat), face = held neutral, kit neutral, BrowNormal, MouthSmile, LidCheerful, expression "normal" LAST, temperature 20 degrees (smile is scene liberty, VALIDE.md 2026-11-06; the sweat drop
# of the f72c captures is a defect to remove, not a trait: temperature step BEFORE the ticks, and no forced haul longer than the pause needs). Only Nelim: no other colonist.
# Risk: the scarf drawn detached from her in f72c S4 (NPT: apparel offset; swap the headgear if it persists mid-frame).
#
# DEPMAP: `wsl-deps.gallery.map` = wsl-deps.sanctuary-decor-mods.map (decor mods, DecorBase, Backlot, tools) + Nelim's looks and wardrobe mods + this mod + Mlie.XNDNocturnalAnimals 2269731409
# + VanillaExpanded.VFEPropsandDecor 2102143149 (hay bales; to be confirmed installed at the survey ticket). Background: `the save "Nelims-tribe-decor-mods-z3"`.
#
# STEPS (NPT, prefix "Nelim's Pickle Tools: "): `the animal "Y" lies at (x, z) facing South`, `"Y" faces South|West|East`, `the animal "cat" is forced into the job "PredatorHunt" targeting the animal
# "jerboa"` + `I advance the paused game by exactly N ticks` (shoot BEFORE contact), `the animals except A, B and C are kept out of the sanctuary` (hut), `I frame the area centred on the point (x, z)
# at root size`, `"Nelim" is forced to haul 1 of the item X to (x, z)`. If a step fails, send NPT the failure text: NPT fixes the step, no workaround here.
#
# LIGHT RULE (director pass, 2026-11-10): decor is GROUPED around the subject (no bare soil in the frame, a lit light source in frame: DR_StickLantern, TorchLamp or the hut's andon), props from
# GALLERY-PROPS.md only. Every animal faces the ACTION (Nelim, the prey, the door), except ONE front view per series (S2 pup facing South). Nothing stands on the flower logo of
# enclosure-south (growing zones 3 to 15, VALIDE.md 2026-11-08). Every cell below marked [READ] is read on a z3 photograph at the survey ticket before the scenario is written.
#
# SHOTLIST (index, name | place, hour, weather, time | subject, what it says | composition | living | decor | steps | type):
#
# S1 mengwu-1-dawn-gate | enclosure-south (z3 decor kept, farm animals removed, NOT emptied: bare soil would be thin decor), south gate (159, 207), 07:00, Clear, 60 ticks of setup | the horse waits
#   inside the gate and Nelim brings its first hay: "A steppe horse and a gate left open." | opening image, WIDE, root 5.5 centred near (156, 211) [READ]: the whole paddock edge, fence, gate at the bottom,
#   low sun | horse adult (MG_Horse) at (162, 210) facing Nelim (not to the camera), Nelim at the gate (159, 206) facing North, forced to haul 1 Hay to (159, 209), paused 40 ticks in,
#   mid-stride across the gate cell, hay in her hands; INSTANT: she just opened the gate, the horse has not moved yet, she is about to set the hay down | TorchLamp lit at (157, 209), VFEPD_HayBaleSmall
#   and VFEPD_HayBaleMedium beside the gate [READ], Plant_YellowTallGrass fully grown x4 near the fence, nothing on the logo zones; all removed after | steps: animals removed, haul, root size |
#   story scene (opening), subtitle "The steppe horse has come."
#   RISK: gate cell and logo cells read on the z3 photograph; the horse sprite about 35 px at 268 px (j: check at 268 px).
#
# S2 mengwu-2-the-mound | water-garden moss bank (earth x 143-158, z 168-176), 09:00, Clear, 60 ticks of setup | the marmot comes out of its mound as Nelim brings it berries: "A marmot and its mound
#   of earth." | TIGHT, root 2.5 centred on (155, 171), Nelim whole in frame on the left third, shallow water and lily pads east behind | adult marmot (MG_TuBoShu) at (154, 171) facing West toward Nelim, pup
#   (AnimalBaby) at (155, 172) facing South (the front view of the series); Nelim walks East along z 172, is forced to haul 1 RawBerries to (153, 172) and paused after 26 ticks, mid-stride, at about
#   x 152, smiling; INSTANT: the marmot has just come out, she holds out the berries; animals spawned AFTER the walk, in the paused game | Filth_Dirt mound (155, 170), (156, 170), (155, 171), Plant_Daylily x2
#   fully grown (152, 170), (153, 170), Plant_YellowTallGrass fully grown x5 (152 to 157, 169 to 170), DR_StickLantern lit at (153, 173) [READ], reeds and lily pads of the bank stay; all removed after |
#   steps: faces West/South, haul | story scene, subtitle "A marmot and its mound of earth."
#   RISK: the bank's wild animals (x 150 to 151) may drift in (the removal reaches x >= 153); the mound (Filth_Dirt) may not read: the lantern light and the grass carry the frame.
#
# S3 mengwu-3-noon-nap | hut (tea room, decorated: tatamis, low Korean table, cushions, oil andon, validated 2026-11-06), 12:00, Clear, 60 ticks of setup | the night hunter sleeps through noon and Nelim
#   tiptoes in with its kibble: "The Pallas's cat keeps night hours." | MEDIUM, root 4 (about 14 cells) [READ] centred on the cat, the south door in frame with bright noon soil outside, the cat at 40 px or more at 268 |
#   Pallas's cat (MG_TuSun) lies asleep on a cushion cell [READ] facing South (Nocturnal Animals makes it natural); Nelim comes in by the south door and is forced to haul 1 Kibble to the cell beside
#   the cat, paused 40 ticks in, mid-stride, facing North, smiling; INSTANT: she has just come in, she sets the food down for the sleeper | the hut's own decor stays (tatamis, table, cushions, andon lit
#   at its own cell), PlantPot_Bonsai at a free cell [READ], no added Brazier (the andon is the light); the hut's own animals kept out by name | steps: lies at, kept-out list, haul |
#   story scene, subtitle "The Pallas's cat sleeps by day."
#   FALLBACK if the `lies at` step fails and NPT cannot fix it: cut S3, move the nocturnal beat into S5 (cat awake on the prowl).
#
# S4 mengwu-4-dusk-hop | bare-clearing OR emerald-clearing (same square with its green ground: take the one whose photo is not bare) [READ], 18:00 dusk, Clear, 60 ticks of setup | the hunter wakes at
#   dusk, the jerboa has not seen it: "At dusk the hunt begins." | TIGHT, root 3 (about 10 cells) centred near (196, 151), Nelim on the left third whole in frame, jerboa >= 30 px at 268 | jerboa
#   (MG_TiaoShu, crepuscular) facing East away from the cat, cat (MG_TuSun) crouched behind the grass forced into PredatorHunt on it; Nelim hauls Kibble toward the cat, paused 30 ticks in, mid-stride, facing
#   East; INSTANT: just before the pounce, no contact (N tuned on the capture) | Plant_YellowTallGrass fully grown x8 to 10 in a band, Plant_Daylily x3, DR_StickLantern lit at (190, 153) as the
#   dusk light [READ]; all removed after | steps: PredatorHunt, advance exactly N, haul | story scene, subtitle "Dusk wakes the hunter."
#   RISK: both animals small at 268 px (j: REDO if the jerboa is under about 25 px: tighten again); PredatorHunt timing (contact or kill before the pause).
#
# S5 mengwu-5-night-gate | enclosure-south west gate (130, 219) [READ], 20:00 dusk-night, Clear, 60 ticks of setup | every animal is home and Nelim goes to close the gate: "All four are home." |
#   closing image, MEDIUM-WIDE, root 5 centred near (136, 219) [READ], west fence and gate on the left, warm light | horse adult walking in (forced walk, paused 40 ticks in, from behind and the side, facing East),
#   marmot adult asleep (`lies at`) at (137, 221), jerboa adult AWAKE hopping at (139, 217) (it wakes at dusk), the cat walking in last through the gate (S4 pays off); Nelim at (135, 220) facing West, forced
#   to walk to (131, 220), hands empty, mid-stride toward the gate, smiling; INSTANT: just after the horse and the cat went through, she goes to close it | TorchLamp lit at (131, 218) and (131, 221)
#   flanking the gate, Brazier lit at (137, 223) [READ: not on the logo], VFEPD_HayBaleSmall near the marmot, Plant_YellowTallGrass x4; all removed after | steps: lies at, forced walks, root size |
#   story scene (closing), subtitle "All four are home."
#   RISK: gate cell (130, 219) and logo cells read on the photo; 20:00 may still read dark at 268 px (raise the lamps, check the thumbnail).
#
# S6 mengwu-6-info-card | window-backdrop-for-height, any hour | the "i" information card of the Mengwu horse (body size 2.6, pack animal, 40 years): not scored, interface window cropped laterally
#   (5 px of background each side, GALLERY.md), no subtitle | appendix after S5.
#
# NOT SHOWN: A Dog Said Animal Prosthetics 2, Better Crossbreeding, Dogs mate (invisible in a still); only the Nocturnal Animals behaviour is read in S3 and S4. Baby life stage appears in S2 only;
# juvenile is not staged (declared, not shown).
@review @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.screenshotmode @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.camerazoom @requires:nelim.sanctuarybacklot @requires:Mlie.XNDNocturnalAnimals @requires:VanillaExpanded.VFEPropsandDecor
Feature: The gallery of the Mengwu animals tells one day at the Sanctuary

  Background:
    Given the save "Nelims-tribe-decor-mods-z3" is loaded
    And game speed is paused
    And I close all dialogs
    And Nelim's Pickle Tools: the weather is set at once to "Clear"

  # S2, 09h00, Clear, TIGHT root 2.5: the marmot and its baby beside a mound of dug earth on the moss bank, Nelim steps into the frame (26 ticks of a forced walk, pause).
  Scenario: 09h00, the marmot beside its mound of earth while Nelim steps into the frame
    Given I set the hour to 9
    And game speed is ultrafast
    And Nelim's Pickle Tools: I let 60 ticks pass
    And game speed is paused
    And Nelim's Sanctuary: I am at the sanctuary "water-garden"
    And Nelim's Sanctuary: the animals are removed from the sanctuary "water-garden"
    And Nelim's Pickle Tools: I place the decor "Filth_Dirt" at (155, 170)
    And Nelim's Pickle Tools: I place the decor "Filth_Dirt" at (156, 170)
    And Nelim's Pickle Tools: I place the decor "Filth_Dirt" at (155, 171)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (152, 170) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (153, 170) fully grown
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: "Nelim" stands at (150, 172) facing East
    And Nelim's Pickle Tools: "Nelim" body type is Female
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (56, 36, 18)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (70, 56, 44)
    And Nelim's Pickle Tools: "Nelim" wears "VAE_Apparel_Jumpsuit" dyed rgb (31, 92, 69)
    And Nelim's Pickle Tools: "Nelim" wears "VAE_Headgear_Scarf" dyed rgb (230, 120, 40)
    And Nelim's Pickle Tools: I let 120 ticks pass
    And Nelim's Pickle Tools: "Nelim" stands at (150, 172) facing East
    And Nelim's Pickle Tools: "Nelim" is forced to walk to (154, 172)
    And Nelim's Pickle Tools: I advance the paused game by exactly 26 ticks
    And Nelim's Pickle Tools: an adult animal of kind "MG_TuBoShu" named "Marmot" is spawned at (154, 171)
    And Nelim's Pickle Tools: an animal of kind "MG_TuBoShu" named "Pup" is spawned at (155, 172) at the life stage "AnimalBaby"
    And Nelim's Pickle Tools: "Marmot" faces South
    And Nelim's Pickle Tools: "Pup" faces South
    When Nelim's Pickle Tools: I frame the cell (155, 171) at zoom 2.5
    And Nelim's Pickle Tools: the camera root size is set to 2.5
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal"
    And I take a screenshot "mengwu-2-the-mound"
    And no errors were logged

  # S3, 12h00, Clear, MEDIUM (hut frame, zoom 9): the Pallas's cat asleep on the floor, Nelim comes in by the south door and is paused mid-stride (40 ticks: the cat's LayDown runs in the same ticks).
  Scenario: 12h00, the Pallas's cat sleeps in the tea room while Nelim steps in softly
    Given I set the hour to 12
    And game speed is ultrafast
    And Nelim's Pickle Tools: I let 60 ticks pass
    And game speed is paused
    And Nelim's Sanctuary: I am at the sanctuary "hut"
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "hut"
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (139, 75)
    And Nelim's Pickle Tools: I place the decor "Brazier" at (146, 74)
    And Nelim's Pickle Tools: the decor "Brazier" at (146, 74) is lit
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: "Nelim" stands at (143, 70) facing North
    And Nelim's Pickle Tools: "Nelim" body type is Female
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (56, 36, 18)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (70, 56, 44)
    And Nelim's Pickle Tools: "Nelim" wears "VAE_Apparel_Jumpsuit" dyed rgb (31, 92, 69)
    And Nelim's Pickle Tools: "Nelim" wears "VAE_Headgear_Scarf" dyed rgb (230, 120, 40)
    And Nelim's Pickle Tools: I let 120 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "MG_TuSun" named "Mantle" is spawned at (144, 74)
    And Nelim's Pickle Tools: the animal "Mantle" lies at (144, 74) facing South
    And Nelim's Pickle Tools: "Nelim" stands at (143, 70) facing North
    And Nelim's Pickle Tools: "Nelim" is forced to walk to (143, 73)
    And Nelim's Pickle Tools: I advance the paused game by exactly 40 ticks
    When Nelim's Pickle Tools: I frame the cell (143, 73) at zoom 3
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal"
    And I take a screenshot "mengwu-3-noon-nap"
    And no errors were logged

  # S4, 18h00 dusk, Clear, TIGHT-MEDIUM root 4: the cat is forced into PredatorHunt on the jerboa and paused before contact (30 ticks, to tune); Nelim hauls Kibble in from the left edge, mid-stride.
  Scenario: 18h00, the Pallas's cat stalks the jerboa at dusk while Nelim brings kibble
    Given I set the hour to 18
    And game speed is ultrafast
    And Nelim's Pickle Tools: I let 60 ticks pass
    And game speed is paused
    And Nelim's Sanctuary: I am at the sanctuary "bare-clearing"
    And Nelim's Sanctuary: the animals are removed from the sanctuary "bare-clearing"
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (195, 151)
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (195, 152)
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (194, 152)
    And Nelim's Pickle Tools: the plants from (194, 151) to (195, 152) are fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (190, 150) fully grown
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: "Nelim" stands at (191, 152) facing East
    And Nelim's Pickle Tools: "Nelim" body type is Female
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (56, 36, 18)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (70, 56, 44)
    And Nelim's Pickle Tools: "Nelim" wears "VAE_Apparel_Jumpsuit" dyed rgb (31, 92, 69)
    And Nelim's Pickle Tools: "Nelim" wears "VAE_Headgear_Scarf" dyed rgb (230, 120, 40)
    And Nelim's Pickle Tools: I let 120 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "MG_TiaoShu" named "Hop" is spawned at (198, 151)
    And Nelim's Pickle Tools: an adult animal of kind "MG_TuSun" named "Mantle" is spawned at (193, 151)
    And Nelim's Pickle Tools: the animal "Mantle" is forced into the job "PredatorHunt" targeting the animal "Hop"
    And Nelim's Pickle Tools: "Nelim" stands at (191, 152) facing East
    And Nelim's Pickle Tools: "Nelim" is forced to haul 1 of the item "Kibble" to (193, 153)
    And Nelim's Pickle Tools: I advance the paused game by exactly 30 ticks
    When Nelim's Pickle Tools: I frame the cell (194, 151) at zoom 3.5
    And Nelim's Pickle Tools: the camera root size is set to 3.5
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal"
    And I take a screenshot "mengwu-4-dusk-hop"
    And no errors were logged

  # SURVEY (2026-11-10): empty photo of enclosure-south on the decorated save, to read cells at the default light (no staging). Not a gallery shot.
  Scenario: survey enclosure-south
    Given I set the hour to 12
    And Nelim's Sanctuary: I am at the sanctuary "enclosure-south"
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "survey-enclosure-south"
    And no errors were logged

  # SURVEY (2026-11-10): empty photo of gate-south on the decorated save, to read cells at the default light (no staging). Not a gallery shot.
  Scenario: survey gate-south
    Given I set the hour to 12
    And Nelim's Sanctuary: I am at the sanctuary "enclosure-south"
    When Nelim's Pickle Tools: I frame the cell (159, 209) at zoom 5
    And Nelim's Pickle Tools: the camera root size is set to 5
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "survey-gate-south"
    And no errors were logged

  # SURVEY (2026-11-10): empty photo of gate-west on the decorated save, to read cells at the default light (no staging). Not a gallery shot.
  Scenario: survey gate-west
    Given I set the hour to 12
    And Nelim's Sanctuary: I am at the sanctuary "enclosure-south"
    When Nelim's Pickle Tools: I frame the cell (134, 219) at zoom 5
    And Nelim's Pickle Tools: the camera root size is set to 5
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "survey-gate-west"
    And no errors were logged

  # SURVEY (2026-11-10): empty photo of water-garden on the decorated save, to read cells at the default light (no staging). Not a gallery shot.
  Scenario: survey water-garden
    Given I set the hour to 12
    And Nelim's Sanctuary: I am at the sanctuary "water-garden"
    When Nelim's Pickle Tools: I frame the cell (153, 172) at zoom 4
    And Nelim's Pickle Tools: the camera root size is set to 4
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "survey-water-garden"
    And no errors were logged

  # SURVEY (2026-11-10): empty photo of hut on the decorated save, to read cells at the default light (no staging). Not a gallery shot.
  Scenario: survey hut
    Given I set the hour to 12
    And Nelim's Sanctuary: I am at the sanctuary "hut"
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "survey-hut"
    And no errors were logged

  # SURVEY (2026-11-10): empty photo of bare-clearing on the decorated save, to read cells at the default light (no staging). Not a gallery shot.
  Scenario: survey bare-clearing
    Given I set the hour to 12
    And Nelim's Sanctuary: I am at the sanctuary "bare-clearing"
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "survey-bare-clearing"
    And no errors were logged

  # SURVEY (2026-11-10): empty photo of emerald-clearing on the decorated save, to read cells at the default light (no staging). Not a gallery shot.
  Scenario: survey emerald-clearing
    Given I set the hour to 12
    And Nelim's Sanctuary: I am at the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "survey-emerald-clearing"
    And no errors were logged
