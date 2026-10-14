# Better Crossbreeding (DizzyEevee.BetterCrossbreeding, Workshop 3520675842) and Dogs mate (Mlie.DogsMate, 2441132298).
# Patches/Compat_BetterCrossbreeding.xml pairs MG_Horse with Horse, in both directions, the foal being the mother's
# kind (Maternal). Dogs mate needs no patch from this mod: it ships its own (1.6/Patches/SZ.MengGu.Expanded.xml,
# written for the original mod, whose defNames this port keeps) and files the four animals in its groups.
#
# HOW A CROSSBREED IS DECIDED, in two halves that must both exist: who MATES is decided by vanilla from the MALE's
# race (<canCrossBreedWith>); what is BORN by that mod from the MOTHER's PawnKindDef (DZY.CrossBreeding.Extension,
# <outcomes> keyed by the father's kind). So every pair is checked in both directions, on both halves.
#
# A BIRTH IS NOT ASKED OF A RUN: a gestation is days of game time and the draw belongs to that mod's code.
# No save is loaded: everything reads definitions.
# Steps: PickleTools DefFieldSteps (commit 5c78e7f), first played 2026-10-13 (ticket c768).
@requires:DizzyEevee.BetterCrossbreeding
Feature: Better Crossbreeding sees the Mengwu horse as a horse

  Scenario: the Mengwu horse and the horse are a pair, in both directions
    Then Nelim's Pickle Tools: the race "MG_Horse" lists "Horse" as a crossbreeding partner
    And Nelim's Pickle Tools: the race "Horse" lists "MG_Horse" as a crossbreeding partner
    And Nelim's Pickle Tools: a "MG_Horse" mother answers a "Horse" father with Maternal
    And Nelim's Pickle Tools: a "Horse" mother answers a "MG_Horse" father with Maternal

  # Only the pairs this mod's Better Crossbreeding patch could have written. The cat and the groundhog are NOT
  # asserted: the Dogs mate group Cat (its own patch) already gives MG_TuSun and MG_TuBoShu cat partners.
  Scenario: the Mengwu horse is not paired with another vanilla animal, nor the jerboa with a horse
    Then Nelim's Pickle Tools: the race "MG_Horse" does not list "Donkey" as a crossbreeding partner
    And Nelim's Pickle Tools: the race "MG_TiaoShu" does not list "Horse" as a crossbreeding partner
    And Nelim's Pickle Tools: the race "MG_TuBoShu" does not list "Squirrel" as a crossbreeding partner

  # Dogs mate (Mlie.DogsMate): its own patch files the four animals, this mod adds nothing. The scenario records what
  # the game ends up with, control first: Horse is the mod's own member of the group Horse.
  # First play of c768 showed MG_TuSun listing Cat, Lynx, Cat_Scimitar and MG_TuBoShu as partners: that is the group Cat.
  @requires:Mlie.DogsMate
  Scenario: Dogs mate files the four animals in its groups through its own patch
    Then Nelim's Pickle Tools: the pawn kind "Horse" is in the mating group "Horse"
    And Nelim's Pickle Tools: the pawn kind "MG_Horse" is in the mating group "Horse"
    And Nelim's Pickle Tools: the pawn kind "MG_TiaoShu" is in the mating group "Rat"
    And Nelim's Pickle Tools: the pawn kind "MG_TuSun" is in the mating group "Cat"
    And Nelim's Pickle Tools: the pawn kind "MG_TuBoShu" is in the mating group "Cat"
