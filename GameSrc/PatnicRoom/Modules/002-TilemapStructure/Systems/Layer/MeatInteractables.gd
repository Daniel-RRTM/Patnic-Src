extends SokraTiles_Chunk_Interactables
class_name SokraTiles_Chunk_Meat_Interactables


# ----- INITIALICE ----------------------------------------------------------- ##


func _ready() -> void: .initialice(ENUM.SOKRATILES.LAYER.MEAT_INTERACTABLE,self)



# ----- GETTER --------------------------------------------------------------- ##


func getEntByPos_quack(mainPos:Vector2) -> InteractEntity:
	var validVec = stopAtDefaultTilemapSize(mainPos)
	if self.entsOnMap.has(validVec) :  return instance_from_id(self.entsOnMap[validVec]) as InteractEntity
	else                            :  return null



# ----- SETTER --------------------------------------------------------------- ##


func drawCell_quack(index:String, mainPos:Vector2) -> void:   
	_drawCell( index,mainPos )


func addEntOnMap_quack(entity) -> void:
	if entsOnMap.has(entity.pos()): instance_from_id(self.entsOnMap[entity.pos()]).free()
	self.entsOnMap[entity.pos()] = entity.get_instance_id()
	


func removeEntOnMap_quack(ent) -> void:
	if !entsOnMap.has(ent.pos()): return
	if entsOnMap[ent.pos()] != ent.get_instance_id():
		self.entsOnMap[ent.pos()].free()
		entsOnMap.erase(ent.pos())


