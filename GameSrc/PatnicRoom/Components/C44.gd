extends Component
class_name C_44_STREETNAME

var value: String

func _init(valuePara:String):
	name = "C_44_STREETNAME"
	value = valuePara


########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "unique Title",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Streetname",
	"configKey"   : "street-name"
}
static func getType_quack(): return "STRING"
