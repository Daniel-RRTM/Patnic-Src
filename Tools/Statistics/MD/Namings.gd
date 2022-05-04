extends Object
class_name Statistics_NamingsList



static func calc():
	var mdWriter = MarkdownWriter.new()
	var namings = Utils.json().fileToDictionary("res://Config/Namings.json")
	
	mdWriter.add_template_title("List of Namings")
	mdWriter.create_table(["Naming","Description"])
	
	for entry in namings.keys():   mdWriter.add_row_table([entry,namings[entry]])
	
	mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/API/Docs/Conventions/Namings.md")
	mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/Wiki/Docs/Overview/Namings.md")
