extends VBoxContainer


enum MENUE_POINT {  LOAD_GAME , NEW_GAME , NEWS , INTRODUCTION , SETTINGS , CREDITS  }

func _on_press(extra_arg_one) -> void:
	var sceneToLoad = getSceneToAdd(extra_arg_one)
	addToFixpoint(sceneToLoad)
		




func getSceneToAdd(sceneEnum):
	var baseFilePath = "res://GameSrc/PatnicRoom/scenes/Unique/Titlescreen/" # REFACTOR 
	match sceneEnum:
		MENUE_POINT.NEW_GAME       : return load("res://GameSrc/PatnicRoom/Scenes/Unique/Titlescreen/SubScene/CreateNewGame/CreateNewGameAlt.tscn").instance()
		MENUE_POINT.INTRODUCTION   : return load(baseFilePath+"/SubScene/Introduction.tscn").instance()
		MENUE_POINT.CREDITS        : return load(baseFilePath+"/SubScene/credits.tscn").instance()
		MENUE_POINT.NEWS           : return load(baseFilePath+"/SubScene/NewsAndPathes/News&Patches.tscn").instance()
		
		MENUE_POINT.SETTINGS        : return load(baseFilePath+"/SubScene/Settings.tscn").instance()
		MENUE_POINT.LOAD_GAME       :  return load(baseFilePath+"/SubScene/Load/Load.tscn").instance()


func addToFixpoint(nodeToAdd):
	var fixpoint = get_node("../InjectablePanel")
	for child in fixpoint.get_children():  fixpoint.remove_child(child)
	fixpoint.add_child(nodeToAdd)
