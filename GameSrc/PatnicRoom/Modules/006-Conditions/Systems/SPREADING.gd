extends Node
class_name _006_EFFECTS_SPREADING


# ----- MAIN --------------------------------------------------------------------- ##


static func run(cond:ConditionEntity,effectData:Dictionary) -> void :
	var tilemap   = SokraTiles.getLayerNode(cond.affectedEnt.layer())
	var sourcePos = cond.affectedEnt.pos()
	
	var condName = cond.name()
	var compare  = effectData["CONDITION"]
	
	
	for distance in int(effectData["REACH"]):
		for dir in ENUM.SOKRATILES.DIRECTION_FOUR.values():
			var currentEnt = tilemap.getEntByPos_quack(API_002_Tilemap.getMovePosByMultiple(sourcePos,dir,distance+1))
			if is_instance_valid(currentEnt):
				var isValid    = false
				
				var toLook
				match compare["REFERENCE"]:
					"PROPERTY" : toLook = currentEnt.properties
					"INDEX"    : toLook = [currentEnt.getCompValue("C_12_ATLAS_INDEX")]
					"TYPE"     : toLook = [TileEntity,InteractEntity,ActorEntity]
				
				
				if compare["COMPARATOR"] == "EQUALS" : 
					if toLook.has(PROPERTIES.OF.get(compare["VALUE"])): isValid = true
				
				
				if isValid and !currentEnt.hasCond(condName): 
					if int(effectData["PERCENT"]) > Utils.rng().getRandomNumber(0,100):
						API_006_Condition.attachConditionToEnt(currentEnt,condName,cond.duration,cond.level)



# ----- META --------------------------------------------------------------------- ##


static func validateDict(parameter:Array) -> bool:   return _006_Conditions_Validator.validate(parameter,getDoc()["VALID"])

static func getDoc() -> Dictionary :   return {
	"KEYWORD"     :   "SPREADING"                                                   ,
	"DESCRIPTION" :   "Moves By one to its Parameter"                               ,
	"VALID"       : [ ["COMPARE",["PROPERTY","INDEX","TYPE"]] , "PERCENT" , "REACH" ]
}

static func getArrToDict(parameter:Array) -> Dictionary :
	return {
		"PERCENT"   :   int(parameter[4])              ,
		"NAME"      :   "SPREADING"                    ,
		"REACH"     :   int(parameter[5])              ,       
		"CONDITION" : { "REFERENCE"  : parameter[1] ,
						"COMPARATOR" : parameter[2] ,
						"VALUE"      : parameter[3] }
	}


