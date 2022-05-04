extends Component
class_name C_11_RACE_NAME

var value 

func _init(valuePara):
	name="C_11_RACE_NAME"
	value=valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "Are used as Index for API_001_Atlas.ActorRace , CAPSLOCK is recommended",
	"description" : "toString of the Template name",
	"validInputs" : API_001_Atlas.Race().getEntries().keys(),
	"validType"   : "DYNAMIC_LIST",
	"nameToShow"  : "Race name",
	"configKey"   : "race"
}
static func getType_quack(): return "STRING"
