extends Component
class_name C_4_MAGIC_NOISE

var value: int

func _init(valuePara):
	name = "C_4_MAGIC_NOISE"
	value = int(valuePara)


	

static func getAutoDoc(): return{
	"suggestion"  : "WIP, not implemented,has no influence at the moment",
	"description" : "Determinds the handicap for sourronding dice tosses",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Magic Noise",
}

static func getType_quack(): return "INTEGER"
