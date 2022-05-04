extends Node
class_name _Enum_Kits


var ENUMS_TO_STRING = {
	 "PEACES_TILL_NEW_SLOT" : PEACES_TILL_NEW_SLOT
	,"STATION_MODE"         : STATION_MODE
	,"CATEGORIES"           : CATEGORIES
	,"CAT_MATRIX"           : CAT_MATRIX
	,"CAT_MAGIC"            : CAT_MAGIC
	,"CAT_MEAT"             : CAT_MEAT
	,"CATEGORY"             : CATEGORY
	,"PARTS"                : PARTS
}



const PEACES_TILL_NEW_SLOT = 4

enum STATION_MODE {  ADD , REMOVE , CHANGE  }
enum PARTS {  BASE , MOD , APPENDIX  }



var CATEGORIES= {   0:CAT_MEAT , 1:CAT_MAGIC , 2:CAT_MATRIX   }

enum CAT_MATRIX {  HACK , DRONE , CYBERWARE  }
enum CAT_MAGIC  {  RITE , SPELL , INFUSION   }
enum CAT_MEAT   {  GUN  , MEELE , ARMOR      }

enum CATEGORY { HACK  , DRONE , CYBERWARE	# MATRIX
				RITE  , SPELL , INFUSION	# MAGIC
				GUN   , MEELE , ARMOR	 }	# MEAT


