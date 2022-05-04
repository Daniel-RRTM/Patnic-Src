extends Component
class_name C_10_PERKS

var description=[]

func _init(descriptionPara):
	name = "C_10_PERKS"
	description = descriptionPara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "WIP, not implemented,has no influence at the moment",
	"description" : "Unique advantages of the Char",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Perks",
}
static func getType_quack(): return "ARRAY"
