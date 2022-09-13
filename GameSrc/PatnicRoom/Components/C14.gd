extends Component
class_name C_14_LEC_RAW_DATA

var value 

func _init(valuePara):
	name="C_14_LEC_RAW_DATA"
	value=valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "raw String of LEC file",
	"description" : "raw String of LEC file",
	"validInputs" : [],
	"validType"   : "STRING",
	"nameToShow"  : "raw lec",
}
static func getType_quack(): return "STRING"
