extends Button

var sceneToLoad
var enumNr

func initialice(scenePara,enumPara) -> void:
	sceneToLoad = scenePara
	enumNr      = enumPara



func _on_pressed():
	Davinci.FSM_Hub.changeSzeneByInputEnum(self.enumNr,0)
