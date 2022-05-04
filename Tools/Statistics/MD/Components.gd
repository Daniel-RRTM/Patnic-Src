extends Node
class_name Statistics_components_MD



static func calc():
	var mdWriter = MarkdownWriter.new()
	buildOverview(mdWriter,"List/",Gameloop.absolutefilePath+"/Docs/API/Docs/CogsmosFramework/DemocrECS/Entity-Attributes/Components/List.md")
	buildOverview(mdWriter,"../SubAtlas/Components/",Gameloop.absolutefilePath+"/Docs/Wiki/Docs/Overview/Components.md")
	buildSinglePages(mdWriter)




static func buildOverview(mdWriter:MarkdownWriter,relativePath,pathToSave) -> void:
	
	mdWriter.add_template_title("Components")
	mdWriter.create_table(["Nr","Name"])
	
	for compName in DemocrECS.getAllComponents().keys():
		var compNr = compName.split("_")[1]
		var doc    = DemocrECS.getComponentClass(compName).getAutoDoc()
		
		var ref = "("+relativePath+compNr+".md)"
		var show = "["+doc["nameToShow"]+"]"
		
		mdWriter._add_row_table([compNr,show+ref])
		
	mdWriter.writeData(pathToSave)
	mdWriter.clear()








static func buildSinglePages(mdWriter:MarkdownWriter) -> void:
	for compName in DemocrECS.getAllComponents().keys():
		var fileName = compName.split("_")[1]
		var doc      = DemocrECS.getComponentClass(compName).getAutoDoc()
		
		mdWriter.add_template_title(compName)
		mdWriter.add_content_new_line("  ")
		
		for docKey in ["nameToShow","description","suggestion","validType"]:
			mdWriter.add_header(docKey+":")
			mdWriter.add_content_new_line("  ")
			mdWriter.add_content_new_line(str(doc[docKey])+"  ")
		
		mdWriter.add_header("validInputs:")
		mdWriter.add_content_new_line("  ")
		if doc["validInputs"].empty(): mdWriter.add_content_new_line("There is no by enumaration limited input-options.")
		else : 
			mdWriter.add_content_new_line("There are by enumaration limited options of inputs!")
			for valid in doc["validInputs"] : mdWriter.add_content_new_line(str(valid))
		
		
		mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/API/Docs/CogsmosFramework/DemocrECS/Entity-Attributes/Components/List/"+fileName+".md")
		mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/Wiki/Docs/SubAtlas/Components/"+fileName+".md")
		mdWriter.clear()









