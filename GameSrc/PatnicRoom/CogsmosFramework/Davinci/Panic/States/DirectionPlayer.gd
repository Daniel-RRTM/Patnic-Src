extends _DavINCi_FSM_StateParentInterface
class_name _DavINCi_FSM_Panic_DirectionPlayer



var secondValidPlayerEnum
func _init() -> void:
	validPlayerStateEnum  = ENUM.INPUT_PANIC.PLAYER_STATE.STANDING
	secondValidPlayerEnum = ENUM.INPUT_PANIC.PLAYER_STATE.SELECTING
	stateAfterSucces      = ENUM.INPUT_PANIC.PLAYER_STATE.FINISHED
	validInputEnums       =  ENUM.INPUT_PANIC.INPUTS.MOVEMENT.values()
	typeEnum              = 0



func actOnInput_quack(event:InputEvent) -> void:   
	var inputEnum = Davinci.getInputToEnum(event) as int
	SokraTiles.getPlayer().movePlayer(inputEnum)
	SokraTiles.getSelection().clearLayer()
	API_009_Sound.playMovePlayer()



func isGenerallyValid(currentType:int, currentState:int) -> bool:
	if ![validPlayerStateEnum,secondValidPlayerEnum].has(Davinci.playerState) :   return false
	elif validInputEnums.has(currentState)                                    :   return true    
	return false
