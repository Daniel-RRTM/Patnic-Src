extends Component
class_name C_59_KIT_MOD_CHANGE


var value = []


func _init(valuePara):
	name="C_59_KIT_MOD_CHANGE"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "Metadata for ModKitPart",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Mod KitSet Data",
}
static func getType_quack(): return "ARRAY"
