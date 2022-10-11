extends Object
class_name _002_TileInterpreter



func interpreteTileNr(actor,node:Node) -> void:
	var interact = SokraTiles.getMeatInteract().getEntByPos_quack(actor.pos())
	

	
	if is_instance_valid(interact):
		
		if ["POI_0_2","POI_0_6","POI_0_12"].has(interact.index()):
			API_011_ProcGen_Loot.generateLoot()
			SokraTiles.removeEntOnTilemap(interact)
			match interact.index():
				"POI_0_2" : API_011_ProcGen_Loot.generateValuable("VALUABLE_PED_FULL")
				"POI_0_6" : API_011_ProcGen_Loot.generateValuable("VALUABLE_PCD_FULL")
				"POI_0_12" : API_011_ProcGen_Loot.generateValuable("VALUABLE_REAGENTS_FULL")
			
		match interact.index():
			"General_2_0":
				var loadedInfo = load("res://GameSrc/PatnicRoom/scenes/Unique/Enter Restmode Popup/enterRestmode/enterSaveroom.tscn")
				node.get_node("/root").add_child(loadedInfo.instance())
	
	
	else:
		var tile = SokraTiles.getMeatFloor().getEntByPos_quack(actor.pos())
		if tile.hasComp("C_64_APPLY_CONDITION_WALKING"):
			var condName     = tile.getComp("C_64_APPLY_CONDITION_WALKING").condIndex
			var condDuration = tile.getComp("C_64_APPLY_CONDITION_WALKING").duration
			API_006_Condition.attachConditionToEnt(actor, condName, int(condDuration) )
	
	











