extends Component
class_name C_74_EVENT_MAIN_DICT


var value: Dictionary

func _init(para) -> void:
	self.name = "C_74_EVENT_MAIN_DICT"
	value = para



static func getType_quack():   return "DICTIONARY"
static func getAutoDoc():
	return{
		"suggestion"  : "",
		"description" : "name of its fightingstyle",
		"validInputs" : [],
		"validType"   : getType_quack(),
		"nameToShow"  : "role description",
}
