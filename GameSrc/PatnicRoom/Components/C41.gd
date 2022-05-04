extends Component
class_name C_41_PERK_PROGRESSION

var value
const neededForUpgrade = _Enum_Player.ROOMS_FOR_TRAIT_NEEDED
func _init(valuePara=0):
	name="C_41_PERK_PROGRESSION"
	value = valuePara
 
func increment():
	value += 1

########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "X and Y on the tilemap",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "position",
	"configKey"   : "trait progression"
}
static func getType_quack(): return "INTEGER"
