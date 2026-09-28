# Pass 1 (sans-facultatifs). Run once in English, once in French; the language is set at launch
# (-Language), never switched inside a scenario. Needs the InspectTabs companion, staged by
# wsl-deps.sans-facultatifs.map, for a def-based selection that does not depend on the run's
# language.
#
# Textures, life stages and the directional graphics themselves are read by a person from the
# attached captures (Authoring/README.md section 7): a green scenario says the spawn and the
# capture happened, not that the picture is right.

Feature: The four animals are drawn and read correctly in game

  @review
  Scenario Outline: the adult <defName> spawns, selects and is drawn without error
    Given the save "test-colony" is loaded
    And I close all dialogs
    When I spawn a "<defName>" pawn at (<x>, 150)
    And Nelim's Pickle Tools: I select the thing of def "<defName>" at (<x>, 150)
    And I move the camera to (<x>, 150)
    Then I take a screenshot "mengwu <defName> adult"
    And no errors were logged

    Examples:
      | defName    | x   |
      | MG_Horse   | 145 |
      | MG_TiaoShu | 148 |
      | MG_TuSun   | 151 |
      | MG_TuBoShu | 154 |

  @english
  Scenario: the four animals are labelled in English
    Given the save "test-colony" is loaded
    And I close all dialogs
    When I spawn a "MG_Horse" pawn at (145, 150)
    And Nelim's Pickle Tools: I select the thing of def "MG_Horse" at (145, 150)
    Then the inspect pane shows "Mengwu Horse"
    When I spawn a "MG_TiaoShu" pawn at (148, 150)
    And Nelim's Pickle Tools: I select the thing of def "MG_TiaoShu" at (148, 150)
    Then the inspect pane shows "Mogul Leaping Bunny"
    When I spawn a "MG_TuSun" pawn at (151, 150)
    And Nelim's Pickle Tools: I select the thing of def "MG_TuSun" at (151, 150)
    Then the inspect pane shows "Rabbit mantle"
    When I spawn a "MG_TuBoShu" pawn at (154, 150)
    And Nelim's Pickle Tools: I select the thing of def "MG_TuBoShu" at (154, 150)
    Then the inspect pane shows "Mongolian Woody Groundhog"
    And no errors were logged

  @french
  Scenario: the four animals are labelled in French
    Given the save "test-colony" is loaded
    And I close all dialogs
    When I spawn a "MG_Horse" pawn at (145, 150)
    And Nelim's Pickle Tools: I select the thing of def "MG_Horse" at (145, 150)
    Then the inspect pane shows "cheval mengwu"
    When I spawn a "MG_TiaoShu" pawn at (148, 150)
    And Nelim's Pickle Tools: I select the thing of def "MG_TiaoShu" at (148, 150)
    Then the inspect pane shows "gerboise mengwu"
    When I spawn a "MG_TuSun" pawn at (151, 150)
    And Nelim's Pickle Tools: I select the thing of def "MG_TuSun" at (151, 150)
    Then the inspect pane shows "chat de Pallas"
    When I spawn a "MG_TuBoShu" pawn at (154, 150)
    And Nelim's Pickle Tools: I select the thing of def "MG_TuBoShu" at (154, 150)
    Then the inspect pane shows "marmotte mengwu"
    And no errors were logged
