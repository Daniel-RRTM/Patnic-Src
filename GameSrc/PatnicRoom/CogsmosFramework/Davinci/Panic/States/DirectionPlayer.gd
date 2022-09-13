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
	var playerPos = API_003_Player.currentChar.pos()
	var newPos    = API_002_Tilemap.getMovePos(playerPos,inputEnum)
	
	if SokraTiles.hasPlayerRested:
		if newPos.x == 100 or newPos.x == -1 or newPos.y == 100 or newPos.y == -1:
			SokraTiles.loadRandomChunk()
			SokraTiles.setHasPlayerRested(false)
			
	
	if newPos.x < 100 and newPos.x >= 0:
		if newPos.y < 100 and newPos.y >= 0:
	
			SokraTiles.getPlayer().movePlayer(inputEnum)
			SokraTiles.getSelection().clearLayer()
			API_009_Sound.playMovePlayer()



func isGenerallyValid(currentType:int, currentState:int) -> bool:
	if ![validPlayerStateEnum,secondValidPlayerEnum].has(Davinci.playerState) :   return false
	elif validInputEnums.has(currentState)                                    :   return true    
	return false
