extends Component
class_name C_57_HITPOINTS


var value


func _init(valuePara):
	name="C_57_HITPOINTS"
	value = valuePara




########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "current Hitpoints, see C_16_MAX_HITPOINTS for max",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "role description",
}
static func getType_quack(): return "INTEGER"
