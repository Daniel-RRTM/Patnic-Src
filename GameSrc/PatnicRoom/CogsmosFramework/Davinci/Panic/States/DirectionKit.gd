extends _DavINCi_FSM_StateParentInterface
class_name _DavINCi_FSM_Panic_DirectionKit



func _init() -> void:
	validInputEnums      = ENUM.INPUT_PANIC.INPUTS.MOVEMENT.values()
	typeEnum             = 0
	validPlayerStateEnum = ENUM.INPUT_PANIC.PLAYER_STATE.NEEDING_DIRECTION
	stateAfterSucces     = ENUM.INPUT_PANIC.PLAYER_STATE.SELECTING



func isSpecificallyValid_quack(currentType:int,currentState:int) -> bool:   
	if ENUM.INPUT_PANIC.PLAYER_STATE.NEEDING_DIRECTION == Davinci.playerState : return true
	return false



func actOnInput_quack(currentInput:InputEvent) -> void:  
	var inputEnum = Davinci.getInputToEnum(currentInput) as int
	if API_004_KitSet.selection is Dictionary:
		API_004_KitSet.redirectSelection(inputEnum)
		API_004_KitSet.drawAlert()
		API_009_Sound.playMovePlayer()
		Davinci.playerState = ENUM.INPUT_PANIC.PLAYER_STATE.SELECTING

