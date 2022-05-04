extends SokraTiles_Chunk_Floor
class_name SokraTiles_Chunk_Meat_Floor


# ----- INITIALICE ----------------------------------------------------------- ##

func _ready() -> void:.initialice(ENUM.SOKRATILES.LAYER.MEAT_GROUND,self)

 

# ----- GETTER --------------------------------------------------------------- ##


func getEntByPos_quack(mainPos:Vector2) -> TileEntity:
	var validVec = stopAtDefaultTilemapSize(mainPos)
	if self.entsOnMap.has(validVec) :  return instance_from_id(self.entsOnMap[validVec]) as TileEntity
	else                            :  return null



# ----- SETTER --------------------------------------------------------------- ##


func drawCell_quack(index:String, mainPos:Vector2) : ._drawCell(index,mainPos)


func addEntOnMap_quack(entity:TileEntity) -> void:
	if entsOnMap.has(entity.pos()): instance_from_id(self.entsOnMap[entity.pos()]).free()
	self.entsOnMap[entity.pos()] = entity.get_instance_id()
	drawCell_quack(entity.index(),entity.position)


func removeEntOnMap_quack(ent:TileEntity) -> void:
	if entsOnMap[ent.pos()] != ent.get_instance_id():
		instance_from_id(self.entsOnMap[ent.pos()]).free()
		entsOnMap.erase(ent.pos())



