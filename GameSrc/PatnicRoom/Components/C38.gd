extends Component
class_name C_38_KIT_PART_TYPE

var value

func _init(valuePara):
	name = "C_38_KIT_PART_TYPE"
	if valuePara is String: value = ENUM.KITS.PARTS.keys().find(valuePara)
	if valuePara is int: value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "Base: Main definition, Mod: Specialication, Appendix: Side-effect",
	"description" : "place in Kitset",
	"validInputs" : ["BASE","MOD","APPENDIX"],
	"validType"   : getType_quack(),
	"nameToShow"  : "kit Part",
}
static func getType_quack(): return "STRING"
