extends Object
class_name _011_Hub_Template



static func run(dict):   return ActorRNGTemplate.new( evaluateMandatory(dict), evaluateAdditional(dict) )


static func evaluateMandatory(dict):
	return{
		 "SPECIALTY" : _SPECIALTY.run(dict["SPECIALTY"])
		,"ROLE"      :      _ROLE.run(dict["ROLE"])
		,"RACE"      :      _RACE.run(dict["RACE"])
		,"NAME"      :                dict["NAME"]
	}


static func evaluateAdditional(dict,toReturn={}):
	for keyword in dict:   
		match keyword: 
			"LOOT_TABLES" :  toReturn["LOOT_TABLES"] = keyword
			"KITSETS"     :  toReturn["KITSETS"]     = keyword
			"ITEMS"       :  toReturn["ITEMS"]       = keyword
			"TRAITS"      :  toReturn["TRAITS"]      = keyword
	return toReturn
	




