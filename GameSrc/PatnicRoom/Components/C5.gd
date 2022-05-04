extends Component
class_name C_5_MATRIX_NOISE

var value: int

func _init(valuePara):
	name = "C_5_MATRIX_NOISE"
	value = int(valuePara)




static func getAutoDoc(): return{
	"suggestion"  : "WIP, not implemented,has no influence at the moment",
	"description" : "Determinds the handicap for sourronding dice tosses",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Matrix Noise",
}

static func getType_quack(): return "INTEGER"
