extends Component
class_name _005_Character_Stats


# ----- INITIALICE ----------------------------------------------------------- ##


var attributesInstance
var indirectInstance

func initialice(playerEntityPara):
	attributesInstance   = Attributes.new(playerEntityPara.getCompValue("C_19_ATTRIBUTES"))
	indirectInstance     = Indirect.new(playerEntityPara)



# ----- GETTER --------------------------------------------------------------- ##


func attributes() -> Attributes : return attributesInstance
func indirects()   -> Indirect   : return indirectInstance



# ----- ATTRIBUTES ----------------------------------------------------------- ##


class Attributes:
	var cachedActorAttributes
	func _init(cachePara) -> void: cachedActorAttributes = cachePara
	
	
	func logic() 			-> int:				return cachedActorAttributes.logic
	func agillity() 		-> int:				return cachedActorAttributes.agillity
	func reaction() 		-> int:				return cachedActorAttributes.reaction
	func constitution() 	-> int:				return cachedActorAttributes.constitution
	
	func strength() 		-> int:				return cachedActorAttributes.strength
	func intuition() 		-> int:				return cachedActorAttributes.intuition
	func charisma() 		-> int:				return cachedActorAttributes.charisma
	func willpower()  		-> int:				return cachedActorAttributes.willpower



# ----- SKILLS --------------------------------------------------------------- ##


class Skills:
	var cachedActorSkills
	func _init(cachePara) -> void: cachedActorSkills = cachePara
	
	
	func crafting() 			-> int: 		return cachedActorSkills[ENUM.SKILL.CRAFTING]
	func phylosophizing() 		-> int: 		return cachedActorSkills[ENUM.SKILL.PHYLOSOPHIZING]
	func conceptualizing() 		-> int: 		return cachedActorSkills[ENUM.SKILL.CONCEPTUALICING]

	func percecving() 			-> int: 		return cachedActorSkills[ENUM.SKILL.PERCEVING]
	func assensing() 			-> int: 		return cachedActorSkills[ENUM.SKILL.ASSENSING]
	func debugging() 			-> int: 		return cachedActorSkills[ENUM.SKILL.DEBUGGING]

	func enduring() 			-> int: 		return cachedActorSkills[ENUM.SKILL.ENDURIN]
	func coping() 				-> int: 		return cachedActorSkills[ENUM.SKILL.COPING]
	func filtering()		 	-> int: 		return cachedActorSkills[ENUM.SKILL.FILTERING]

	func sneaking() 			-> int: 		return cachedActorSkills[ENUM.SKILL.SNEAKING]
	func repressing() 			-> int: 		return cachedActorSkills[ENUM.SKILL.REPRESSING]
	func silencing() 			-> int: 		return cachedActorSkills[ENUM.SKILL.SILENCING]



# ----- INDIRECT ------------------------------------------------------------- ##


class Indirect:
	var playerEntity
	func _init(cachePara) -> void:  playerEntity = cachePara
	
	func maxKitSlots()      -> int:             return playerEntity.getCompValue("C_25_MAX_KITSETS")
	func hitpoints() 		-> int:				return playerEntity.getCompValue("C_57_HITPOINTS")
	func carriageCapacity() -> int:				return playerEntity.getComp("C_26_INDIRECT__005_Character_Stats").carriageCapacity
	func mentalLimit() 		-> int:				return playerEntity.getComp("C_26_INDIRECT__005_Character_Stats").mentalLimit
	func physicalLimit() 	-> int:				return playerEntity.getComp("C_26_INDIRECT__005_Character_Stats").physicalLimit
	func socialLimit() 		-> int:				return playerEntity.getComp("C_26_INDIRECT__005_Character_Stats").socialLimit


