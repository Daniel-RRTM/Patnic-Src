extends Object
class_name Statistics_Parser_Cmd


static func calc(cmdDict:Dictionary,filepath:String):
	var mdWriter = MarkdownWriter.new()
	
	mdWriter.add_template_title(cmdDict.toString)
	
	mdWriter.add_content_new_line("**Group:**  "+cmdDict.group+"  \n")
	
	mdWriter.add_content_same_line("**Input:**  "+cmdDict.input+"  \n")

	mdWriter.add_linebreak()
	mdWriter.add_linebreak()
	
	mdWriter.add_header("Parameter")
	
	mdWriter.create_table(["Name","Valid inputs"])
	for i in cmdDict.parameter.size():
		var currentName = cmdDict.parameter[i]
		var currentList = cmdDict.list[i]
		
		if currentList is Dictionary : currentList = currentList.keys() as PoolStringArray
		if currentList is Array      : currentList = currentList as PoolStringArray
		
		mdWriter.add_row_table([currentName,currentList.join(", ")])
	
	
	mdWriter.writeData(Gameloop.absolutefilePath+filepath)
	mdWriter.clear()
