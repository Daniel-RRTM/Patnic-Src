extends Component
class_name C_52_STARTING_KITSETS

var value = []

func _init(valuePara):
	name = "C_52_STARTING_KITSETS"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "adds their indexes as kitsets to the Character by openeing the menue",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Starting Kitsets Cheat",
}
static func getType_quack(): return "ARRAY"
