extends Component
class_name C_60_BASE_KIT_REFERENCE


var value 


func _init(valuePara):
	name="C_60_BASE_KIT_REFERENCE"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "choose the kit to specialice",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "base-kit reference",
}
static func getType_quack(): return "STRING"
