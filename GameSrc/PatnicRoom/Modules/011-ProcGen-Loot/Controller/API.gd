extends Node
# BOOKMARK[epic=Modules] 013_Pcocgen_Loot                                      
# DOCS  > Docs\API\docs\Cogsmos\democrECS\SokraTILES.md                        
# DOCS  > TO ADD                                                               


# ----- INITIALICER -------------------------------------------------------------- ##


var _lootManager
var _lootSystem := _005_LootSystem.new()


func lootFilter() -> _005_LootSystem:return _lootSystem

func contextualEntityGeneration_quack(dict_or_ent):
	return _lootManager.contextualEntityGeneration_quack(dict_or_ent)

# WIP PLACEHOLDER
func generateLoot() -> void:
	var playerEnt = API_003_Player.currentChar
	var randomKitSets = []
	
	for kitSet in playerEnt.kitventory().kitsets().getAll():
		if is_instance_valid(kitSet.mod): 
			var baseParts = API_001_Atlas.KitParts().baseKitParts.values()
			var randomBase = Utils.rng().getRandomFromArray(baseParts)
			randomKitSets.append(randomBase)
		
		else:
			var suitingParts = API_001_Atlas.KitParts().getCoreAndTraitPartsOfFamilyIndex(kitSet.base.family(),false).values()
			if suitingParts.size() == 0: randomKitSets.append(Utils.rng().getRandomFromArray(API_001_Atlas.KitParts().baseKitParts.values()))
			else:
				var randomPart = Utils.rng().getRandomFromArray(suitingParts)
				randomKitSets.append(randomPart)
	
	if !randomKitSets.empty():
		var chosenKit = DemocrECS.copyEntity(Utils.rng().getRandomFromArray(randomKitSets))
		API_014_NewsLog.gearEntry("You found a KitPart!   "+chosenKit.name())
		playerEnt.kitventory().kitparts().append(chosenKit)
		API_009_Sound.playEnterPanicRoom()
	


func generateValuable(lootFilterIndex:String) -> void: 
	_lootSystem.addTask("VALUABLES",[lootFilterIndex])
	_lootSystem.runTasks()
