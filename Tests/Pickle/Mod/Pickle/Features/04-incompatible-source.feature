# Pass 2 (incompat-source): [SZ] Mengwu Expanded, then this port. Not a supported configuration.
#
# About.xml documents the symptom: "RimWorld resolves a duplicate defName by load order and logs
# nothing, so with both enabled one silently stands in for the other". That claim ages, so this
# pass goes and looks. Green means the symptom still holds as documented, not that both mods
# behave well together. Read again whenever the source mod changes; not replayed at every release.

@requires:SZ.MengGu.Expanded
Feature: The source mod is silently overridden, as documented

  Scenario: both mods load and the game does not warn about the duplicate defNames
    Then mod "SZ.MengGu.Expanded" is loaded
    And mod "nelim.mengwuexpandedanimals" is loaded
    And no errors were logged
