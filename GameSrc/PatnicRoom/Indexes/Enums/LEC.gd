extends Node
# REFACTOR redundant? 
class_name _Enum_LEC


var ENUMS_TO_STRING = {
	 "EXCEPTIONAL_PARSER" : EXCEPTIONAL_PARSER
	,"STRUCTURE_BY_TYPE"  : STRUCTURE_BY_TYPE
	,"TYPES_METADATA"     : TYPES_METADATA
	,"VALUE_DEPTH"        : VALUE_DEPTH
	,"COMPARE"            : COMPARE
}



enum VALUE_DEPTH{   UPPER = 0 , MIDDLE = 1 , LOWER = 2 , CONNECTOR = 3 , CONDITION = 4 , VALUE = 5   }
enum EXCEPTIONAL_PARSER{   DEFAULT , AND , FLAG , HAS_COMP , COMPARE_COMP , PERMANENT_CHANGE  }

var COMPARE = [   "LESS" , "BIGGER" , "NOT" , "EQUALS"   ]

var SPACING = [10,15,20,2,2]


var TYPES_METADATA = {
	 "KITPART_BASE"    :  {   "CLASS" : KitPartEntity     , "MANDATORY"  : ENUM.MINIMAL_COMP.KITPART_BASE   }
	,"KITPART_MOD"     :  {   "CLASS" : KitPartEntity     , "MANDATORY"  : ENUM.MINIMAL_COMP.KITPART_MOD    }
	
	,"ACTOR_ROLE"      :  {   "CLASS" : Entity            , "MANDATORY"  : ENUM.MINIMAL_COMP.ROLE           }
	,"ACTOR_RACE"      :  {   "CLASS" : Entity            , "MANDATORY"  : ENUM.MINIMAL_COMP.RACE           }
	,"ACTOR_SPECIALTY" :  {   "CLASS" : Entity            , "MANDATORY"  : ENUM.MINIMAL_COMP.SPECIALTY      }
}






var STRUCTURE_BY_TYPE = [
	 { "NAME"    : "PAIRING" 
	 , "PARSER"  : Alecandria_LecToEnt_Pairing
	 , "CONTENT" : [ "ACTOR_RACE","ACTOR_SPECIALTY" , "ACTOR_ROLE" , "ACTOR_SPECIALTY" , "KITPART_BASE" , "KITPART_MOD" ] }
	
	,{ "NAME"    : "ACTOR_RNG_TABLE" 
	 , "PARSER"  : Alecandria_LecToEnt_ActorSpawning
	 , "CONTENT" : [ "ACTOR_RNG_TABLE" ] }
	
	,{ "NAME"    : "CONDITION" 
	 , "PARSER"  : Alecandria_LecToEnt_Condition
	 , "CONTENT" : [ "CONDITION" ] }

	,{ "NAME"    : "EVENT" 
	 , "PARSER"  : Alecandria_LecToEnt_Event
	 , "CONTENT" : [ "EVENT" ] }
]



var TYPES = {
	"CONSUMABLES":"CONSUMABLES",
	 ACTOR_SPECIALTY = "ACTOR_SPECIALTY"
	,ACTOR_ROLE      = "ACTOR_ROLE"
	,ACTOR_RACE      = "ACTOR_RACE"

	,ACTOR_RNG_TABLE = "ACTOR_RNG_TABLE"

	,KITPART_BASE    = "KITPART_BASE"
	,KITPART_MOD     = "KITPART_MOD"


	,EVENT           = "EVENT"
	,CONDITION       = "CONDITION"
	}
