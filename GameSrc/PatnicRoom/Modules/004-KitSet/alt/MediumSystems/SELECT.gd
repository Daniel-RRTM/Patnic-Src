extends Node
class_name _004_Seize_MediumSelectAlt



static func run(taskData:Dictionary) -> Array:
	var toReturn = []
	var pos = API_003_Player.currentChar.pos()
	pos.x -= 32
	pos.y -= 32
	for x in range (64):
		pos.y += 1
		_004_Seize_MediumUniversalAlt.run(64,ENUM.SOKRATILES.DIRECTION_FOUR.WEST,pos)
		toReturn += API_004_KitSet.selection.selectedPos
		API_004_KitSet.selection.selectedPos.clear()
	
#	var trimmed = {}
#	for entry in API_004_KitSet.selection.kitset.selectedPositions():
#		trimmed[entry] = ""
#	API_004_KitSet.selection.kitset.getComp("C_53_SELECTED_POSITIONS").value = trimmed.keys()
	
	return toReturn




func getAutoDoc() -> Dictionary : return {
	"descriiption"  : "selects EVERY Entity on ppercievable scrren, ressource heavy!"
	,"concept"      : "SEIZE"
	,"name"         : "MEDIUM"
	,"valids"       : [  ]
	,"WIP"          : ""
	,"example"      : [
		"MEDIUM  --->  SELECT"
	]
}
