extends Component
class_name C_37_M_TYPE

var value

func _init(valuePara):
	name = "C_37_M_TYPE"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : ["MEAT","MAGIC","MATRIX"],
	"validType"   : getType_quack(),
	"nameToShow"  : "layer of perception",
}
static func getType_quack(): return "ENUM"
