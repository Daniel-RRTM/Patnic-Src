extends Node

var absolutefilePath = ProjectSettings.globalize_path("res://").split("/Src/")[0]
var scene
func initPanic():
	API_013_Behavior.loopThroughActor()


func startTitleMode():
	print(ENUM.FILE_PATHS.SCENES.TITLE)
	get_tree().change_scene(ENUM.FILE_PATHS.SCENES.TITLE)


func startRestMode():
	API_003_Player.stations.updateOnEnteringPanicroom()
	API_003_Player.currentChar.getComp("C_39_KITSLOT_PROGRESSION").increment()
	get_tree().change_scene(ENUM.FILE_PATHS.SCENES.REST)

func startPanicMode():
	get_tree().change_scene(ENUM.FILE_PATHS.SCENES.PANIC)
	API_014_NewsLog.metaEntry("Starting Panic-mode on Suburban!")
	SokraTiles.loadChunk("res://GameData/Tiled/TileMaps/Story/Suburban_One.json")




func _on_ActorMoveFinished():
	print("Actor move finished")
	Signals.emit_signal("Player_Turn_Started")



func beginActorTurn():
	#Signals.emit_signal("updateEntropy")
	Signals.emit_signal("Effect_Turn_Startedddd")
	API_013_Behavior.loopThroughActor()
	Signals.emit_signal("Actor_Turn_Finished")




