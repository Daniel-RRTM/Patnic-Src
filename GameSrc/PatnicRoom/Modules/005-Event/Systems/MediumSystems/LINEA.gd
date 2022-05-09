extends Node
class_name _004_Seize_MediumLinea

# ----- PROCESS -------------------------------------------------------------- ##


static func run(taskData:Dictionary) -> Array:
	var reach = API_004_KitSet.selection.reach as int
	for direction in ENUM.SOKRATILES.DIRECTION_FOUR.values():
		for source in [API_003_Player.currentChar.pos()]:
			_004_Seize_MediumUniversal.run(reach,direction,source)
	
	var trimmed = {}
	for entry in API_004_KitSet.selection.selectedPos:
		trimmed[entry] = ""
	return trimmed.keys()


	
# ----- DOC ------------------------------------------------------------------ ##


func getAutoDoc() -> Dictionary : return {
	"descriiption"  : "selects by a line in one of 4 directions"
	,"concept"      : "SEIZE"
	,"name"         : "MEDIUM"
	,"valids"       : [  ]
	,"WIP"          : ""
	,"example"      : [
		"MEDIUM  --->  LINEA"
	]
}
