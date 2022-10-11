extends Object
class_name _004_Seize_SourceSelf

# ----- PROCESS -------------------------------------------------------------- ##


static func run(taskData:Dictionary)->Array:  return [API_003_Player.currentChar.pos()]



# ----- DOC ------------------------------------------------------------------ ##


func getAutoDoc() -> Dictionary : return {
	"descriiption"  : "used as Origin of MEDIUM"
	,"concept"      : "SEIZE"
	,"name"         : "SOURCE"
	,"valids"       : [  ]
}
