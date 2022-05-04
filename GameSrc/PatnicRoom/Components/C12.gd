extends Component
class_name C_12_ATLAS_INDEX

var value

var cached_C_69_KITSET_FAMILY 

func _init(valuePara):
	name="C_12_ATLAS_INDEX"
	value=valuePara
	
	if "__" in valuePara:cached_C_69_KITSET_FAMILY= valuePara.split("__")[0]
	else:cached_C_69_KITSET_FAMILY = str(valuePara)
	


#FUNC Family-Ccomponent = C_69_KITSET_FAMILY
func buildFamiliyComponent():
	if !owner.hasComp("C_69_KITSET_FAMILY"):
		owner.addComponent(C_69_KITSET_FAMILY.new(cached_C_69_KITSET_FAMILY))




static func getAutoDoc(): return{
	"crossreference" : ["C_69_KITSET_FAMILY"],
	"suggestion"  : "",
	"description" : "determinds the mousehover text",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "role description",
	"configKey"   : "texture"
}

static func getType_quack():
	return "STRING"
