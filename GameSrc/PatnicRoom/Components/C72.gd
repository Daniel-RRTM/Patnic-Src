extends Component
class_name C_72_LEC_META_USE


var value: String

func _init(para) -> void:
	self.name = "C_72_LEC_META_USE"
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
