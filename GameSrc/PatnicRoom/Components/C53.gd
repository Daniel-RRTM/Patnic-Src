extends Component
class_name C_53_LISTENER


var value 


func _init(valuePara):
	name="C_53_LISTENER"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "for quests",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "role description",
}
static func getType_quack(): return "STRING"
