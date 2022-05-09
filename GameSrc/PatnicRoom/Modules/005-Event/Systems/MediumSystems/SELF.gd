extends Node
class_name _004_Seize_MediumSelf

# ----- PROCESS -------------------------------------------------------------- ##


static func run(taskData:Dictionary) -> Array:
	return [API_003_Player.currentChar.pos()]



# ----- DOC ------------------------------------------------------------------ ##


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
