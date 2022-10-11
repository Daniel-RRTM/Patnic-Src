extends Component
class_name C_43_QUESTS_GIVEN

var value=[]

func _init(valuePara):
	name = "C_43_QUESTS_GIVEN"
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
