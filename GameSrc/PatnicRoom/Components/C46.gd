extends Component
class_name C_46_ACTOR_ITEMS

var value = {}

func _init(valuePara={}):
	name = "C_46_ACTOR_ITEMS"
	value = valuePara


	
########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "often owned by an Actor",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "List of Items",
	"configKey"   : "gear"
}
static func getType_quack(): return "STRING"
