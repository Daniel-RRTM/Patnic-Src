extends Component
class_name C_58_ALTERNATIVE_TEXTURES


var value


func _init(valuePara:String):
	name="C_58_ALTERNATIVE_TEXTURES"
	value=valuePara


	
########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "Can be swapped by change statmode",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Alternative Textures",
}
static func getType_quack(): return "STRING"
