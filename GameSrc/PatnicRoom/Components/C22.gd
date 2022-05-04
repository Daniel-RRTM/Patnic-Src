extends Component
class_name C_22_LIMITS

var value = {}

func _init(physicalLimit, socialLimit, mentalLimit):
	name = "C_22_LIMITS"
	value = {
		"physicalLimit":physicalLimit,
		"socialLimit":socialLimit,
		"mentalLimit":mentalLimit
	}

func getPysicalLimit():
	return value["physicalLimit"]
	
func getSozialLimit():
	return value["socialLimit"]
	
func getMentallLimit():
	return value["mentalLimit"]



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "Gets calculatet on runtime by Actors Attributes",
	"description" : "max. succeses per dice-role",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Limits",
}
static func getType_quack(): return "INTEGER"
