extends Component
class_name C_9_CREDITS_ACCOUNT


var value : int


func _init(valuePara):
	name="C_9_CREDITS_ACCOUNT"
	value = int(valuePara)




static func getAutoDoc(): return{
	"suggestion"  : "Implemented but no Influence / Usage",
	"description" : "Amount of money in possesion",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Credits",
}

static func getType_quack(): return "INTEGER"
