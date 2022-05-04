extends Component
class_name C_27_RACIAL_ENEMIES

var races = []
var value
func _init(entRacesArrayPara):
	name = "C_27_RACIAL_ENEMIES"
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
	"suggestion"  : "",
	"description" : "choose	races for prejudices",
	"validInputs" : API_001_Atlas.Race().getEntries().keys(),
	"validType"   : "STATIC_LIST",
	"nameToShow"  : "racial enemies",
}
static func getType_quack(): return "ARRAY"
