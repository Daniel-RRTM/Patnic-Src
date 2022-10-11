extends Component
class_name C_32_LISTENER

var value: Array

func _init(valuePara):
	name = "C_32_LISTENER"
	value = valuePara




static func getAutoDoc(): return{
	"suggestion"  : "WIP, not implemented,has no influence at the moment",
	"description" : "Determinds the handicap for sourronding dice tosses",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Matrix Noise",
}

static func getType_quack(): return "ARRAY"
