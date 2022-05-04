extends Node
class_name _004_Seize_MediumSelf



static func run() -> Array:
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
