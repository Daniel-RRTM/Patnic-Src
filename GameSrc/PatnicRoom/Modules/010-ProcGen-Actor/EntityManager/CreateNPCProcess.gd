extends Node
class_name _7_EntMan_Actor
 

var specialtyTemplate
var raceTemplate
var roleTemplate


func _convertEnt_quack(dict:Dictionary, ent:ActorEntity) -> ActorEntity:
	#>>> Basic Entries <<<#
	specialtyTemplate = API_001_Atlas.Specialty().getEntry(dict["C_12_FOR_SPECIALTY"])
	raceTemplate      = API_001_Atlas.Race().getEntry(dict["C_12_FOR_RACE"])
	roleTemplate      = API_001_Atlas.Role().getEntry(dict["C_12_FOR_ROLE"])
	

	#>>> Add Templates <<<#
	ent.addTemplate("race",raceTemplate)
	ent.addTemplate("role",roleTemplate)
	ent.addTemplate("specialty",specialtyTemplate)


	#>>> Add Synonym <<<#
	var synonymComponent = roleTemplate.getComp("C_47_SYNONYM")
	var randomNumber     = Utils.rng().getRandomNumber(0,synonymComponent.value.size()-1)
	var synonym          = synonymComponent.value[randomNumber]
	ent.addComponent(C_47_SYNONYM.new(synonym)) 
	

	#>>> Add Attributes <<<#
	var attributesOfRace = ent.getCompTempValue("race","C_19_ATTRIBUTES")
	var attributesOfRole = ent.getCompTempValue("role","C_19_ATTRIBUTES")
	
	var attributeSum = {}
	for key in attributesOfRace.keys():
		for value in attributesOfRole.values():
			attributeSum[key] = value + attributesOfRace[key]
	
	ent.addComponent(C_19_ATTRIBUTES.new(attributeSum))


	#>>> Add Skills <<<#
	var skillOfSpecialty = ent.getCompTempValue("specialty","C_20_SKILLBLOCK")
	var skillOfRole      = ent.getCompTempValue("role","C_20_SKILLBLOCK")
	
	var skillSum = {}
	for key in skillOfSpecialty.keys():
		for value in skillOfRole.values():
			skillSum[key] = value + skillOfSpecialty[key]
	
	ent.addComponent(C_20_SKILLBLOCK.new())
	ent.getComp("C_20_SKILLBLOCK").setSkillblock(skillSum)
	
	#>>> Add Indirects <<<#
	var comp = C_26_INDIRECT_STATS.new(ent.getComp("C_19_ATTRIBUTES"), ent)
	ent.addComponent(C_12_ATLAS_INDEX.new("Actors_0_0"))
	ent.addComponent(C_25_MAX_KITSETS.new())
	ent.addComponent(C_6_NAME.new("Actors_0_0"))

	return ent


