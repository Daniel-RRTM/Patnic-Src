extends Component
class_name _008_KitSelect



func setSelections(positions:Array,toReturn = []) -> Array :
	for layer in ENUM.SOKRATILES.SELECTABLE_LAYER.keys():
		var tilemapNode = SokraTiles.getLayerNode(layer)
		for position in positions:
			
			var ent = tilemapNode.getEntByPos_quack(position)
			if is_instance_valid(ent): toReturn.append(ent)
		
	return toReturn



# BUG B> LINEA KITSETS LIKE CRISPYFIER
func validateSelects(consideration:Array,toReturn = []) -> Array :
	for consi in consideration :
		if toReturn.empty(): 
			toReturn = API_005_Event.runConsideration(consi)

		else: 
			var newArray = []
			for entry in API_005_Event.runConsideration(consi): 
				if toReturn.has(entry):
					newArray.append(entry)
			toReturn = newArray
	return toReturn



func drawSelection(entsToDraw,texture) -> void :
	for ent in entsToDraw:   SokraTiles.getSelection().drawCell_quack(texture,ent.pos())








