extends Object
class_name EFFECTS_INDEX


# BOOKMARK[epic=LEC-SYNTAX] Effects for Conditions                             

static func getIndex() -> Dictionary : return {
	  "AFFECTING"    :  _006_EFFECTS_AFFECTING
	 ,"CONSTRAINT"   :  _006_EFFECTS_CONSTRAINT
	 ,"SPREADING"    :  _006_EFFECTS_SPREADING
}



#  SPREADING ---> TYPE EQUALS TILE ---> 50 -> 2
#  SPREADING ---> INDEX EQUALS Suburban_0_1 ---> 50 -> 2
#  
#  MOVING ---> RNG
#  MOVING ---> ALONG
#  MOVING ---> AGAINST
#  
#  TELEPORT ---> BY_DASH  ---> RNG -> 2
#  TELEPORT ---> BY_DASH  ---> INPUT -> 2
#  TELEPORT ---> BY_RNG   ---> COMP  EQUALS C_2_index EQUALS Suburban_0_1
#  TELEPORT ---> BY_RNG   ---> PROP  EQUALS WET AND BURNABLE
#  
#  CONSTRAINT ---> MOVEMENT
#  CONSTRAINT ---> KIT_USE
#  CONSTRAINT ---> ITEM_USE
#  
#  FREECE ---> 2




