extends Node
class_name _SokraTiles_SpawnActor


static func parse() -> void:
	if SokraTiles.spawnLayer.empty():
		for entTemp in SokraTiles.spawnLayer.objects:
			var actor = {}
			for template in entTemp.properties: actor[template.name] = template.value
			var actorEnt = API_010_ProcGen_Actor.createActorSpecific(actor)
			actorEnt.setPos(Vector2(actor["X"],actor["Y"]))
			SokraTiles.getActor().addActor(actorEnt)
			
		
	
	



