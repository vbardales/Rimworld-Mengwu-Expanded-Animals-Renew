# [XND] Nocturnal Animals (Continued) (Mlie.XNDNocturnalAnimals, Workshop 2269731409).
# Patches/Compat_NocturnalAnimals.xml gives MG_TuSun the body clock Nocturnal (as that mod gives Lynx) and MG_TiaoShu
# Crepuscular (as Chinchilla); MG_Horse and MG_TuBoShu get none (Horse and Squirrel are unlisted there).
#
# WHAT ONLY A RUN SHOWS. The patch adds an XML node whose class names a type of ANOTHER mod's assembly. The
# offline tests show the node is added when that mod is present; that the game resolves the class and reads the
# field is settled by loading it. The steps read the extension through reflection.
#
# THE CONTROLS. Lynx must read Nocturnal and Chinchilla Crepuscular (that mod's own entries): if not, it had not
# applied its own patch and a missing animal would prove nothing about this one. Horse must read no clock.
# No save is loaded: everything reads definitions.
# Steps: PickleTools DefFieldSteps (nelim.pickletools.deffields). Written 2026-10-13 before NPT played them.
@requires:Mlie.XNDNocturnalAnimals
Feature: Nocturnal Animals sees the Pallas's cat and the jerboa as it sees their vanilla analogues

  Scenario: control, the mod's own entries are in place
    Then Nelim's Pickle Tools: the race "Lynx" has the body clock Nocturnal
    And Nelim's Pickle Tools: the race "Chinchilla" has the body clock Crepuscular
    And Nelim's Pickle Tools: the race "Horse" has no body clock

  Scenario: the Pallas's cat is nocturnal and the jerboa crepuscular
    Then Nelim's Pickle Tools: the race "MG_TuSun" has the body clock Nocturnal
    And Nelim's Pickle Tools: the race "MG_TiaoShu" has the body clock Crepuscular

  Scenario: the horse and the marmot have no body clock, like Horse and Squirrel
    Then Nelim's Pickle Tools: the race "MG_Horse" has no body clock
    And Nelim's Pickle Tools: the race "MG_TuBoShu" has no body clock
