# Pass 1 (sans-facultatifs). English. Needs the InspectTabs companion (wsl-deps.sans-facultatifs.map).
#
# Catches a broken ExposeData: the most common way a content mod loses state across a reload,
# per Pickle's own steps.md. The offline suite cannot see this at all, since it never runs a save.

Feature: The animals survive a save and reload

  Scenario: a horse and a groundhog keep their identity across a save and reload
    Given the save "test-colony" is loaded
    And I close all dialogs
    When I spawn a "MG_Horse" pawn at (145, 150)
    And I spawn a "MG_TuBoShu" pawn at (154, 150)
    And I save and reload
    And Nelim's Pickle Tools: I select the thing of def "MG_Horse" at (145, 150)
    Then the inspect pane shows "Mengwu Horse"
    When Nelim's Pickle Tools: I select the thing of def "MG_TuBoShu" at (154, 150)
    Then the inspect pane shows "Mongolian Woody Groundhog"
    And no errors were logged
