extends Node
# BOOKMARK[epic=Modules] 011_Procgen_Actor                                     
# DOCS  > Docs\API\docs\Cogsmos\democrECS\SokraTILES.md                        
# DOCS  > TO ADD                                                               


# ----- INITIALICER -------------------------------------------------------- ##


var entMan           : _03_00_EntityManager

func _init() :
	self.name        = "API_0007_ProcgenActor"
	entMan           = _03_00_EntityManager.new()



# ----- GETTER ------------------------------------------------------------- ##


func createActorTemplate(toConvert) -> ActorEntity:
	return _011_Hub_Template.run(toConvert)

func RNGenerateBasicActor(templateForGeneration) -> ActorEntity:
	return entMan.RNGeneratBasicActor(templateForGeneration)
	
func createActorSpecific(toConvert) -> ActorEntity:
	if toConvert is Array: 
		return entMan.dictGenerateActor({"C_12_FOR_RACE":toConvert[0],"C_12_FOR_ROLE":toConvert[1],"C_12_FOR_SPECIALTY":toConvert[2]})
	else:
		return entMan.dictGenerateActor(toConvert)


# ----- SETTER ------------------------------------------------------------- ##


func removeActorFromGame(ent:ActorEntity):
	var body = API_001_Atlas.Tiles().getEntry("Actors_6_3")
	body = DemocrECS.copyEntity(body)
	body.position = ent.pos()
	SokraTiles.getMeatFloor().addEntOnMap_quack(body)
	
	for compName in ent.components.keys():   if ent.hasComp(compName)                                                 :   ent.getComp(compName).free()
	for condName in ent.conditions.keys():   if ent.hasCond(condName) and is_instance_valid(ent.conditions[condName]) :   ent.conditions[condName].queue_free()
	SokraTiles.getActor().entsOnMap.erase(ent.get_instance_id())
	SokraTiles.getActor()._drawCell("-1",body.position)
	ent.free()
	if Utils.rng().getRandomFromArray([true,false]): API_011_ProcGen_Loot.generateLoot()


