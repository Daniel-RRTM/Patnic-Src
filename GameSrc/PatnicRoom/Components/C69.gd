extends Component
class_name C_69_KITSET_FAMILY


var value: String

func _init(para) -> void:
	self.name = "C_69_KITSET_FAMILY"
	value = para



static func getType_quack():   return "STRING"
static func getAutoDoc():
	return{
		"suggestion"  : "",
		"description" : "Index of the BaseKitPart",
		"validInputs" : [],
		"validType"   : getType_quack(),
		"nameToShow"  : "KitSetFamily",
}
