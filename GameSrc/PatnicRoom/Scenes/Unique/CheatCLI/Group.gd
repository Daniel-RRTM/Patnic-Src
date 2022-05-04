extends Control



func fillGrouping(relevantCmds:Dictionary) -> void:
	for i in relevantCmds.size():
		var currentRow = self.get_node("VBoxContainer/"+str(i))
		var currentCmd    = relevantCmds.values()[i]
		
		
		if currentCmd.input != "WIP":
			currentRow.get_node("Description").bbcode_text = currentCmd.toString
			currentRow.get_node("Parameter").bbcode_text   = "  "+fillParameter(currentCmd.parameter)
			currentRow.get_node("Input").bbcode_text       = currentCmd.input
		
			for node in ["Description","Parameter","Input"] : currentRow.get_node(node).bbcode_enabled = true
			for j in ["1","2"] : currentRow.get_node("Separator"+j).visible=true





func fillParameter(arrOfParameter:PoolStringArray) -> String:
	if arrOfParameter.empty() : return ""
	else : return arrOfParameter.join(", ")


