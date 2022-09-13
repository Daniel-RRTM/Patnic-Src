extends Node
class_name _SokraTiles_SpawnActor


static func parse() -> void:
	for entTemp in SokraTiles.spawnLayer.objects:
		var actor = {}
		for template in entTemp.properties: actor["C_12_FOR_"+template.name] = template.value
		var actorEnt = API_010_ProcGen_Actor.createActorSpecific(actor)
		actorEnt.setPos(Vector2(actor["C_12_FOR_X"],actor["C_12_FOR_Y"]))
		SokraTiles.getActor().addActor(actorEnt)
		
		
	
	



