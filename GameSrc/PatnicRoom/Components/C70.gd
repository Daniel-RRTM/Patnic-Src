extends Component
class_name C_70_SELECTED_TARGET


var value: String

func _init(para) -> void:
	self.name = "C_70_SELECTED_TARGET"
	value = para



static func getType_quack():   return "STRING"
static func getAutoDoc():
	return{
		"suggestion"  : "",
		"description" : "name of its fightingstyle",
		"validInputs" : [],
		"validType"   : getType_quack(),
		"nameToShow"  : "role description",
}
