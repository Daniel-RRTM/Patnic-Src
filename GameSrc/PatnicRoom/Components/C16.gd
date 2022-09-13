extends Component
class_name C_16_MAX_HITPOINTS


var value


func _init(valuePara):
	name="C_16_MAX_HITPOINTS"
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
static func getType_quack(): return "INTEGER"
