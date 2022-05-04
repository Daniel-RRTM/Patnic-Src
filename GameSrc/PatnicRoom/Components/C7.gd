extends Component
class_name C_7_STATIC_TILESET_NR

var value: int

func _init(valuePara:int):
	name = "C_7_STATIC_TILESET_NR"
	value = int(valuePara)




static func getAutoDoc(): return{
	"suggestion"  : "Will be dynamically found at Bootstrap (at parsing tilesets)",
	"description" : "Number of tile in Master-atlas",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "static Tileset Number (do not fill)",
}

static func getType_quack(): return "INTEGER"
