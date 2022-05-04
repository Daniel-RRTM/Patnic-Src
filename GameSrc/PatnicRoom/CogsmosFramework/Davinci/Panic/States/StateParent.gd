extends Node
class_name _DavINCi_FSM_StateParentInterface


var validPlayerStateEnum : int
var validInputEnums : Array
var typeEnum : int
var stateAfterSucces : int



func isSpecificallyValid_quack(currentType:int,currentState:int) -> bool:   return true
func actOnInput_quack(currentInput:InputEvent)                   -> void:   printerr("ERROR!! action on ["+str(validInputEnums)+"is not defined")
func setNewState_quack()                                         -> void:   Davinci.playerState = stateAfterSucces



func isGenerallyValid(currentType:int, currentState:int) -> bool:
	if   typeEnum != currentType                     :   return false
	elif validPlayerStateEnum != Davinci.playerState :   return false
	elif validInputEnums.has(currentState)           :   return true    
	return false






