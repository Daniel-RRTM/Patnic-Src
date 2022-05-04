extends SokraTiles_Chunk_Basic
class_name SokraTiles_Chunk_Actors


var dirtyTiles = []

func initialice(layerEnum,layerNode) -> void:
	var layerToParse = SokraTiles.getLayerDictionary(layerEnum)
	SokraTiles.addLayerManager(layerEnum,layerNode)

func addActor(actorEnt:ActorEntity) -> void:
	SokraTiles.actors_on_map[actorEnt.pos()] = actorEnt
	SokraTiles.getActor().entsOnMap[actorEnt.pos()] = actorEnt
	SokraTiles.getActor().drawCell_quack(actorEnt.index(),actorEnt.pos())



func moveActor(directionEnum,ent) -> void:
	var newPos = ent.pos()
	match directionEnum:
		ENUM.SOKRATILES.DIRECTION_FOUR.NORTH : newPos.y -= 1
		ENUM.SOKRATILES.DIRECTION_FOUR.WEST  : newPos.x += 1
		ENUM.SOKRATILES.DIRECTION_FOUR.EAST  : newPos.x -= 1
		ENUM.SOKRATILES.DIRECTION_FOUR.SOUTH : newPos.y += 1
	
	var interact = SokraTiles.getMeatInteract().getEntByPos_quack(newPos)
	var move     = false
	
	if   !is_instance_valid(interact)     : move = true
	elif ent.hasFlag("F_CHEAT_1_NO_CLIP") : move = true 
	elif interact.isWalkable()            : move = true
	
	if move: moveaActor(newPos,ent)




func moveaActor(newPos,ent):
	var cache = ent.pos()
	entsOnMap.erase(cache)
	set_cell(cache.x,cache.y,-1)
	ent.setPos(newPos)
	entsOnMap[newPos]=ent
	_drawCell(ent.index(), newPos)





