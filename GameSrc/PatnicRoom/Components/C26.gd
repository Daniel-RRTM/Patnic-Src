extends Component
class_name C_26_INDIRECT_STATS

var attributesBlock

var hitpoints
var condition

var carriageCapacity

var physicalLimit
var socialLimit
var mentalLimit


func _init(dict,entToFill):
	name = "C_26_INDIRECT__005_Character_Stats"
	if dict is C_19_ATTRIBUTES:
		update_005_Character_Stats(dict,entToFill)


func update_005_Character_Stats(dict,entToFill):
	attributesBlock   = dict
	hitpoints         = 8+(attributesBlock.constitution.value/3)
	entToFill.addComponent( C_57_HITPOINTS.new(hitpoints) )
	
	carriageCapacity = attributesBlock.strength.value + (attributesBlock.constitution.value  * 2)
	entToFill.addComponent( C_23_CARRIAGE.new(carriageCapacity) )
	
	physicalLimit    = (attributesBlock.constitution.value  +attributesBlock.reaction.value   +(attributesBlock.strength.value  * 2))  / 3
	socialLimit      = (attributesBlock.constitution.value  +attributesBlock.intuition.value  +(attributesBlock.charisma.value  * 2))  / 3
	mentalLimit      = (attributesBlock.willpower.value     +attributesBlock.intuition.value  +(attributesBlock.logic.value     * 2))  / 3
	entToFill.addComponent( C_22_LIMITS.new(physicalLimit, socialLimit, mentalLimit) )


########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Indirect _005_Character_Stats",
}
static func getType_quack(): return "DICTIONARY"
