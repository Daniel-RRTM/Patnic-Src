extends Component
class_name C_1_IS_WALKABLE

var value: bool

func _init(valuePara:bool):
	self.name = "C_1_IS_WALKABLE"
	value = valuePara



	

static func getType_quack(): return "BOOLEAN"




static func getAutoDoc(): 
	return{
	"suggestion"  : "Interactables are often but not neccesarilly unwalkable, Meat Tiles are",
	"description" : "determinds if an Actor can walk on this tile",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Walkable",
}
