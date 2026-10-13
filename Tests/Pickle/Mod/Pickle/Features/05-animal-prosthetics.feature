# A Dog Said... Animal Prosthetics 2 (SamBucher.ADogSaidAnimalProsthetics2, Workshop 3238353862).
# Patches/Compat_ADogSaidAnimalProsthetics2.xml puts MG_Horse and MG_TuSun in the three surgery categories and
# MG_TiaoShu and MG_TuBoShu in the first only; About.xml declares <loadBefore> for it.
#
# WHAT ONLY A RUN SHOWS. ADS 2 copies its category lists onto its recipe bases ONCE, at its own last patch. A patch
# right on paper that loads after it leaves the real recipes without the animals, so the check is on the recipes
# the game built (ThingDef.AllRecipes), and on the load order.
#
# THE CONTROL. Horse is in all three categories and Squirrel in the first only: if they did not offer the same
# recipes, ADS 2 itself had not applied and a missing animal would prove nothing about this mod.
#
# One recipe per category: InstallPegLegAnimal (1), InstallSimpleProstheticLegAnimal (2), InstallBionicEyeAnimal (3).
# Typed steps only: every animal name is both a ThingDef and a PawnKindDef.
# Skipped by requirement in the pass without optional mods, on purpose: it is counted there, not hidden.
@requires:SamBucher.ADogSaidAnimalProsthetics2
Feature: Animal Prosthetics 2 offers its surgeries to the four animals

  Scenario: this mod loads before ADS 2, which is what its lists depend on
    Then mod "nelim.mengwuexpandedanimals" loads before "SamBucher.ADogSaidAnimalProsthetics2"

  Scenario: control, Horse is offered all three categories and Squirrel the first only
    Then Nelim's Pickle Tools: the recipe "InstallPegLegAnimal" is offered for the race "Horse"
    And Nelim's Pickle Tools: the recipe "InstallSimpleProstheticLegAnimal" is offered for the race "Horse"
    And Nelim's Pickle Tools: the recipe "InstallBionicEyeAnimal" is offered for the race "Horse"
    And Nelim's Pickle Tools: the recipe "InstallPegLegAnimal" is offered for the race "Squirrel"
    And Nelim's Pickle Tools: the race "Squirrel" is not offered the recipe "InstallBionicEyeAnimal"

  Scenario: the Mengwu horse and the Pallas's cat are offered all three categories
    Then Nelim's Pickle Tools: the recipe "InstallPegLegAnimal" is offered for the race "MG_Horse"
    And Nelim's Pickle Tools: the recipe "InstallSimpleProstheticLegAnimal" is offered for the race "MG_Horse"
    And Nelim's Pickle Tools: the recipe "InstallBionicEyeAnimal" is offered for the race "MG_Horse"
    And Nelim's Pickle Tools: the recipe "InstallPegLegAnimal" is offered for the race "MG_TuSun"
    And Nelim's Pickle Tools: the recipe "InstallSimpleProstheticLegAnimal" is offered for the race "MG_TuSun"
    And Nelim's Pickle Tools: the recipe "InstallBionicEyeAnimal" is offered for the race "MG_TuSun"

  Scenario: the jerboa and the marmot are offered the first category only
    Then Nelim's Pickle Tools: the recipe "InstallPegLegAnimal" is offered for the race "MG_TiaoShu"
    And Nelim's Pickle Tools: the race "MG_TiaoShu" is not offered the recipe "InstallBionicEyeAnimal"
    And Nelim's Pickle Tools: the recipe "InstallPegLegAnimal" is offered for the race "MG_TuBoShu"
    And Nelim's Pickle Tools: the race "MG_TuBoShu" is not offered the recipe "InstallBionicEyeAnimal"
