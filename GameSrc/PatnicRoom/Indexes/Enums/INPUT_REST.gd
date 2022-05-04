extends Node
class_name _Enum_Input_Rest


var ENUMS_TO_STRING = {
	 "SCREEN_TYPE" : SCREEN_TYPE
	,"INPUT_MODE"  : INPUT_MODE
	,"STATION"     : STATION
	,"SPECIAL"     : SPECIAL
	,"SCREENS"     : SCREENS
	,"SELF"        : SELF
	,"BACKGROUND_FILEPATH" : BACKGROUND_FILEPATH
}



enum SELF    {  INVENTORY = 1  , CHAR     = 2 , ROOTNET = 3  }
enum STATION {  WORKSHOP  = 4  , TERMINAL = 5 , RETREAT = 6  }
enum SPECIAL {  PANIC     = 7                                }

var SCREENS = {
	 "STATION"    : STATION
	,"SELF"       : SELF
	,"SPECIAL"    : SPECIAL
}



enum INPUT_MODE {  MOUSE , KEY  }
enum SCREEN_TYPE {  STATION , SELF , SPECIAL  }


var BACKGROUND_FILEPATH = [
	"res://Assets/GUI/restmode/background/one.png",
	"res://Assets/GUI/restmode/background/two.png",
	"res://Assets/GUI/restmode/background/three.png",
	"res://Assets/GUI/restmode/background/four.png",
	"res://Assets/GUI/restmode/background/five.png",
	]




