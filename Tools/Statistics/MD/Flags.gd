extends Object
class_name Statistics_Flags



static func calc():
	var mdWriter = MarkdownWriter.new()
	var namings = Utils.json().fileToDictionary("res://Config/Namings.json")
	
	mdWriter.add_template_title("List of Flags")
	mdWriter.create_table(["Name","Nr"])
	
	for entry in _Flags.getFlags().keys():   
		mdWriter.add_row_table([entry,_Flags.getFlags()[entry]])
	
	mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/API/Docs/CogsmosFramework/DemocrECS/Entity-Attributes/Flags/List.md")

