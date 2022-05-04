extends Component
class_name C_21_POS_TO_WALK_TO

var value : Vector2

func _init(valuePara):
	name = "C_21_POS_TO_WALK_TO"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "often the same as C_6, maybe shorter",
	"description" : "often used Reference name",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Name",
}
static func getType_quack(): return "VECTOR2D"
