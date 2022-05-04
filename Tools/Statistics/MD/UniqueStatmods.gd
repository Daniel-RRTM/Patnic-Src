extends Object
class_name Statistics_UniqueStatmods



static func calc():
	var mdWriter = MarkdownWriter.new()
	var namings = Utils.json().fileToDictionary("res://Config/Namings.json")
	
	mdWriter.add_template_title("List of StatMod")
	mdWriter.create_table(["Name","Description"])
	
	for entry in API_007_Statmod.getStatMods().values():   
		mdWriter.add_row_table([entry.getDoc().keyword,entry.getDoc().toString])
	
	mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/API/Docs/Modules/007/List.md")
	mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/Wiki/Docs/Overview/Statmods.md")
