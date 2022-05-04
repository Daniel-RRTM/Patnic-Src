extends Node


var FSM_Hub

var interfaceState   : int 
var playerState      : int 
 


func initialicePanicScene(scene) -> void:
	if is_instance_valid(FSM_Hub): FSM_Hub.free() 
	FSM_Hub = _DavINCi_FSM_PanicAlt.new()

func initialiceRestScene(scene) -> void:
	if is_instance_valid(FSM_Hub): FSM_Hub.free() 
	FSM_Hub = _DavINCi_FSM_Rest.new()




var cachedInput
var externalCachedInput

func manageInput(event:InputEvent): 
	cachedInput = event 
	FSM_Hub.manageInput(event)

func changeInfoPanel(event:InputEvent, previousState:int): 
	_Davinci_InfoPanel.changeInfoPanel( Davinci.getInputAsEnum(event), previousState)



func getTypeToEnum(event:InputEvent)                  -> int:        return _Davinci_getter.getInputTypeOfEnum(event)

func getInputToEnum(event:InputEvent)                 -> int:        return _Davinci_getter.getInputAsEnum(event)
func getInputToString(event:InputEvent)               -> String:     return _Davinci_getter.getInputAsString(event)

func isInputEnum(searchedEnum:int, event:InputEvent)  -> bool:       return _Davinci_getter.getInputAsEnum(event) == searchedEnum
func isInputCategory(category:int, event:InputEvent)  -> bool:       return getTypeToEnum(event) == category









