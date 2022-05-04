extends Component
class_name C_28_RACIAL_FRIENDS

var races = []
var value

func _init(entRacesArrayPara):
	name = "C_28_RACIAL_FRIENDS"
	races = entRacesArrayPara
	value = races

func addToInventory(entPara):
	races.append(entPara)

func removeFromInventory(entPara):
	races.remove(entPara)



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "yes this is reference",
	"description" : "choose	races for pride",
	"validInputs" : API_001_Atlas.Race().getEntries().keys(),
	"validType"   : "STATIC_LIST",
	"nameToShow"  : "racial friends",
}
static func getType_quack(): return "ARRAY"
