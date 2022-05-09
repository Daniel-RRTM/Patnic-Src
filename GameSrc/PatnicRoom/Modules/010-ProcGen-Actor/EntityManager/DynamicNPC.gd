extends Node
class_name _03_00_EntityManager


func RNGeneratBasicActor(toGenerate:ActorRngTemplateEntity) -> ActorEntity:
	var keywordsToCompose = {}
	var mandatoryStats    = [ { "atlas":toGenerate.role()      , "keyword":"C_12_FOR_ROLE"      }  ,
							  { "atlas":toGenerate.race()      , "keyword":"C_12_FOR_RACE"      }  ,
							  { "atlas":toGenerate.specialty() , "keyword":"C_12_FOR_SPECIALTY" }  ]
	
	for type in mandatoryStats:
		var randomNumber = Utils.rng().getRandomNumber(0,type.atlas.size())-1
		keywordsToCompose[type.keyword] = type.atlas[randomNumber]
	
	return dictGenerateActor(keywordsToCompose)



func dictGenerateActor(dict:Dictionary) -> ActorEntity:
	#>>> Basic Entries <<<#
	var ent               = ActorEntity.new()
	var specialtyTemplate = API_001_Atlas.Specialties().getEntry(dict["C_12_FOR_SPECIALTY"])
	var raceTemplate      = API_001_Atlas.Race().getEntry(dict["C_12_FOR_RACE"])
	var roleTemplate      = API_001_Atlas.Role().getEntry(dict["C_12_FOR_ROLE"])
	

	#>>> Add Templates <<<#
	ent.addTemplate("race",raceTemplate)
	ent.addTemplate("role",roleTemplate)
	ent.addTemplate("specialty",specialtyTemplate)
	ent.addComponent(C_11_RACE_NAME.new(raceTemplate.getCompValue("C_6_NAME")))

	#>>> Add Synonym <<<#
	var synonymComponent = roleTemplate.getComp("C_47_SYNONYM")
	var randomNumber     = Utils.rng().getRandomNumber(0,synonymComponent.value.size()-1)
	var synonym          = synonymComponent.value[randomNumber]
	ent.addComponent(C_47_SYNONYM.new(synonym)) 
	

	#>>> Add Attributes <<<#
	var attributesOfRace = ent.getCompTempValue("race","C_19_ATTRIBUTES")
	var attributesOfRole = ent.getCompTempValue("role","C_19_ATTRIBUTES")
	
	var attributesSum = {}
	for key in attributesOfRace.keys():
		attributesSum[key] = attributesOfRace[key] + attributesOfRole[key]
	
	ent.addComponent(C_19_ATTRIBUTES.new(attributesSum))


	#>>> Add Skills <<<#
	var skillOfSpecialty = ent.getCompTempValue("specialty","C_20_SKILLBLOCK")
	var skillOfRole      = ent.getCompTempValue("role","C_20_SKILLBLOCK")
	var skillSum = {}
	for key in skillOfSpecialty.keys() : skillSum[key] = skillOfRole[key] + skillOfSpecialty[key]
	ent.addComponent(C_20_SKILLBLOCK.new())
	ent.getComp("C_20_SKILLBLOCK").setSkillblock(skillSum)
	
	#>>> Add Indirects <<<#
	var comp = C_26_INDIRECT_STATS.new(ent.getComp("C_19_ATTRIBUTES"), ent)
	ent.addComponent(C_12_ATLAS_INDEX.new("Actors_0_0"))
	ent.addComponent(C_25_MAX_KITSETS.new())
	ent.addComponent(C_6_NAME.new("Actors_0_0"))

	return ent






