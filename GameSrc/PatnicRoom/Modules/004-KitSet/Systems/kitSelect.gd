extends Component
class_name _008_KitSelect


static func _setSelectionReference(kitSet:KitSetEntity) -> Dictionary:
	var event = kitSet.event
	var selection = {}
	selection["entity"]           = kitSet
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



static func getEntsOfPos(positions:Array,toReturn = []) -> Array :
	if API_004_KitSet.selection.medium == "SELF" : 
		return [API_003_Player.currentChar]
	
	
	for layer in ENUM.SOKRATILES.SELECTABLE_LAYER.keys():
		var tilemapNode = SokraTiles.getLayerNode(layer)
		for position in positions:
			
			var ent = tilemapNode.getEntByPos_quack(position)
			if is_instance_valid(ent): 
				toReturn.append(ent)
		
	return toReturn



func drawSelection(entsToDraw,texture) -> void :
	for ent in entsToDraw:   SokraTiles.getSelection().drawCell_quack(texture,ent.pos())


