extends Component
class_name C_6_NAME

var value: String

func _init(valuePara:String):
	name = "C_6_NAME"
	value = String(valuePara)




static func getAutoDoc(): return{
	"suggestion"  : "max 2 words / 15 chars",
	"description" : "short reference shown in the most cases",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Name",
}

static func getType_quack(): return "STRING"
