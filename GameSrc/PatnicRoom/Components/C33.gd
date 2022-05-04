extends Component
class_name C_33_COOLDOWN_TIMER

var value:int

func _init(valuePara):
	name = "C_33_COOLDOWN_TIMER"
	value = int(valuePara)


########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "guide value: Rarity*1",
	"description" : "by actions of player",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "cooldown",
}
static func getType_quack(): return "INTEGER"