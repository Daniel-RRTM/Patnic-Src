extends Node

class_name _Enum_FilePaths


var ENUMS_TO_STRING = {
	 "GUI_SUB_SCENES" : GUI_SUB_SCENES
	,"KITS_AT_START"  : KITS_AT_START
	,"SUB_TITLES"     : SUB_TITLES
	,"SAVE_STATE"     : SAVE_STATE
	,"TILE_SETS"      : TILE_SETS
	,"SCENES"          : SCENES
	,"TITLE_BACKGROUND" :TITLE_BACKGROUND
}


const EXPERIMENTAL_TILEMAP = "res://Config/ExperimentalTilemap.json"
const TILE_SETS     = "res://GameData/Tiled/TileSets/JSON"
const SUB_TITLES    = "res://Config/DynamicSubtitles.json"

const SAVE_STATE    = "res://Config/SaveState"
const KITS_AT_START = "res://config/KitsAtStart.json"



const SCENES = {
	 TITLE      = "res://GameSrc/PatnicRoom/scenes/Unique/Titlescreen/Title.tscn"
	,REST       = "res://GameSrc/PatnicRoom/scenes/Gameloop/RestMode/Progression.tscn"
	,PANIC      = "res://GameSrc/PatnicRoom/scenes/Gameloop/PanicMode/PanicMode.tscn"
	,ALECANDRIA = "res://GameSrc/Alecandria/Main.tscn"
}



const GUI_SUB_SCENES   = {
	 EQUIPED_KIT_SET   = "res://GameSrc/Universal/GUI/EquipedKitSet/Scene.tscn"
	,INVENTORY         = "res://GameSrc/Universal/GUI/Inventory/Scene.tscn"
	,KIT_PART_BROWSER  = "res://GameSrc/Universal/GUI/KitPartBrowser/Scene.tscn"
	,KIT_SET_MODDER    = "res://GameSrc/Universal/GUI/KitSetModder/Scene.tscn"
	,KIT_SET_TO_STRING = "res://GameSrc/Universal/GUI/KitSetToString/Scene.tscn"
	,REST_HUD          = "res://GameSrc/Universal/GUI/RestHUD/Scene.tscn"
	,CHEAT_CLI         = "res://GameSrc/PatnicRoom/Scenes/Unique/CheatCLI/Scene.tscn"

	,EVENT_TO_STRING   = {
		 BASE          = "res://GameSrc/Universal/GUI/EventTString/Base/Scene.tscn"
		,MOD           = "res://GameSrc/Universal/GUI/EventTString/Mod/Scene.tscn"
		,APPENDIX      = "res://GameSrc/Universal/GUI/EventToString/Appendix/Scene.tscn"
	}
}
const TITLE_BACKGROUND   = [
	"res://Assets/GUI/Titlescreen/background/backgroundFour.png",
	"res://Assets/GUI/Titlescreen/background/backgroundThree.png",
	"res://Assets/GUI/Titlescreen/background/backgroundTwopng.png",
]


