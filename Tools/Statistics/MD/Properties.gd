extends Object
class_name Statistics_Properties



static func calc():
	var mdWriter = MarkdownWriter.new()
	
	
	mdWriter.add_template_title("List of Properties")
	mdWriter.create_table(["Name","Nr"])
	
	for entry in PROPERTIES.OF.keys():   
		mdWriter.add_row_table([entry,PROPERTIES.OF[entry]])
	
	mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/API/Docs/CogsmosFramework/DemocrECS/Entity-Attributes/Properties/List.md")

