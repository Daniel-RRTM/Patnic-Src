extends Node
# BOOKMARK[epic=Cogsmos] DavInCi --- Panic                                     
class_name _DavINCi_FSM_PanicAlt

var inputType = ENUM.INPUT_PANIC.INPUTS

var allStates = [	_DavINCi_FSM_Panic_DirectionPlayer.new()  ,
					_DavINCi_FSM_Panic_DirectionKit.new()     ,
					_DavINCi_FSM_Panic_KitSelect.new()        ,
					_DavINCi_FSM_Panic_KitRun.new()           ,
					_DavINCi_FSM_Panic_OpenCLI.new()          ,
					_DavINCi_FSM_Panic_OverviewMonitor.new()  ,
					_DavINCi_FSM_Panic_OverviewLogger.new()   ,
					_DavINCi_FSM_Panic_OverviewInventory.new(),
					_DavINCi_FSM_Panic_OverviewKits.new()     ]



func manageInput(event: InputEvent) -> void:
	if API_003_Player.getInputMode() and not event.is_echo() and event.is_action_type() and event.is_pressed():
		
		var inputEnum = Davinci.getInputToEnum(event)
		var inputType = getInputTypeByEnum(inputEnum)
		Davinci.cachedInput = event
		
		for state in allStates:
			if state.isGenerallyValid(inputType,inputEnum):
				if state.isSpecificallyValid_quack(inputType,inputEnum):
				
					state.actOnInput_quack(event)
					state.setNewState_quack()
	
	if Davinci.playerState == ENUM.INPUT_PANIC.PLAYER_STATE.FINISHED:
		Davinci.playerState = ENUM.INPUT_PANIC.PLAYER_STATE.STANDING
		Gameloop.beginActorTurn()



 
func getInputTypeByEnum(inputEnum):
	for i in inputType.size():
		if inputType.values()[i].values().has(inputEnum): return i
	printerr("input-enum"+str(inputEnum)+"for Panic state-pattern not found")
	return -1


