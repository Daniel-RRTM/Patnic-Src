extends Node
class_name Statistics_Parser_Generall




static func calc(mode:String, filepath:String,entry):
	var mdWriter = MarkdownWriter.new()
	mdWriter.add_template_title("Atlas "+mode)
	
	
	mdWriter.add_header(entry.getCompValue("C_12_ATLAS_INDEX"),3)

	mdWriter.create_table(["Statname","Value"])
	for stat in entry.components.values(): 
		mdWriter.add_row_table([stat.name,stat.value])


	mdWriter.writeData(Gameloop.absolutefilePath+filepath)

