extends Component
class_name C_24_PASSIVE_ACTIVE

var value = []


func _init(valuePara):
	name="C_24_PASSIVE_ACTIVE"
	value = valuePara




########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "max Hitpoints, see C_57_HITPOINTS for current",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "role description",
}
static func getType_quack(): return "ARRAY"
