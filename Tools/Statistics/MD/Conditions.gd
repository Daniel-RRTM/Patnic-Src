extends Object
class_name Statistics_Conditions



static func calc():
	var mdWriter = MarkdownWriter.new()
	var namings = Utils.json().fileToDictionary("res://Config/Namings.json")
	
	mdWriter.add_template_title("List of Conditions")
	mdWriter.create_table(["Name","Description"])
	
	for entry in API_001_Atlas.Conditions().getEntries().values():   mdWriter.add_row_table([entry.name(),entry.description()])
	
	mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/API/Docs/Modules/006/List.md")
	mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/API/Docs/CogsmosFramework/DemocrECS/Entity-Attributes/Conditions/List.md")
	mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/Wiki/Docs/Overview/Conditions.md")
