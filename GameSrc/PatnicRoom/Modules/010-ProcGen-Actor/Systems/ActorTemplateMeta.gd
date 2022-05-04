extends Node
class_name ActorRNGTemplate

var mandatoryValues = [ role , race , specialty , name ]  
var role
var race
var specialty


var additionalValuesToString = [ "TRAITS" , "KITSETS" , "ITEMS" , "LOOT_TABLES" ]
var dictOfAdditionalValues   = {}



func _init(mandatoryValues,additionalValues) -> void:
	name      = mandatoryValues["NAME"]
	role      = mandatoryValues["ROLE"]
	race      = mandatoryValues["RACE"]
	specialty = mandatoryValues["SPECIALTY"]
	
	
	for entry in additionalValuesToString:
		if additionalValues.has(entry): dictOfAdditionalValues[entry] = additionalValues[entry]
		else: dictOfAdditionalValues[entry] = "N/A"
	
	




