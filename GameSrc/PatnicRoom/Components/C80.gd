
extends Component
class_name C_65_IS_WET

var value 


func _init(valuePara):
	name="C_65_TIER"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "on a scale of 1 to 10",
	"description" : "quality of Item",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "tier",
}
static func getType_quack(): return "INTEGER"
