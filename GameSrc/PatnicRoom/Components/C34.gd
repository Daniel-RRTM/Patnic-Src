extends Component
class_name C_34_LOG_TO_STRING

var value

func _init(valuePara):
	name = "C_34_LOG_TO_STRING"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "is shown to the player in logs",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "log entry",
}
static func getType_quack(): return "STRING"