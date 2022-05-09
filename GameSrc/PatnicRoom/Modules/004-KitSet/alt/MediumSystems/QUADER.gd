extends Node 
class_name _004_Seize_MediumQuadAlt





static func run(taskData:Dictionary):
	var selection = API_004_KitSet.selection
	for source in selection.source:
		for height in range(33):
			var downleft = source
			downleft.x -= height
			downleft.y += height
			_004_Seize_MediumUniversal.run(30,ENUM.SOKRATILES.DIRECTION_FOUR.EAST,downleft)



static func runSelect():
	var pos = API_004_KitSet.selection.source[0]
	pos.x -= 32
	pos.y -= 32
	for x in range (64):
		pos.y += 1
		_004_Seize_MediumUniversal.run(64,ENUM.SOKRATILES.DIRECTION_FOUR.EAST,pos)
	
	var trimmed = {}
	for entry in API_004_KitSet.selection.kitset.selectedPositions():
		trimmed[entry] = ""
	API_004_KitSet.selection.kitset.getComp("C_53_SELECTED_POSITIONS").value = trimmed.keys()







func getAutoDoc() -> Dictionary : return {
	"descriiption"  : "used by other as a helper"
	,"concept"      : "SEIZE"
	,"name"         : "MEDIUM"
	,"valids"       : [  ]
	,"WIP"          : ""
	,"example"      : [
	]
}
