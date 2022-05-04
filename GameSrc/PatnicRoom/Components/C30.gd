extends Component
class_name C_30_NEEDED_BACKPACK_SLOTS

var value: int

func _init(valuePara):
	name = "C_30_NEEDED_BACKPACK_SLOTS"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "WIP, not implemented,has no influence at the moment",
	"description" : "size and wight taking up to carry",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "backpack slots",
}
static func getType_quack(): return "INTEGER"