extends Node
class_name _006_Conditions_Validator



static func validate(toValidate:Array,validations:Array) -> bool:
	var isValid = true 
	
	for i in toValidate.size():
		var parameter  = toValidate[i]
		var rule       = validations[i]
		
		if  rule[0]=="COMPARE":   
			if !checkOptions(rule[1],parameter): isValid = false
		elif !isValid(parameter,rule): isValid = false
	
	return isValid





static func checkOptions(options:Array,parameter:Array) -> bool:
	match parameter[0]:
		"COMPONENT"           :   if !isComp(parameter[2])         :   return false
		"PROPERTY"            :   if !isProp(parameter[2])         :   return false
		"TYPE"                :   if !isType(parameter[2])         :   return false
		_                                                          :   return false
	return true



static func isValid(parameter:String,rule:String) -> bool:
	match rule:
		"COMPONENT"           :   if !isComp(parameter)            :   return false
		"PROPERTY"            :   if !isProp(parameter)            :   return false
		"TYPE"                :   if !isType(parameter)            :   return false
		"VALUE_CHANGE_MODE"   :   if !isValueChangeMode(parameter) :   return false
		"INTEGER"             :   if !isInteger(parameter)         :   return false
		"COMPARATOR"          :   if !isComparator(parameter)      :   return false
		"PERCENT"             :   if !isPercent(parameter)         :   return false
		"REACH"               :   if !isReach(parameter)           :   return false
		_:return false
	return true

	



static func isComp(comp:String)            -> bool :   return DemocrECS.getAllComponents().keys().has(comp)
static func isProp(prop:String)            -> bool :   return PROPERTIES.OF.keys().has(prop)
static func isType(type:String)            -> bool :   return ["TILE","ACTOR","INTERACT"].has(type)

static func isValueChangeMode(mode:String) -> bool :   return ["MOD","SET"].has(mode)
static func isComparator(mode:String)      -> bool :   return ["EQUALS","LESS","BIGGER"].has(mode)

static func isInteger(value:String)        -> bool :   return  value.to_int() != 0 or value == "0"
static func isPercent(value:String)        -> bool :   return  isInteger(value) and int(value) < 101 or "LEVEL" in value or "DURATION" in value
static func isReach(value:String)          -> bool :   return  isInteger(value) or ["LEVEL","DURATION"].has(value)






