extends Node
class_name _004_Seize_MediumSelect

# ----- PROCESS -------------------------------------------------------------- ##


static func run(taskData:Dictionary) -> Array:
	var toReturn = []
	var pos = API_003_Player.currentChar.pos()
	pos.x -= 32
	pos.y -= 32
	for x in range (64):
		pos.y += 1
		_004_Seize_MediumUniversal.run(64,ENUM.SOKRATILES.DIRECTION_FOUR.WEST,pos)
		toReturn += API_004_KitSet.selection.selectedPos
		API_004_KitSet.selection.selectedPos.clear()
	
	return toReturn



# ----- DOC ------------------------------------------------------------------ ##


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
