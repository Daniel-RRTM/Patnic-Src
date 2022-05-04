extends Component
class_name C_71_LEC_META_BY


var value: String

func _init(para) -> void:
	self.name = "C_71_LEC_META_BY"
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
