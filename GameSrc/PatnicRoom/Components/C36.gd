extends Component
class_name C_36_KIT_MOD_TIME

var value

func _init(valuePara):
	name = "C_36_KIT_MOD_TIME"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "guide value: Rarity*1,5",
	"description" : "number of Panicrooms before its usable",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "setup time",
}
static func getType_quack(): return "STRING"
