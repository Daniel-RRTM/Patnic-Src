extends Node
class_name _TextToolBox_Enum



enum INTRODUCTIONS{ VOID         = -1 ,
					FIRST        =  0 ,
					SECOND       =  1 ,
					THIRD        =  2 ,
					FOURTH       =  3 ,
					FIVTH        =  4 ,
					SIXTH        =  5 }



enum SCENES{        INTRODUCTION = 11 ,
					SELECTION    = 12 ,
					FORMS        = 13 ,
					OPTIONS      = 14 ,
					MAIN_MENUE   = 15 ,
					OPTION       = 16 }



enum FORMS{         VOID         = 20 ,
					RACE         = 21 ,
					ROLE         = 22 ,
					SPECIALTY    = 23 ,
					BASE         = 24 ,
					MOD          = 25 ,
					APPENDIX     = 26 ,
					CONSUMABLE   = 27 ,
					EVENT        = 28 }



enum MODES{         WRITE_PAIR   = 31 ,
					READ         = 32 ,
					SELECT       = 33 ,
					WRITE_EVENT  = 34 }



enum FILTERS{       RESET        = 41 ,
					DEFAULT      = 42 ,
					CURRENT_FORM = 43 ,
					VALUE        = 44 ,
					VOID         = 45 }








func _init(root) -> void:
	root.CURRENT_FILTER = FILTERS.RESET
	root.CURRENT_SCENE  = SCENES.MAIN_MENUE
	root.CURRENT_INTRO  = INTRODUCTIONS.VOID
	root.CURRENT_FORM   = FORMS.VOID
	root.CURRENT_MODE   = MODES.SELECT
	










