extends Node
class_name _006_EFFECTS_AFFECTING


# ----- MAIN --------------------------------------------------------------------- ##


static func run(cond:ConditionEntity,effectData:Dictionary) -> void :
	var effectMode = effectData["MODE"]
	var compValue  = effectData["VALUE"]
	var compName   = effectData["COMPONENT"]

	if cond.affectedEnt.hasComp(compName):
		var comp = cond.affectedEnt.getComp(compName)
		if effectMode == "MOD" : comp.value += compValue
		else                   : comp.value  = compValue



# ----- META --------------------------------------------------------------------- ##


static func validateDict(parameter:Array) -> bool:   return _006_Conditions_Validator.validate(parameter,getDoc()["VALID"])

static func getDoc() -> Dictionary:   return {
	"KEYWORD"     :   "AFFECTING"                                         ,
	"DESCRIPTION" :   "Manipulates the value of a Component by the Value" ,
	"VALID"       : [ "COMPONENT" , "VALUE_CHANGE_MODE" , "INTEGER"       ]
}

static func getArrToDict(parameter:Array) -> Dictionary:
	return {   "COMPONENT" : parameter[1]        ,
			   "MODE"      : parameter[2]        ,
			   "NAME"      : "AFFECTING"         ,
			   "VALUE"     : int(parameter[3])   }



