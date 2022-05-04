extends Node
class_name _Flags

#>>> CURRENT NUMBER <<<#
#>>> 17             <<<#

static func getFlags() -> Dictionary:
	return {
		
	"F_1_INTERACTABLE_TYPE" 		        :	1,
	"F_2_TILE_TYPE" 					    :   2,
	"F_4_PLAYER_TYPE" 					    :   4,
	
	"F_8_IS_WALL"							:   8,
	"F_9_IS_DOOR"						    :   9,
	
	"F_12_LOOT_SOURCE_TYPE"                 :  12,
	
	"F_13_ITEM_CONSUMABLE"					:  13,
	"F_3_ITEM" 					            :   3,
	
	"F_6_ACTOR_ATTRIBUTES"				    :   6,
	"F_7_ACTOR_ATTRIBUTES_SPECIALTY"	    :   7,
	"F_10_ACTOR_ATTRIBUTES_ROLES"           :  10,
	"F_11_ACTOR_ATTRIBUTES_RACE"            :  11,
	"F_14_NPC_TEMPLATE"					    :  14,
	
	"F_5_KITPART_TYPE"					    :   5,
	"F_15_KITPART_TYPE_BASE"				:  15,
	"F_16_KITPART_TYPE_MOD"				    :  16,
	"F_17_KITPART_TYPE_APPENDIX"			:  17,
	
	"F_18_IS_CONDITION"			:  18,
	"F_19_ACTOR_CAN_NOT_MOVE" : 19,
	
	"F_CHEAT_1_NO_CLIP"                      :  101
}

static func getConsumableFlags():
	return {}
