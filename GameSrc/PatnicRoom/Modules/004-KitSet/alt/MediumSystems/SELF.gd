extends Node
class_name _004_Seize_MediumSelfAlt



static func run(taskData:Dictionary) -> Array:
	return [API_003_Player.currentChar.pos()]





func getAutoDoc() -> Dictionary : return {
	"descriiption"  : "Selects Player-char!"
	,"concept"      : "SEIZE"
	,"name"         : "MEDIUM"
	,"valids"       : [  ]
	,"WIP"          : ""
	,"example"      : [
		"MEDIUM  --->  SELF"
	]
}
