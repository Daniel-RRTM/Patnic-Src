extends Component
class_name C_42_ROLE_VARIETY

var value=[]

func _init(valuePara):
	name = "C_42_ROLE_VARIETY"
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
static func getType_quack(): return "ARRAY"