extends Object
class_name Statistics_Parser_UniqueStatmods


static func calc(cmdDict:Dictionary,filepath:String):
	var mdWriter = MarkdownWriter.new()
	
	mdWriter.add_template_title(cmdDict.name)
	
	mdWriter.add_content_same_line("**Keyword:**  "+cmdDict.keyword+"  \n\n")
	mdWriter.add_content_new_line(cmdDict.toString+"  \n")
	

	mdWriter.add_linebreak()
	mdWriter.add_linebreak()
	
	mdWriter.add_header("Parameter")
	
	mdWriter.create_table(["Name","Valid inputs"])
	for i in cmdDict.parameter.size():
		var currentName = cmdDict.parameter[i]
		var currentList = cmdDict.list[i]
		
		if currentList is Dictionary : currentList = currentList.keys() as PoolStringArray
		if currentList is Array      : currentList = currentList as PoolStringArray
		if currentList is String:mdWriter.add_row_table([currentName,currentList])
		else:mdWriter.add_row_table([currentName,currentList.join(", ")])
	
	
	mdWriter.writeData(Gameloop.absolutefilePath+filepath)
	mdWriter.clear()
