extends Control



var category = "spawn"

func _ready() -> void:
	var allCmd = API_008_CLI.getGroupedSyntax()
	var cmd    = allCmd[category]
	var separator   = 20
	
	for i in cmd.size():
		var currentCmd = cmd.values()[i]
		var currentRow = self.get_node("VBoxContainer").get_node(str(i))
		
		currentRow.get_node("Description").bbcode_text = currentCmd["toString"]
		currentRow.get_node("input").bbcode_text       = currentCmd["input"]
		currentRow.get_node("Parameter").bbcode_text   = fillParameter(currentCmd["parameter"])


func fillParameter(arrOfParameter):
	var stringToReturn = ""
	
	stringToReturn += "["
	for i in arrOfParameter.size():
		stringToReturn += arrOfParameter.pop_back()
		if !arrOfParameter.empty():stringToReturn+=", "
	stringToReturn += "]"
	
	return stringToReturn




