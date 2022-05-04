extends Node
# BOOKMARK[epic=LEC-SYNTAX] EVENT                                    
class_name EVENT_SYNTAX



static func MATH_OPERATOR() 	-> Dictionary 	: return {	"DECREMENT" 	: 1		, 
															"INCREMENT" 	: 2 	,
															"NEGATE" 		: 3 	,
															"EQUALLS"   	: 4		,
															"NEUTRALICE" 	: 5     ,  # Value = 0
															"BISECT"	 	: 6     }  # Value / 2



static func LIST_PERFORMANCE() 	-> Dictionary 	: return {	"ADD"       	: 1		, 
															"REMOVE"    	: 2 	,
															"SWAP"      	: 3		}



static func SYNONYMS() 			-> Dictionary 	: return {	"EQUALLS"   	: [ "IS","SET" ] , 
															"XXX"       	: "XXX"	}


static func FILLER() 			-> Dictionary 	: return {	"BY"			: 1		, 
															"OF" 			: 2		,
															"THIS"			: 3		}


static func CONNECTOR() 		-> Dictionary 	: return {	"OR"			: 1		}





static func ALL_CONCEPTS() -> Dictionary : return {
	 "SOURCE"   : SOURCE() 
	,"MEDIUM"   : MEDIUM()
	,"PERFORM"  : PERFORM()
	,"CONSIDER" : CONSIDER()
} 



static func SOURCE() -> Dictionary: return {		"SELF"     : _004_Seize_SourceSelf     }


static func MEDIUM() -> Dictionary: return {		"LINEA"    : _004_Seize_MediumLinea    , 
													"SELECT"   : _004_Seize_MediumSelect   , 
													"SELF"     : _004_Seize_SourceSelf     ,
													"AREA"     : _004_Seize_MediumArea     }


static func PERFORM() -> Dictionary: return {		"COMP"     : _004_Consider_Component.new()   ,
													"FLAG"     : _004_Consider_Flag.new()        ,
													"PROP"     : _004_Consider_Property.new()    ,
													"UNIQ"     : _004_Consider_Property.new()    ,
													"COND"     : _004_Consider_Condition.new()   }


static func CONSIDER() -> Dictionary: return {		"COMP"     : _004_Consider_Component.new()   , 
													"TYPE"     : _004_Consider_Type.new()        , 
													"FLAG"     : _004_Consider_Flag.new()        ,
													"PROP"     : _004_Consider_Property.new()    ,
													"COND"     : _004_Consider_Condition.new()   }



