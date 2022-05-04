extends Node
# BOOKMARK[epic=Cogsmos] DavInCi --- Rest                                      
class_name _DavINCi_FSM_Rest


# ----- INITIALICE ----------------------------------------------------------- ##


var selfScenesToLoadByKey = [
	"res://GameSrc/PatnicRoom/scenes/Gameloop/RestMode/Self/Inventory/Inventar.tscn",
	"res://GameSrc/PatnicRoom/scenes/Gameloop/RestMode/Self/Charsheet/Charsheet.tscn",
	"res://GameSrc/PatnicRoom/scenes/Gameloop/RestMode/Self/Rootnet/Rootnet.tscn",
]

var stationToLoad = "res://GameSrc/PatnicRoom/scenes/Gameloop/RestMode/Station/Station.tscn"


var lastWrittenOut = ENUM.INPUT_REST.STATION.WORKSHOP
var FSM_Station    : _DavINCi_FSM_Station

func _init():
	Davinci.playerState    = ENUM.INPUT_PANIC.PLAYER_STATE.STANDING
	Davinci.interfaceState = ENUM.INPUT_PANIC.INPUT_MODE.VOID
	
	
	FSM_Station            = _DavINCi_FSM_Station.new()



# ----- HUB ------------------------------------------------------------------ ##

var stringToLoad
var inputType
var inputEnum

func manageInput(event) -> void:
	if isValidInput(event):
		
		if event is InputEventKey: 
			inputEnum       = getInputKeyToInt(event)
			inputType       = _Davinci_getter.getInputTypeByEnum(inputEnum)
			stringToLoad    = ""
			
			getEnumType(inputEnum)
			changeSzeneByInputEnum(inputEnum,inputType)


func getInputKeyToInt(event): return int(event.as_text())


# ----- VALIDATOR ------------------------------------------------------------ ##


func changeSzeneByInputEnum(inputEnum,inputType):
	var sceneToLoad = ""
	
	if isInputSelfType(inputEnum): 
		sceneToLoad = selfScenesToLoadByKey[ inputEnum-1 ]
	
	
	elif isInputStationType(inputEnum):
		sceneToLoad                 = stationToLoad
		Davinci.externalCachedInput = inputEnum -4
		cacheStation(inputEnum)
	
	Gameloop.scene.changeSwitchPanel(sceneToLoad)



func isValidInput(event):           return API_003_Player.getInputMode() and not event.is_echo() and event.is_action_type() and event.is_pressed()
func isInputSelfType(inputEnum):    return inputEnum > -1 and inputEnum < 4
func isInputStationType(inputEnum): return inputEnum > 3 and inputEnum < 7



func getEnumType(inputEnum):
	if   ENUM.INPUT_REST.SCREEN_TYPE.STATION == inputEnum : inputType =  ENUM.INPUT_REST.SCREEN_TYPE.STATION
	elif ENUM.INPUT_REST.SCREEN_TYPE.SELF == inputEnum    : inputType =  ENUM.INPUT_REST.SCREEN_TYPE.SELF
	elif ENUM.INPUT_REST.SCREEN_TYPE.SPECIAL == inputEnum : inputType =  ENUM.INPUT_REST.SCREEN_TYPE.SPECIAL

func cacheStation(inputEnum):
	if   ENUM.INPUT_REST.STATION.RETREAT  == inputEnum : Davinci.cachedInput = ENUM.SOKRATILES.M_TYPE.MAGIC
	elif ENUM.INPUT_REST.STATION.WORKSHOP == inputEnum : Davinci.cachedInput = ENUM.SOKRATILES.M_TYPE.MEAT
	elif ENUM.INPUT_REST.STATION.TERMINAL == inputEnum : Davinci.cachedInput = ENUM.SOKRATILES.M_TYPE.MATRIX








