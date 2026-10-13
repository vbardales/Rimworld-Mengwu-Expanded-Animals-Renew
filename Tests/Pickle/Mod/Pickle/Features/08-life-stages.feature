# Pass 1 (sans-facultatifs). The baby and juvenile graphics of the four animals (TEST_SCENARIOS.md F04). The adult
# graphics are in 02-visuals.feature. Each animal is spawned at the named life stage through the ScreenshotStudio
# step (package nelim.pickletools.screenshotstudio, staged by the map), then photographed.
#
# A green scenario says the spawn and the capture happened, not that the picture is right: the captures are read
# by a person (@review). The stage ages and the number of graphics per stage are checked offline
# (Tests/Check-Content.ps1: life-stage counts, increasing ages, shipped textures).
# Language-independent: the animals are named by kind, not by label.
@review
Feature: The baby and juvenile stages of the four animals are drawn without error

  Scenario Outline: the <stage> <kind> is spawned, drawn and photographed
    Given the save "test-colony" is loaded
    And I close all dialogs
    And Nelim's Pickle Tools: an animal of kind "<kind>" named "Stage <kind>" is spawned at (<x>, 146) at the life stage "<stage>"
    When I move the camera to (<x>, 146)
    Then I take a screenshot "mengwu <kind> <stage>"
    And no errors were logged

    Examples:
      | kind       | stage          | x   |
      | MG_Horse   | AnimalBaby     | 145 |
      | MG_Horse   | AnimalJuvenile | 145 |
      | MG_TiaoShu | AnimalBaby     | 148 |
      | MG_TiaoShu | AnimalJuvenile | 148 |
      | MG_TuSun   | AnimalBaby     | 151 |
      | MG_TuSun   | AnimalJuvenile | 151 |
      | MG_TuBoShu | AnimalBaby     | 154 |
      | MG_TuBoShu | AnimalJuvenile | 154 |
