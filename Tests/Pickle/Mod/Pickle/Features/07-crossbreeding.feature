# Better Crossbreeding (DizzyEevee.BetterCrossbreeding, Workshop 3520675842) and Dogs mate (Mlie.DogsMate, 2441132298).
# Patches/Compat_BetterCrossbreeding.xml pairs MG_Horse with Horse, in both directions, the foal being the mother's
# kind (Maternal). Patches/Compat_DogsMate.xml puts MG_Horse in the Dogs mate group Horse. The other three animals
# are paired with nothing (reasons in the patch headers).
#
# HOW A CROSSBREED IS DECIDED, in two halves that must both exist: who MATES is decided by vanilla from the MALE's
# race (<canCrossBreedWith>); what is BORN by that mod from the MOTHER's PawnKindDef (DZY.CrossBreeding.Extension,
# <outcomes> keyed by the father's kind). So every pair is checked in both directions, on both halves.
#
# A BIRTH IS NOT ASKED OF A RUN: a gestation is days of game time and the draw belongs to that mod's code.
# No save is loaded: everything reads definitions.
# Steps: PickleTools DefFieldSteps. Written 2026-10-13 before NPT played them; the Dogs mate step is still to come.
@requires:DizzyEevee.BetterCrossbreeding
Feature: Better Crossbreeding sees the Mengwu horse as a horse

  Scenario: the Mengwu horse and the horse are a pair, in both directions
    Then Nelim's Pickle Tools: the race "MG_Horse" lists "Horse" as a crossbreeding partner
    And Nelim's Pickle Tools: the race "Horse" lists "MG_Horse" as a crossbreeding partner
    And Nelim's Pickle Tools: a "MG_Horse" mother answers a "Horse" father with Maternal
    And Nelim's Pickle Tools: a "Horse" mother answers a "MG_Horse" father with Maternal

  Scenario: the Mengwu horse is not paired with another vanilla animal, nor the other three with a horse
    Then Nelim's Pickle Tools: the race "MG_Horse" does not list "Donkey" as a crossbreeding partner
    And Nelim's Pickle Tools: the race "MG_TuSun" does not list "Cat" as a crossbreeding partner
    And Nelim's Pickle Tools: the race "MG_TiaoShu" does not list "Horse" as a crossbreeding partner
    And Nelim's Pickle Tools: the race "MG_TuBoShu" does not list "Squirrel" as a crossbreeding partner
