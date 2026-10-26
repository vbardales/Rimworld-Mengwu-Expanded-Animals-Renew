# Gallery of Mengwu Expanded - Animals Renew (unofficial). Shotlist written 2026-10-27; scenarios S2, S3, S4 written the same day (Check-Steps.ps1, nothing played).
# S1, S5 (and S6, the interface card) stay in the shotlist below: they are written once S2 to S4 have been read (a small ticket first, GALLERY.md: a series is played whole only when every scene is at 4).
# A ticket needs `-DepMap wsl-deps.gallery.map`; any ticket on another pass map excludes this suite (`!10-gallery`).
#
# STORY: "The steppe comes to the Sanctuary". One day, dawn to night, in the Sanctuary of Nelim (SanctuaryBacklot, the Nelims-tribe save).
# Nelim, the only colonist (NSB), welcomes a Mengwu horse and its three small companions: arrival (S1), the marmot's mound (S2), the noon
# nap of the night hunter (S3), the hunt that wakes at dusk (S4), the last latch at night (S5). S1 opens (wide, sets the paddock), S5
# closes (other gate, other rectangle). One start hour per scene (`I set the hour to N`, photographer's choice, 2026-10-14);
# weather Clear (set at once, the save keeps the previous one: NPT, 2026-10-27) except S5 (night). Frames (cells across): S2 tight 9, S4 tight-medium 12, S1 16 (opens, establishes the paddock), S5 18 (closes), S3 32 (the widest, the hut and its surroundings).
#
# NELIM, whole day (continuity, no change of outfit: the day is one): Apparel_Pants dyed rgb (70, 56, 44) first (legs), VAE_Apparel_Jumpsuit dyed
# rgb (31, 92, 69) deep emerald, VAE_Headgear_Scarf dyed rgb (230, 120, 40) orange accent (NELIM-PROFIL.md, "Quotidien"), hair Roo_HD_Hair_Highpony
# rgb (46, 34, 28) (no hat: no hat-hair mod needed), face = the sequence played green in CreaturesOfKi (held neutral, kit neutral, BrowNormal, MouthSmile,
# LidCheerful, expression "normal" LAST, map at 20 degrees); this replaces the `Nelim has her own face` step of the first draft, whose smirk is not the default
# smile the owner asks of default scenes. Only Nelim: no other colonist. Risk: the jumpsuit may not cover the legs the way the pants do (read on the capture).
#
# DEPMAP: `wsl-deps.gallery.map` (this folder): the Sanctuary map as base (copy of SanctuaryBacklot's, nothing challenged), plus the Backlot mod, screenshot mode,
# this mod and Mlie.XNDNocturnalAnimals 2269731409 (the cat sleeps by day, the jerboa wakes at dusk: the integration is what makes S3 and S4 true).
#
# STEPS ANSWERED BY NPT (2026-10-27, commit 1f54109, prefix "Nelim's Pickle Tools: ", map needs ColonistRace, NOT PLAYED): (1) `the animal "Y" lies at (x, z) facing South`
# (LayDown forceSleep) or `"Y" lies down`; (2) `"Y" faces South` or `the animal "Y" stands at (x, z) facing South`; (3) `the animal "cat" is forced into the job "PredatorHunt"
# targeting the animal "jerboa"`, then `I advance the paused game by exactly N ticks` (the exact step, NPT correction) and shoot BEFORE contact. If a step fails, send NPT the
# failure text: NPT fixes the step, no workaround here.
#
# CORRECTION 2026-10-27 (found while writing the scenarios): the "hole" at (149, 173) of water-garden is NOT a burrow. It is the steam geyser (SANCTUAIRE-LIEUX: "a dark hole at
# (149, 173)"; GALLERY-PROPS: "steam geyser at (150, 173)"; AlphaMythologyRenew rework 4: "a steam geyser stands at (149, 173)"). CreaturesOfKi's framing rule: every pond frame starts
# at x 152 or more. S2 therefore stages its own mound of dug earth (Filth_Dirt) on the moss bank at x 154 to 156 and the marmot sits beside it.
#
# SHOTLIST (index, name | place, hour, weather, time | subject, what it says | composition | living | decor | steps, DepMap | type):
#
# S1 mengwu-1-dawn-gate (reworked 2026-10-27 after reading the empty photograph Art/Locations/clean/12-candidate-enclosure-south.jpg of SanctuaryBacklot: the paddock holds about 40 farm animals,
#   bamboo clumps, a seedling crop and a dozen lit lamps of the fixture, so the scene first EMPTIES it: bare brown soil and fence, then stages its own steppe) |
#   enclosure-south, 07:00, Clear, 60 ticks of setup, then the horse is spawned and 60 ticks pass | the Mengwu horse waits just inside the south gate and Nelim brings its first hay: "A steppe horse
#   and a gate left open." | opening image, MEDIUM-WIDE, root size 4.5 centred on (159, 210): x about 151 to 167, z about 205.5 to 214.5; the fence stub and the gate (159, 207) at the bottom
#   of the frame, the horse right of centre at (162, 210), tufts of steppe grass left, bare soil, low sun; the horse sprite is about 2.1 cells of 16, about 35 px at 268 px | horse adult (MG_Horse)
#   FACING SOUTH TO THE CAMERA (`"Horse" faces South`: its front view, which S2 repeats for the marmot), looking at Nelim; Nelim comes in through the gate: she stands at (159, 206) facing North,
#   is forced to haul 1 Hay to (159, 209) and is paused 40 ticks in, mid-stride across the gate cell, hay in her hands; INSTANT: just after she opened the gate, just before she sets the hay down |
#   the paddock is emptied first (`the sanctuary "enclosure-south" is emptied`, animals removed, `the painted zones are hidden`), then TorchLamp lit at (157, 209), Plant_YellowTallGrass fully
#   grown at (153, 209), (154, 210), (164, 213), (165, 212), all removed after the shot | steps: emptied, painted zones hidden, `faces South` (NPT), haul, camera root size | story scene,
#   subtitle "The steppe horse has come."
#   RISK: the gate geometry is read on a photograph, not on a cell list (the gate cell (159, 207) may be a fence cell that blocks the walk): a blocked cell fails and names itself; move her one cell.
#
# S2 mengwu-2-the-mound | water-garden moss bank (earth x 145-156), 09:00, Clear, 60 ticks of setup | the marmot has come out beside its mound of dug earth as Nelim
#   walks into the frame: "A marmot and its mound of earth." | TIGHT, root size 2.5 centred on (156, 171): x about 151.6 to 160.4, z about 168.5 to 173.5, so the geyser (149 to 150) is out
#   of frame; marmot centre-left in the foreground FACING SOUTH TO THE CAMERA, shallow water and the lily pads to the east behind | marmot adult (MG_TuBoShu) at (154, 171) plus one
#   baby (AnimalBaby) at (155, 172), both `faces South`; Nelim walks East along z 172 from (150, 172) to (154, 172) and is paused after 26 ticks, mid-stride, at about x 152 on the left
#   edge of the frame, hands free; INSTANT: the marmot has just come out, Nelim steps in; the animals are spawned AFTER the walk, in the paused game, so they cannot wander off |
#   Filth_Dirt at (155, 170), (156, 170), (155, 171) (the mound), Plant_Daylily fully grown at (152, 170) and (153, 170); all removed after the shot | steps: `faces South` (NPT) |
#   story scene, subtitle "A marmot and its mound of earth."
#   RISK: the four wild animals of the bank (Chinchilla, Snowhare, Armadillo, Panda, around x 150 to 151) may drift into the frame while Nelim walks (the removal reaches x >= 153).
#
# S3 mengwu-3-noon-nap | hut (tea room), 12:00, Clear, 60 ticks of setup | the night hunter sleeps through noon: "The Pallas's cat
#   keeps night hours." | MEDIUM, `hut` frame zoom 9: cat in the foreground on the floor, the hut's own furniture and braziers behind, Nelim centre | Pallas's cat (MG_TuSun) lies asleep
#   at (141, 73) facing South (Nocturnal Animals makes it natural); Nelim comes in by the south door (140, 68) and is paused 40 ticks into her walk to (140, 74): mid-stride, facing North,
#   looking in; INSTANT: she has just come in, she is about to leave quietly; the cat's LayDown and her walk run in the same 40 ticks | PlantPot_Bonsai at (139, 72), Brazier lit at (143, 73) beside the
#   cat (cells (141 to 142, 72 to 73) and (143, 73) were free in CreaturesOfKi's infirmary scenario; a blocked cell fails and names itself: move it one cell) | steps: lies at (NPT), haul-free forced walk |
#   story scene, subtitle "The Pallas's cat sleeps by day."
#   FALLBACK if NPT's step fails and the owner does not arbitrate for it: cut S3, move the nocturnal beat into S5 (cat awake on the prowl).
#
# S4 mengwu-4-dusk-hop | bare-clearing, 18:00 dusk, Clear, 60 ticks of setup | the hunter wakes at dusk, the jerboa has not
#   seen it: "At dusk the hunt begins." | TIGHT-MEDIUM, root size 4 centred on (195, 151): x about 188.8 to 201.2, z about 147 to 155 | jerboa (MG_TiaoShu, crepuscular, awake) at (198, 151) in the open,
#   cat adult (MG_TuSun) at (193, 151) forced into PredatorHunt on it, Plant_YellowTallGrass at (195, 151), (195, 152), (194, 152) between the two; Nelim hauls Kibble from (189, 152) to (192, 153)
#   and is paused 30 ticks in, mid-stride, at the left edge, facing East; INSTANT: just before the pounce, no contact (the cat covers about 2.7 cells in 30 ticks, 5 cells away at the start;
#   N is tuned on the capture) | Plant_YellowTallGrass fully grown, Plant_Daylily at (190, 150) (the clearing's own flowers stay) | steps: PredatorHunt (NPT), haul |
#   story scene, subtitle "Dusk wakes the hunter."
#   RISK: both animals are small at 268 px (jerboa body 0.3, about 1 cell of 12.4 wide, about 22 px on the thumbnail): the frame is the tightest this place allows without losing Nelim.
#
# S5 mengwu-5-night-gate (reworked 2026-10-27; the "latch" gesture and the marmot near the egg boxes (they are at the far north-east of the paddock) are dropped: no step closes a gate) |
#   enclosure-south, west gate (130, 219), 21:00 night, Clear, 60 ticks of setup | the horse has gone in for the night and Nelim walks back to close the gate: "Everyone is home; Nelim
#   goes to close the gate." | closing image, MEDIUM-WIDE, root size 5 centred on (136, 219): x about 127 to 145, z about 214 to 224, the west fence and the gate on the left, the horse
#   walking away right of the gate, two small animals asleep on the soil, low warm light; the horse about 2.1 cells of 17.8, about 32 px at 268 px (S1 had a south gate, S5 the west one: another
#   side of the paddock, another rectangle, another hour) | horse adult spawned at (131, 219) and forced to walk to (140, 219), paused 40 ticks in (about 4.6 cells at 8.6 ticks per cell: at about
#   (135.6, 219)), seen from behind and the side, facing East; marmot adult asleep at (137, 221) and jerboa adult asleep at (139, 217), each `lies at (x, z) facing South` (the marmot's front view again);
#   Nelim at (135, 220) facing West is forced to walk to (131, 220) and is paused in the same 40 ticks, mid-stride toward the gate, profile; INSTANT: just after the horse went through, she goes to the
#   gate | the paddock emptied first, then TorchLamp lit at (131, 218) and (131, 221) flanking the gate and a Brazier lit at (137, 223); all removed after the shot | steps: emptied, painted zones
#   hidden, `lies at` and forced walks (NPT), camera root size | story scene (closing), subtitle "All four are home."
#   RISK: the gate cell (130, 219) read on a photograph; the two sleepers need the same ticks as the walks (set before the advance); the cat is absent (out hunting).
#
# S6 mengwu-6-info-card | window-backdrop-for-height, any hour | the "i" information card of the Mengwu horse (body size 2.6, pack
#   animal, 40 years): not scored, interface window cropped laterally, no subtitle | placed after S5 as an appendix.
#
# NOT SHOWN: A Dog Said Animal Prosthetics 2, Better Crossbreeding, Dogs mate (invisible in a still); only the Nocturnal Animals
# behaviour is read in S3 and S4. Baby life stage appears in S2 only; juvenile is not staged (declared, not shown).
@review @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.screenshotmode @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.camerazoom @requires:nelim.sanctuarybacklot @requires:Mlie.XNDNocturnalAnimals
Feature: The gallery of the Mengwu animals tells one day at the Sanctuary

  Background:
    Given the save "Nelims-tribe" is loaded
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
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (46, 34, 28)
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
    When Nelim's Pickle Tools: I frame the cell (156, 171) at zoom 2.5
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
    Then no warnings from mod "Mengwu Expanded - Animals Renew (unofficial)"
    And no errors were logged

  # S3, 12h00, Clear, MEDIUM (hut frame, zoom 9): the Pallas's cat asleep on the floor, Nelim comes in by the south door and is paused mid-stride (40 ticks: the cat's LayDown runs in the same ticks).
  Scenario: 12h00, the Pallas's cat sleeps in the tea room while Nelim steps in softly
    Given I set the hour to 12
    And game speed is ultrafast
    And Nelim's Pickle Tools: I let 60 ticks pass
    And game speed is paused
    And Nelim's Sanctuary: I am at the sanctuary "hut"
    And Nelim's Sanctuary: the animals are removed from the sanctuary "hut"
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (139, 72)
    And Nelim's Pickle Tools: I place the decor "Brazier" at (143, 73)
    And Nelim's Pickle Tools: the decor "Brazier" at (143, 73) is lit
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: "Nelim" stands at (140, 69) facing North
    And Nelim's Pickle Tools: "Nelim" body type is Female
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (46, 34, 28)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (70, 56, 44)
    And Nelim's Pickle Tools: "Nelim" wears "VAE_Apparel_Jumpsuit" dyed rgb (31, 92, 69)
    And Nelim's Pickle Tools: "Nelim" wears "VAE_Headgear_Scarf" dyed rgb (230, 120, 40)
    And Nelim's Pickle Tools: I let 120 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "MG_TuSun" named "Mantle" is spawned at (141, 73)
    And Nelim's Pickle Tools: the animal "Mantle" lies at (141, 73) facing South
    And Nelim's Pickle Tools: "Nelim" stands at (140, 69) facing North
    And Nelim's Pickle Tools: "Nelim" is forced to walk to (140, 74)
    And Nelim's Pickle Tools: I advance the paused game by exactly 40 ticks
    When Nelim's Pickle Tools: I frame the cell (141, 72) at zoom 9
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal"
    And I take a screenshot "mengwu-3-noon-nap"
    Then no warnings from mod "Mengwu Expanded - Animals Renew (unofficial)"
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
    And Nelim's Pickle Tools: "Nelim" stands at (189, 152) facing East
    And Nelim's Pickle Tools: "Nelim" body type is Female
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (46, 34, 28)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (70, 56, 44)
    And Nelim's Pickle Tools: "Nelim" wears "VAE_Apparel_Jumpsuit" dyed rgb (31, 92, 69)
    And Nelim's Pickle Tools: "Nelim" wears "VAE_Headgear_Scarf" dyed rgb (230, 120, 40)
    And Nelim's Pickle Tools: I let 120 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "MG_TiaoShu" named "Hop" is spawned at (198, 151)
    And Nelim's Pickle Tools: an adult animal of kind "MG_TuSun" named "Mantle" is spawned at (193, 151)
    And Nelim's Pickle Tools: the animal "Mantle" is forced into the job "PredatorHunt" targeting the animal "Hop"
    And Nelim's Pickle Tools: "Nelim" stands at (189, 152) facing East
    And Nelim's Pickle Tools: "Nelim" is forced to haul 1 of the item "Kibble" to (192, 153)
    And Nelim's Pickle Tools: I advance the paused game by exactly 30 ticks
    When Nelim's Pickle Tools: I frame the cell (195, 151) at zoom 4
    And Nelim's Pickle Tools: the camera root size is set to 4
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal"
    And I take a screenshot "mengwu-4-dusk-hop"
    Then no warnings from mod "Mengwu Expanded - Animals Renew (unofficial)"
    And no errors were logged
