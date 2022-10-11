extends Node
class_name _Flags

#>>> CURRENT NUMBER <<<#
#>>> 17             <<<#

static func getFlags() -> Dictionary:
	return {
		
	"F_1_INTERACTABLE_TYPE" 		        :	1,
	"F_2_TILE_TYPE" 					    :   2,
	"F_4_PLAYER_TYPE" 					    :   4,
	"F_5_PLAYER_STEPS" 					    :   5,
	"F_6_PLAYER_COND_CAUSED" 				:   6,
	
	"F_8_IS_WALL"							:   8,
	"F_9_IS_DOOR"						    :   9,

	"F_WANTED_SINLES"						:   1001,
	"F_WANTED_SPIRIT"						:   1002,
	"F_WANTED_PERSONA"						:   1003,
	"F_WANTED_ANIMAL"						:   1004,
	"F_WANTED_CRITTER"						:   1005,
	"F_WANTED_PARA_CRITTER"						:   1006,
	
	"F_12_LOOT_FILTER"                 :  12,
	
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

	"F_18_QUEST" 							:   18,
	"F_19_UNIVERSAL_QUEST" 					:   19,
	"F_20_SPECIFIC_1_MATRIX" 				:   21,
	"F_20_SPECIFIC_2_MEAT" 					:   22,
	"F_20_SPECIFIC_3_MAGIC" 				:   23,
	"F_20_SPECIFIC_QUEST" 				    :   24,
	"F_21_FAVOR_QUEST" 				    :   24,
	
	"F_18_IS_CONDITION"			:  18,
	"F_19_ACTOR_CAN_NOT_MOVE" : 19,
	
	"F_CHEAT_1_NO_CLIP"                      :  101
}

static func getConsumableFlags():
	return {}
