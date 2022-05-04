extends Node
# BOOKMARK[epic=Modules] 013_Pcocgen_Loot                                      
# DOCS  > Docs\API\docs\Cogsmos\democrECS\SokraTILES.md                        
# DOCS  > TO ADD                                                               


# ----- INITIALICER -------------------------------------------------------------- ##


var _lootManager

#func _init() :
#	_lootManager = _18_TileEntManager.new("API_18_LootEntityManager", ENUM.MINIMAL_COMP.LOOT_TABLE)
#


func contextualEntityGeneration_quack(dict_or_ent):
	return _lootManager.contextualEntityGeneration_quack(dict_or_ent)




		
