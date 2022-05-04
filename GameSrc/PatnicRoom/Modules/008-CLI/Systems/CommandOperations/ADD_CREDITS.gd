extends Node
class_name _API_017_Cmd_AddCredits


# ----- DOC ------------------------------------------------------------------ ##


static func getAutoDoc() -> Dictionary:
	return{	"toString"  : "add credits to account"      ,
			"parameter" : ["amount"]                    ,
			"list"      : [["50","100","1000","10000"]] ,
			"group"     : "gear"                        ,
			"input"     : "add credits"                 }



# ----- OPERTATION ----------------------------------------------------------- ##


static func run(parameter:Array) -> void:
	API_003_Player.currentChar.getComp("C_9_CREDITS_ACCOUNT").value += int(parameter[0])


