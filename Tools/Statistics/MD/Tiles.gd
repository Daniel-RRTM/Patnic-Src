extends Node
class_name Statistics_Tiles_MD


static func calc():
	
	var atlas       = API_001_Atlas.Tiles().getEntries()


	for tile in atlas.size():
		var mdWriter    = MarkdownWriter.new()
		var currentTileName = atlas.keys()[tile]	
		var currentTile     = atlas.values()[tile]
		mdWriter.add_template_title(currentTileName)
		
		
		mdWriter.add_header("Compnents: ")
		mdWriter.create_table(["Component","Value"])
		var compsOfTile     = currentTile.components
		for currentComponent in compsOfTile.values():
			var componentName = currentComponent.name
			var value = currentComponent.value
			mdWriter.add_row_table([componentName,value])
		
		
		mdWriter.add_header("Flags: ")
		for currentFlag in currentTile.flags:
			mdWriter.add_content_new_line("* "+currentFlag)
		
		
		mdWriter.add_header("Properties: ")
		for currentFlag in currentTile.properties:
			mdWriter.add_content_new_line("* "+PROPERTIES.OF.keys()[currentFlag])
		
		
		
		mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/Wiki/docs/SubAtlas/Tiles/"+currentTileName+".md")


 
