extends Node
# BOOKMARK[epic=Modules] 011_Procgen_Actor                                     
# DOCS  > Docs\API\docs\Cogsmos\democrECS\SokraTILES.md                        
# DOCS  > TO ADD                                                               


# ----- INITIALICER -------------------------------------------------------- ##


var entMan           : _03_00_EntityManager
var _actorAttributeSystem := _010_ActorAttributesSystem.new()
func _init() :
	self.name        = "API_0007_ProcgenActor"
	entMan           = _03_00_EntityManager.new()


func actorAttribute() ->_010_ActorAttributesSystem: return _actorAttributeSystem
# ----- GETTER ------------------------------------------------------------- ##


func createActorTemplate(toConvert) -> ActorEntity:
	return _011_Hub_Template.run(toConvert)

func RNGenerateBasicActor(templateForGeneration) -> ActorEntity:
	return entMan.RNGeneratBasicActor(templateForGeneration)
	
func createActorSpecific(toConvert) -> ActorEntity:
	if toConvert is Array: 
		return entMan.dictGenerateActor({"RACE":toConvert[0],"ROLE":toConvert[1],"SPECIALTY":toConvert[2]})
	else:
		return entMan.dictGenerateActor(toConvert)

func createConnectionFromActor(data) -> ActorEntity:
	var actorEnt = createActorSpecific(data[2])
	for flag in data[1]["FLAGS"]: actorEnt.addFlag(flag)
	
	for metaComp in data[0].keys(): 
		actorEnt.addComponent(DemocrECS.getComponentClass(metaComp).new(data[0][metaComp]))
	
	for comp in data[1]["COMPONENTS"].keys():
		if actorEnt.hasComp(comp):actorEnt.getComp(comp).free()
		actorEnt.addComponent(DemocrECS.getComponentClass(comp).new(data[1]["COMPONENTS"][comp]))
	
	return actorEnt

# ----- SETTER ------------------------------------------------------------- ##


func removeActorFromGame(ent:ActorEntity):
	var allFlags : Array
	for tmpl in ["RACE","ROLE","SPECIALTY"]: allFlags += ent.getFlagTemp(tmpl)
	API_015_Quest.emitSignal("Wanted_Actor_Killed",{"flags":allFlags})
	
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


