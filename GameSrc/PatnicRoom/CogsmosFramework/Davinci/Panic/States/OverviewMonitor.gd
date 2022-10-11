extends _DavINCi_FSM_StateParentInterface
class_name _DavINCi_FSM_Panic_OverviewMonitor


var sceneForInfopanel = "res://GameSrc/PatnicRoom/scenes/Gameloop/PanicMode/Subscenes/Sidepanel/Monitor/Monitor.tscn"

func _init() -> void:
	Signals.connect("animation_finished",self,"freeInfoPnale")
	validInputEnums = [ENUM.INPUT_PANIC.INFO.MONITOR]
	typeEnum  = 1



func actOnInput_quack(currentInput:InputEvent) -> void:   
	var subInfoPanelInstance = load(sceneForInfopanel).instance()
	var sidePanel = Gameloop.scene.get_node("SidePanel")
	var hadPreviousSidePanel = false
	
	if sidePanel.get_child_count() == 1: 
		sidePanel.get_child(0).exitAnimation(self)
		sidePanel.get_child(0).queue_free()
		hadPreviousSidePanel = sidePanel.get_child(0).name != "Monitor"
	
	if sidePanel.get_child_count() == 0 or hadPreviousSidePanel: 
		sidePanel.add_child(subInfoPanelInstance)
		sidePanel.get_child(0).buildRef(self)
	
	API_009_Sound.playTriggerPanicSlide()
