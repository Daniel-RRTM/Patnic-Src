extends Component
class_name C_20_SKILLBLOCK

var value = {}


func _init(var valuePara={}):
	name = "C_20_SKILLBLOCK"
	value = createSkillList()

	

func modAllSkills(dict):
	for i in dict.size():
		if value.has(dict.keys()[i]):
			var cache = dict.keys()[i]
			var valueCache = dict[cache]
			value[cache] = valueCache
		

func setSkillblock(dict):
	value = dict


static func createSkillList():
	var allSkillsList = {}
	
	for i in ENUM.PLAYER.SKILL.size():
		allSkillsList[ENUM.PLAYER.SKILL.keys()[i]] = 0
	
	return allSkillsList



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "List of all skills and their values",
	"validInputs" : [],
	"validType"   : ENUM.PLAYER.SKILL,
	"nameToShow"  : "Skillblock",
	"configKey"   : "skills"
}
static func getType_quack(): return "DICTIONARY"
