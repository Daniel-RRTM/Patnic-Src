extends Node
class_name _Alecandria_Menue_Manager


var fontPath   = "res://Assets/Alecandria/customeFont/MainMenue.tres"
var keywords   = "MainMenue"
var staticText = "\nPatnicRoom\n    TextToolBox! \n\n\n\n<<Menue>>\n\no Introduction\no Design\no Browse\no Option\n\n\n\n\n\n"



func manageInput(event:InputEvent, root) -> void:
	if event.is_action("Interface_Generall_Enter"):
		var mainInput = root.mainTed.getInput()
		
		if mainInput.split("o ").size() == 2:
			match root.mainTed.getInput().split("o ")[1]:
				"Introduction" : pass
				"Design"       : root.changeMode(root.DesignManager)
				"Browse"       : root.changeMode(root.BrowserManager)
				"Option"       : pass
				_              : pass



func runCustomPrep(root) -> void:
	pass



