extends Component
class_name C_0_DESCRIPTION

var value: String

func _init(valuePara:String):
	self.name = "C_0_DESCRIPTION"
	value = valuePara
 



static func getType_quack(): return "STRING"


static func getAutoDoc(): 
	return{
	"suggestion"  : "It should feel like a cyncal critique of todays and tomorrows problems",
	"description" : "Summary of the Entity in one sentence, to get a broad idea",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Description",
}

