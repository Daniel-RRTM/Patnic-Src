extends Node

var nodeOfPlayerLayer
var nodeOfCamOfPlayer 



func _enter_tree() -> void:
	Gameloop.scene = self
	Davinci.initialicePanicScene(self)
	API_009_Sound.buildSceneReference()


func _input(event: InputEvent) -> void:   
	Davinci.manageInput(event)

func manageRound():
	Signals.emit_signal("Effect_Turn_Finished")
	API_003_Player.inputMode = true



func recievePlayer(node)    : nodeOfPlayerLayer = node
func recievePlayerCam(node) : nodeOfCamOfPlayer = node

