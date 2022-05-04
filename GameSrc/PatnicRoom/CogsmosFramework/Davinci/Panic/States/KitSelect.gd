extends _DavINCi_FSM_StateParentInterface
class_name _DavINCi_FSM_Panic_KitSelect



func _init() -> void:
	validPlayerStateEnum = ENUM.INPUT_PANIC.PLAYER_STATE.STANDING
	stateAfterSucces     = -1 #DONE in L 19 and 20
	validInputEnums      = [ENUM.INPUT_PANIC.INPUTS.ACTION.SELECT]
	typeEnum             = 2


# FUNC IOOB preventer
func isSpecificallyValid_quack(currentType:int,currentState:int) -> bool:   
	var selectedKitNr = Davinci.cachedInput.as_text() as int
	var currentNumberOfKitsets = API_003_Player.currentChar.kitventory().kitsets().getAll().size()
	return selectedKitNr <= currentNumberOfKitsets


func actOnInput_quack(currentInput:InputEvent) -> void:   
		API_004_KitSet.manageKitSelection(Davinci.cachedInput.as_text())
		
		if API_005_Event.isNeedingDirection() : Davinci.playerState = ENUM.INPUT_PANIC.PLAYER_STATE.NEEDING_DIRECTION
		else                                  : Davinci.playerState = ENUM.INPUT_PANIC.PLAYER_STATE.SELECTING
		stateAfterSucces = Davinci.playerState
		SokraTiles.getSelection().clearLayer()
		if API_004_KitSet.selection.highlightTexture != "-1": 
			API_004_KitSet.drawHighlight()
		API_004_KitSet.drawAlert()
		API_009_Sound.playSelectKit()


