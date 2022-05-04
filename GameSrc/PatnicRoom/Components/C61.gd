extends Component
class_name C_61_LOOT_TABLE


var value = {}


func _init(valuePara):
	name="C_61_LOOT_TABLE"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "has the variety and probabillity of drops",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "LootTable Data",
}
static func getType_quack(): return "DICTIONARY"
