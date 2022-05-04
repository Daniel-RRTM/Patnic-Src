extends Node
class_name Statistics_atlas_MD



static func calc(atlasPara,typePara,filepath):
	var mdWriter = MarkdownWriter.new()
	mdWriter.add_template_title("Atlas "+typePara)


	for entry in atlasPara.values():
		mdWriter.add_header(entry.getCompValue("C_12_ATLAS_INDEX"),3)

		mdWriter.create_table(["Statname","Value"])
		for stat in entry.components.values(): 
			mdWriter.add_row_table([stat.name,stat.value])


	mdWriter.writeData(filepath)












