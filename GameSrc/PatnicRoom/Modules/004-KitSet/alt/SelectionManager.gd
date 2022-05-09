extends Object
class_name _004_SelectionManager





static func run(inputNr:int) -> void:
	API_004_KitSet.selection = _setSelectionReference(inputNr)
	
	API_004_KitSet.selection.sourcePos     = API_005_Event.runSource(API_004_KitSet.selection)
	API_004_KitSet.selection.selectedPos   = API_005_Event.runMedium(API_004_KitSet.selection)
	API_004_KitSet.selection.selectedEnts  = _getEntsOfPos(API_004_KitSet.selection.selectedPos)
	API_004_KitSet.selection.triggeredEnts = API_005_Event.getTriggeredSelects(API_004_KitSet.selection)
	
	





static func _setSelectionReference(inputNr:int) -> Dictionary:
	var event = API_003_Player.currentChar.kitventory().kitsets().getByNr(inputNr).event
	var selection = {}
	
	selection["reach"]            = event["SELECT"]["SEIZE"]["REACH"]
	selection["source"]           = event["SELECT"]["SEIZE"]["SOURCE"]
	selection["medium"]           = event["SELECT"]["SEIZE"]["MEDIUM"]
	selection["perform"]          = event["RUN"]["PERFORM"]
	selection["consider"]         = event["SELECT"]["CONSIDER"]
	selection["alertTexture"]     = API_005_Event.getAlertColor(selection.medium)
	selection["highlightTexture"] = API_005_Event.getHighlightColor(selection.medium)
	
	selection["sourcePos"] = []
	selection["selectedPos"] = []
	selection["selectedEnts"] = []
	selection["triggeredEnts"] = []
	
	return selection






static func _getEntsOfPos(positions:Array,toReturn = []) -> Array :
	for layer in ENUM.SOKRATILES.SELECTABLE_LAYER.keys():
		var tilemapNode = SokraTiles.getLayerNode(layer)
		for position in positions:
			
			var ent = tilemapNode.getEntByPos_quack(position)
			if is_instance_valid(ent): toReturn.append(ent)
		
	return toReturn



