extends _DavINCi_FSM_StateParentInterface
class_name _DavINCi_FSM_Panic_OpenCLI

var isCLIActive = true

func _init() -> void:
	validInputEnums      = [ENUM.INPUT_PANIC.INFO.CLI]
	typeEnum             = 1
	validPlayerStateEnum = -1
	stateAfterSucces     = Davinci.playerState





func actOnInput_quack(currentInput:InputEvent) -> void:  
	isCLIActive = !isCLIActive
	if !isCLIActive:Gameloop.scene.add_child(load(ENUM.FILE_PATHS.GUI_SUB_SCENES.CHEAT_CLI).instance())
	else: Gameloop.scene.remove_child(Gameloop.scene.get_node("CLI-Root"))


func isGenerallyValid(currentType:int, currentState:int) -> bool:
	if validInputEnums.has(currentState)                                    :   return true    
	return false
