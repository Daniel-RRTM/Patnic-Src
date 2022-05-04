extends Node
# BOOKMARK[epic=Modules] 013_Behavior                                          
# DOCS  > Docs\API\docs\Cogsmos\democrECS\SokraTILES.md                        
# DOCS  > TO ADD                                                               


# ----- INITIALICER -------------------------------------------------------------- ##


var inputMode: bool = true



# ----- PLACEHOLDER -------------------------------------------------------------- ##


func loopThroughActor():
	var actorsOnMap_Of_API007 = SokraTiles.actors_on_map
	var actorKeys = actorsOnMap_Of_API007.keys()
	
	for i in actorsOnMap_Of_API007.size():
		var currentEnt = actorsOnMap_Of_API007[actorKeys[i]]
		if is_instance_valid(currentEnt):
			walk(currentEnt)


func walk(ent:ActorEntity):
	if !ent.hasFlag("F_19_ACTOR_CAN_NOT_MOVE"):
		var direction = Utils.rng().getRandomNumber(0,3)
		var directionEnum = ENUM.SOKRATILES.DIRECTION_FOUR.values()[direction]

		var actorLayer = SokraTiles.getActor()
		actorLayer._drawCell(ent.index(), ent.pos())
		
		actorLayer.moveActor(directionEnum,ent)
		actorLayer._drawCell(ent.index(),ent.pos())


