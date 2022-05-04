extends Component
class_name C_15_BODYPARTS

var value = []

func _init(valuePara):
	name = "C_15_BODYPARTS"
	value = valuePara


func addToInventory(entPara):
	value.append(entPara)

func removeFromInventory(entPara):
	value.remove(entPara)



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "WIP, not implemented,has no influence at the moment",
	"description" : "All Bodypart-template of Race",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "List of All Bodyparts",
}
static func getType_quack(): return "CONTAINER"
