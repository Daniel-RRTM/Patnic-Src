extends Component
class_name C_62_LOOT_STATE


var value 


func _init(valuePara):
	name="C_62_LOOT_STATE"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "role description",
}
static func getType_quack(): return "STRING"
