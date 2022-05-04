extends Component
class_name C_48_RARITY

var value

func _init(valuePara):
	name = "C_48_RARITY"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "1: Drek, 5: Fixer, 10: R&D-Prototype",
	"description" : "chance to loot on a scale of 1 to 10",
	"validInputs" : ENUM.ITEMS.RARITY_TO_STRING.values(),
	"validType"   : "STATIC_LIST",
	"nameToShow"  : "Rarity",
}
static func getType_quack(): return "INTEGER"
