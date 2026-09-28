# Pass 1 (sans-facultatifs): the mod alone. No save: def and mod checks resolve at the main menu.
#
# Only what a running game can show is kept here. The XML, the DefInjected paths, the shipped
# images and the four Wildness/statBases migrations are checked offline by Tests/Run-Tests.ps1.
# MG_Horse, MG_TiaoShu, MG_TuSun and MG_TuBoShu each name a ThingDef and a PawnKindDef with the
# same defName, so this suite uses only the typed "of type" form for them: Pickle's own untyped
# def steps (field, stat, "defined by mod") refuse an ambiguous name, and the offline suite
# already reads every field and stat from the shipped XML.

Feature: The mod loads and owns its four animals

  Scenario: the mod is loaded and each animal exists as both a race and a kind
    Then mod "nelim.mengwuexpandedanimals" is loaded
    And def "MG_Horse" of type "ThingDef" exists
    And def "MG_Horse" of type "PawnKindDef" exists
    And def "MG_TiaoShu" of type "ThingDef" exists
    And def "MG_TiaoShu" of type "PawnKindDef" exists
    And def "MG_TuSun" of type "ThingDef" exists
    And def "MG_TuSun" of type "PawnKindDef" exists
    And def "MG_TuBoShu" of type "ThingDef" exists
    And def "MG_TuBoShu" of type "PawnKindDef" exists
    And no errors were logged
