extends RichTextLabel


func _init() :
	var cmd         = API_008_CLI.getGroupedSyntax().keys()
	var cmdToString = API_008_CLI.getGroupedSyntax().values()
	var separator   = 20
	
	for i in cmd.size():
		var currentCmd      = cmd[i]
		var currentToString = cmdToString[i]
		var toPrint         = ""
		
		toPrint += "[color=yellow]"+currentCmd+"[/color]"
		for j in range(0,separator-currentCmd.length()): 
			toPrint += " "
		toPrint += ":   "
		toPrint += currentToString["toString"]
		toPrint += "\n"
		
		bbcode_text += toPrint
		
