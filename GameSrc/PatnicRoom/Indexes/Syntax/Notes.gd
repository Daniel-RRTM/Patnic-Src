extends Node



var ENTRIES = {
	"LOOT"          : {   "CONSUMABLE"   : [   "LOOT_TYPE" , "CHANCE" , LOOT_AMMOUNT   ,   "LISTINGS"     ],  
						   "CREDITS"     : [   "LOOT_TYPE" , "CHANCE" , LOOT_AMMOUNT                      ],
						   "KIT_PART"    : [   "LOOT_TYPE" , "CHANCE" , LOOT_AMMOUNT                      ]   },


	"EVENT"         : {   "CONSTRUCTOR"  : [   [] , EVENT_CHECK , EVENT_LOG   ],  
						  "CHECK"        : EVENT_CHECK,
						  "LOG"          : [   "LOG_SUCCES" , "LOG_FAILURE"                            ]   },
	
	
	"EFFECT_REF_NR" : []
}  




var LOOT_AMMOUNT = {"AMMOUNT" : [   "HARD_WIRED" , "SIMPLE_RANDOM" , "COMPLEX_RANDOM"   ]}

var EVENT_CHECK  = {"CHECK"   : [   ENUM.PLAYER.SKILL , "THRASH_HOLD"  ]}
var EVENT_LOG    = {"LOG"     : [   "LOG_SUCCES" , "LOG_FAILURE"  ]}






var MODULE_CHECK   = [ ENUM.PLAYER.SKILL                , "THRASH_HOLD"          , "LOG_SUCCES"     , "LOG_FAILURE" ]
var MODULE_AMOUNT  = [ "HARD_WIRED"              , "SIMPLE_RANDOM"        , "COMPLEX_RANDOM"                 ]































var ENTRIES = {

	"MANDATORY" : {    "SPECIALTY"   : [   "INDEX" , "FOCUSED_M_TYPE"            ,    "SOCIAL_HIRACHY" , "BEHAVIOUR" , "TIER"   ],  
					   "ROLE"        : [   "INDEX" , "FOCUSED_M_TYPE"            ,    "PREFERD_CHUNK"                           ],
					   "RACE"        : [   "INDEX" , "FOCUSED_M_TYPE"                                                           ]   },


	"OPTIONAL"  : {    "KITSETS"     : [   "INDEX" , "FOCUSED_M_TYPE" , "CAT"    ,    "STAT_MOD"   , "CONDITION" , "PART"       ],  
					   "ITEMS"       : [   "INDEX" , "FOCUSED_M_TYPE" , "CAT"    ,    "RESSOURCES" , "CREDITS"                  ],
					   "LOOT_TABLES" : [   "INDEX" ,                                                                            ],  
					   "TRAITS"      : [   "INDEX" ,                                                                            ]   }
}  







static func getSyntax():
	return {
	  "INDEX": [
		 "ROLE"
		,"SPECIALTY"
		,"RACE"
		,"KITSET"
		,"ITEM"
		,"LOOT_TABLE"
	  ],
	
	  
	  "ATLAS":{
		"ROLE"       : [ "FOCUSED_M_TYPE", "PREFERD_CHUNK_KEYWORD", "INDEX"                    ],
		"SPECIALTY"  : [ "SOCIAL_HIRACHY", "BEHAVIOUR", "TIER", "FOCUSED_M_TYPE", "INDEX"      ],
		"RACE"       : [ "INDEX", "PREFERD_CHUNK_KEYWORD"                                      ],
		"KITSET"     : [ "STATMOD" , "FOCUSED_M_TYPE" , "CAT" , "PART" , "CONDITION" , "INDEX" ],
		"ITEM"       : [ "CREDITS" , "INDEX" , "CAT" , "RESSOURCES"                            ],
		"LOOT_TABLE" : [ "INDEX"                                                               ]   
		}
	}





























var _masterIndex = {}

var _concepts = {
	 "CONSIDER"  : consider
	,"TARGET"    : {}
	,"PERFORM"   : perform
	,"WEIGHT"    : {}
	,"SEIZE"     : {}
	
}







var consider = {
	 "SELF"    : considerSELF 
	,"SELECT"  : considerSELECT
	,"REGION"  : considerREGION
	,"SECTION" : considerSECTION
	,"GLOBAL"  : considerGLOBAL
}


var considerGLOBAL = {}
var considerSELF = {
	 "Name"          :      "SELF"
	,"Concept"       :      "CONSIDER"
	,"Description"   :      "makes an condition in reference to the user"
	,"requirements"  :      "None"
	,"followup"      :  {   "PERFORM" : "like a Condition or Statmod to Buff or to simply improve _005_Character_Stats or Health"   }
	,"Parameter"     :       entityAttribute
}
var considerSELECT = {
	 "Name"          :      "SELECTS"
	,"Concept"       :      "CONSIDER"
	,"Description"   :      "gives back the entities collected in C_53_SELECTED_POSITIONS"
	,"requirements"  :      "content must be collected by SEIZE and CACHE"
	,"followup"      :  {   "PERFORM" : "like a Condition or Statmod to damage Actors or manipulate Doors to open"   }
	,"Parameter"     :       entityAttribute
}
var considerREGION = {
	 "Name"          :      "REGION"
	,"Concept"       :      "CONSIDER"
	,"Description"   :      "gives back the entities collected by a SEIZE and CACHE of current scope"
	,"requirements"  :      "content must be collected by SEIZE and CACHE"
	,"followup"      :  {   "PERFORM" : "like a Condition or Statmod to damage Actors or manipulate Doors to open"   }
	,"Parameter"     :       entityAttribute
}
var considerSECTION = {
	 "Name"          :      "SECTION"
	,"Concept"       :      "CONSIDER"
	,"Description"   :      "gives back the entities collected by a SEIZE and CACHE. is not the sum of REGIONS entities but its own list"
	,"requirements"  :      "content must be collected by SEIZE and CACHE"
	,"followup"      :  {   "PERFORM" : "like a Condition or Statmod to damage Actors or manipulate Doors to open"   }
	,"Parameter"     :       entityAttribute
}
var entityAttribute = {
	 "FLAG"   :  {  "MANDATORY : INDEX of _flags.gd"           :  "checks if SELECTS has following in _flags"                                        }
	,"PROP"  :  {  "MANDATORY : INDEX of _props.gd"           :  "checks if SELECTS has following in _arrOfProps"                                         }
	
	,"COMP"  :  [
				{  "MANDATORY : INDEX of _comps.gd"           :  "CHECKS IF SELECTS HAS COMPONENT"                                                        },
				{  "OPTIONAL  : OPERATOR and value"           :  "COMPARES COMPONENT of SELECTS with LESS/BIGGER/NOT/EQUALS values"                       }
				]
	
	,"COND"  :  [
				{  "MANDATORY : INDEX of _conds.gd"           :  "CHECKS IF SELECTS HAS CONDITION"                                                        },
				{  "OPTIONAL  : OPERATOR and LEVEL/DURATION"  :  "COMPARES LEVEL or DURATION of CONDITION in SELECTS with LESS/BIGGER/NOT/EQUALS values"  }
				]
}





var perform = {
	 "CACHE"                : performCACHE 
	,"PERMANENT_CHANGE"     : performPERMANENT_CHANGE
	,"TEMPORARY_CONDITION"  : performTEMPORARY_CONDITION
	,"COMPONENT"            : performCOMPONENT
	,"FLAG"                 : performFLAG
	,"PROPERTY"             : performPROPERTY
}


var performCACHE = {
	 "Name"          :      "CACHE"
	,"Concept"       :      "PERFORM"
	,"Description"   :      "manages stored entities "
	,"requirements"  :  {   "CONSIDER" : "CONSIDER to reduce the SELECTed entities to your intention"   }
	,"followup"      :      "None"
	,"Parameter"     :  [
		{   "INDEX"            :  "selectes the wanted change"              },
		{   "LEVEL*value*"     :  "not every time needed"   },
		{   "DURATIOM*value*"  :  "not every time needed"                  }
	]
}
var performPERMANENT_CHANGE = {
	 "Name"          :      "PERMANENT_CHANGE"
	,"Concept"       :      "PERFORM"
	,"Description"   :      "unique modification of COMPONENTs"
	,"requirements"  :  {   "CONSIDER" : "CONSIDER to reduce the SELECTed entities to your intention"   }
	,"followup"      :      "None"
	,"Parameter"     :  [
		{   "INDEX"  :  "selectes the wanted change"              },
		{   "N/A"    :  "dependent on current PERMANENT_CHANGE"   },
	]
}
var performTEMPORARY_CONDITION = {
	 "Name"          :      "TEMPORARY_CONDITION"
	,"Concept"       :      "PERFORM"
	,"Description"   :      "repeading events on the affected entity,often autonomus"
	,"requirements"  :  {   "CONSIDER" : "CONSIDER to reduce the SELECTed entities to your intention"   }
	,"followup"      :      "None"
	,"Parameter"     :  [
		{   "CLEAR"                   :  "empties the list from all entities"              },
		{   "SET *source*->*target*"  :  "empties the target and fills them with source"   },
		{   "ADD *source*->*target"   :  "appends the target with source"                  }
	]
}
var performCOMPONENT = {
	 "Name"          :      "COMPONENT"
	,"Concept"       :      "PERFORM"
	,"Description"   :      "REMOVEs/ADDs/MODs the values of COMPONENT"
	,"requirements"  :  {   "CONSIDER" : "CONSIDER to reduce the SELECTed entities to your intention"   }
	,"followup"      :      "None"
	,"Parameter"     :  [
		{   "ADD--->*value*"     :  "ADDs COMPONENT with VALUE"   },
		{   "MOD--->*value*"     :  "MODs value of COMPONENT"     },
		{   "REMOVE"            :  "REMOVEs COMPONENT"           },
	]
}
var performFLAG = {
	 "Name"          :      "FLAG"
	,"Concept"       :      "PERFORM"
	,"Description"   :      "REMOVES/ADDS the FLAG"
	,"requirements"  :  {   "CONSIDER" : "CONSIDER to reduce the SELECTed entities to your intention"   }
	,"followup"      :      "None"
	,"Parameter"     :  [
		{   "ADD"     :  "ADDs FLAG if not there"   },
		{   "REMOVE"  :  "REMOVEs FLAG if there"    },
	]
}
var performPROPERTY = {
	 "Name"          :      "PROPERTY"
	,"Concept"       :      "PERFORM"
	,"Description"   :      "REMOVES/ADDS the PROPERTY"
	,"requirements"  :  {   "CONSIDER" : "CONSIDER to reduce the SELECTed entities to your intention"   }
	,"followup"      :      "None"
	,"Parameter"     :  [
		{   "ADD"     :  "ADDs PROPERTY if not there"   },
		{   "REMOVE"  :  "REMOVEs PROPERTY if there"    },
	]
}
