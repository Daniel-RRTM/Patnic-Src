extends Component
class_name C_13_GENDER

var value: String
# REFACTOR is used as Array of all options but also as instanciated String by split(" AND ")
func _init(valuePara:String) -> void :
	self.name = "C_13_GENDER"
	value     = valuePara


 

static func getType_quack() -> String : return "STRING"


static func getAutoDoc() -> Dictionary : 
	return{
	"suggestion"  : "no suggestion, i dare you to asume it ;)",
	"description" : "Description of socially percieved sex better said gender",
	"validInputs" : [],   # references of ENUM-class only!
	"validType"   : getType_quack(),
	"nameToShow"  : "Gender",
}

