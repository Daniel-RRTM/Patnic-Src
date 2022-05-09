extends Node
class_name _004_Seize_MediumArea

# ----- PROCESS -------------------------------------------------------------- ##


static func run(taskData:Dictionary) -> Array:
	API_004_KitSet.selection.reach = int(API_004_KitSet.selection.reach)+2 as int # BUG 
	for source in API_004_KitSet.selection.sourcePos:
		foobarToo(source,true)
		foobarToo(source,false)
	return API_004_KitSet.selection.selectedPos


static func foobarToo(source,upperHalf):
	var toItterate = int(API_004_KitSet.selection.reach)
	var itteration = 0
	while true:
		
		var middlePoint = source
		itteration += 1
		toItterate -= 1
		
		if upperHalf       : middlePoint.y -= toItterate
		else               : middlePoint.y += toItterate
		if toItterate == 0 : itteration=itteration-1
		
		
		if itteration != 1:
			_004_Seize_MediumUniversal.run(itteration,ENUM.SOKRATILES.DIRECTION_FOUR.EAST,middlePoint)
			_004_Seize_MediumUniversal.run(itteration,ENUM.SOKRATILES.DIRECTION_FOUR.WEST,middlePoint)
		
		if toItterate == 0 : return



# ----- DOC ------------------------------------------------------------------ ##


func getAutoDoc() -> Dictionary : return {
	"descriiption"  : "selects by a circle"
	,"concept"      : "SEIZE"
	,"name"         : "MEDIUM"
	,"valids"       : [  ]
	,"WIP"          : ""
	,"example"      : [
		"MEDIUM  --->  AREA"
	]
}
