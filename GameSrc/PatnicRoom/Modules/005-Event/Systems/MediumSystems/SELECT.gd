extends Node
class_name _004_Seize_MediumSelect

# ----- PROCESS -------------------------------------------------------------- ##


static func run(taskData:Dictionary) -> Array:
	var toReturn = []
	var pos = API_003_Player.currentChar.pos()
	pos.x -= 16
	pos.y -= 16
	for x in range (32):
		pos.y += 1
		_004_Seize_MediumUniversal.run(64,ENUM.SOKRATILES.DIRECTION_FOUR.WEST,pos)
		toReturn += API_004_KitSet.selection.selectedPos
		API_004_KitSet.selection.selectedPos.clear()
	
	return toReturn



# ----- DOC ------------------------------------------------------------------ ##


func getAutoDoc() -> Dictionary : return {
	"description"  : "selects EVERY Entity on percievable screen, ressource heavy! has radius of 30"
	,"concept"      : "SEIZE"
	,"name"         : "MEDIUM"
	,"valids"       : [  ]
	
}
