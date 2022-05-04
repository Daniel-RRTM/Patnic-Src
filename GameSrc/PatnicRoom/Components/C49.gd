extends Component
class_name C_49_EVENT_REFERENCE

var value

func _init(valuePara):
	name = "C_49_EVENT_REFERENCE"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "Is used to build EffectEntity",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "EffectEntity",
}
static func getType_quack(): return "EFFECT"
