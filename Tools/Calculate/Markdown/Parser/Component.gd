extends Node
class_name Statistics_Parser_Component



static func calc(compDict:Dictionary,filepath:String):
	var mdWriter = MarkdownWriter.new()
	
	mdWriter.add_template_title(compDict.nameToShow)
	mdWriter.add_content_new_line("  ")
	
	for docKey in ["nameToShow","description","suggestion","validType"]:
		mdWriter.add_header(docKey+":")
		mdWriter.add_content_new_line("  ")
		mdWriter.add_content_new_line(str(compDict[docKey])+"  ")
	
	mdWriter.add_header("validInputs:")
	mdWriter.add_content_new_line("  ")
	if compDict["validInputs"].empty(): mdWriter.add_content_new_line("There is no by enumaration limited input-options.")
	else : 
		mdWriter.add_content_new_line("There are by enumaration limited options of inputs!")
		for valid in compDict["validInputs"] : mdWriter.add_content_new_line(str(valid))
	
	
	mdWriter.writeData(Gameloop.absolutefilePath+filepath)
	mdWriter.clear()












