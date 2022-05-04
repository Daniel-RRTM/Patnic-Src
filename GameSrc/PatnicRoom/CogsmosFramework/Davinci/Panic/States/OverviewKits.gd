extends _DavINCi_FSM_StateParentInterface
class_name _DavINCi_FSM_Panic_OverviewKits


var sceneForInfopanel = "res://GameSrc/PatnicRoom/scenes/Gameloop/PanicMode/Subscenes/Sidepanel/Kits/Kits.tscn"

func _init() -> void:
	Signals.connect("animation_finished",self,"freeInfoPnale")
	validInputEnums = [ENUM.INPUT_PANIC.INFO.KITS]
	typeEnum  = 1



func actOnInput_quack(currentInput:InputEvent) -> void:   
	var subInfoPanelInstance = load(sceneForInfopanel).instance()
	
	if Gameloop.scene.get_node("SidePanel").get_child_count() == 1: 
		Gameloop.scene.get_node("SidePanel").get_child(0).exitAnimation(self)
		Gameloop.scene.get_node("SidePanel").get_child(0).queue_free()
	
	Gameloop.scene.get_node("SidePanel").add_child(subInfoPanelInstance)
	Gameloop.scene.get_node("SidePanel").get_child(0).buildRef(self)
	API_009_Sound.playTriggerPanicSlide()


