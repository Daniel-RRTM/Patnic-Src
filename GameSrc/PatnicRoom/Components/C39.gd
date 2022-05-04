extends Component
class_name C_39_KITSLOT_PROGRESSION

var value
const neededForUpgrade = _Enum_Kits.PEACES_TILL_NEW_SLOT

func _init(valuePara=0):
	name = "C_39_KITSLOT_PROGRESSION"
	value = valuePara
	




func increment(): 
	value += 1
	

	if !self.owner.hasComp("C_25_MAX_KITSETS"):
		var cache = load("res://Src/Components/C39.gd").instance()
		self.owner.addComponent(cache.new(3))

func check(): return value == neededForUpgrade

func upgrade(): 
	if check():	
		owner.getComp("C_25_MAX_KITSETS").value += 1  
		value = 0



static func getType_quack():   return "INTEGER"
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "countdown untill the Kit in its Restroom is finished",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "progression edited KitSet",
	"configKey"   : "kitslot progression"
}
