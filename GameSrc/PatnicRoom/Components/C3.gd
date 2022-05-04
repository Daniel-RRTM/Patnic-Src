extends Component
class_name C_3_LAYER

var value: String

func _init(valuePara:String):
	self.name = "C_3_LAYER"
	value = valuePara





static func getType_quack(): return "STRING"



static func getAutoDoc(): return{
	"suggestion"  : "Magics and Matrix are not implemented yet!",
	"description" : "Determinds on which layer the entity is indexed on Map",
	"validInputs" : ENUM.SOKRATILES.LAYER.keys(),
	"validType"   : "STATIC_LIST",
	"nameToShow"  : "Layer",
}