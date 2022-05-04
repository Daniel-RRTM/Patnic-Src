extends SokraTiles_Chunk_Animation
class_name Sokratiles_Chunk_Selection


# ----- INITIALICE ----------------------------------------------------------- ##

func _ready() -> void: .initialice(ENUM.SOKRATILES.LAYER.SELECTION)



# ----- FUF --------------------------------------------------------------------- ##

func clearLayer() -> void:
	if !entsOnMap.empty():
		for currentPos in entsOnMap.keys():   set_cell(currentPos.x,currentPos.y, -1)
		entsOnMap = {}


func drawCell_quack(index:String, mainPos:Vector2) -> void:
	entsOnMap[mainPos] = index
	_drawCell(index, mainPos)


func drawMouseSelection(pos:Vector2,id) -> void:
	drawCell_quack( str(id), Vector2(pos.y+1,pos.x))



