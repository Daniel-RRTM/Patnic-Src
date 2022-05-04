extends Node
class_name _006_EFFECTS_CONSTRAINT


# ----- HUB ---------------------------------------------------------------------- ##


static func run(cond:ConditionEntity,effectData:Dictionary) -> void :
	var effectType = effectData["TYPE"]

	match effectType:
		"MOVEMENT" : movementRestraint(cond)
		"KIT_USE"  : movementRestraint(cond)
		"ITEM_USE" : movementRestraint(cond)



# ----- MAIN --------------------------------------------------------------------- ##


static func movementRestraint(cond:ConditionEntity) -> void:
	if    cond.duration == 1                                  : cond.affectedEnt.removeFlag("F_19_ACTOR_CAN_NOT_MOVE")
	elif !cond.affectedEnt.hasFlag("F_19_ACTOR_CAN_NOT_MOVE") : cond.affectedEnt.addFlag("F_19_ACTOR_CAN_NOT_MOVE")


static func kitUseRestraint(cond:ConditionEntity) -> void:
	pass


static func itemUseRestraint(cond:ConditionEntity) -> void:
	pass



# ----- META --------------------------------------------------------------------- ##


static func validateDict(parameter:Array) -> bool:   return _006_Conditions_Validator.validate(parameter,getDoc()["VALID"])

static func getDoc() -> Dictionary:   return {
	"KEYWORD"         :   "CONSTRAINT"                          ,
	"PARAMETER_COUNT" :   1                                     ,
	"DESCRIPTION"     :   "Disables the use of Added Parameter" ,
	"VALID"           : [ "MOVEMENT" , "KIT_USE" , "ITEM_USE"   ]
}

static func getArrToDict(parameter:Array) -> Dictionary :
	return {    "TYPE"  :  parameter[0] ,  
				"NAME"  : "CONSTRAINT"  }

