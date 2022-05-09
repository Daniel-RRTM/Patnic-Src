extends _DavINCi_FSM_StateParentInterface
class_name _DavINCi_FSM_Panic_KitRun



func _init() -> void:
	validPlayerStateEnum  = ENUM.INPUT_PANIC.PLAYER_STATE.SELECTING
	stateAfterSucces      = ENUM.INPUT_PANIC.PLAYER_STATE.FINISHED
	validInputEnums       = [ENUM.INPUT_PANIC.INTERFACE.ENTER]
	typeEnum             = 3



func actOnInput_quack(currentInput:InputEvent) -> void:   
	for step in API_004_KitSet.selection.perform:
		var cachedStep = step.duplicate()
		API_005_Event.runKitSet(cachedStep)
		API_009_Sound.playRunKit()


