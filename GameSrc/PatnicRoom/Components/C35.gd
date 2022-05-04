extends Component
class_name C_35_KIT_MECHANICAL_SUMMARY

var value

func _init(valuePara):
	name = "C_35_KIT_MECHANICAL_SUMMARY"
	value = valuePara


	
########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "about 80 characters at max",
	"description" : "shown as short explaination of usage",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "summary",
}
static func getType_quack(): return "STRING"