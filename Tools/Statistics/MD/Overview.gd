extends Node
class_name Statistics_Overview



static func calc(nameArr,nameOfList):
	var mdWriter = MarkdownWriter.new()
	mdWriter.add_template_title("Overview of "+nameOfList)
	
	match nameOfList:
		"Roles"        :   mdWriter = runRoles(nameArr,nameOfList,mdWriter)
		"BaseKitParts" :   mdWriter = runKitCat(nameArr,nameOfList,mdWriter)
		"TileSets"     :   mdWriter = runTileSet(nameArr,nameOfList,mdWriter)
		_              :   mdWriter = runDefault(nameArr,nameOfList,mdWriter)
	
	mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/Wiki/Docs/Overview/"+nameOfList+".md")




 



static func runDefault(nameArr,nameOfList,mdWriter):
	for entry in nameArr:
		var entryToString = entry.to_lower().capitalize()
		var dirPath = "../../SubAtlas"
		var filePath = dirPath+"/"+nameOfList+"/index.html"
		mdWriter.add_content_new_line("* ["+entryToString+"]("+filePath+"#"+entry+")")
	return mdWriter




static func runKitCat(nameArr,nameOfList,mdWriter:MarkdownWriter,toParse = {}):
	for catKey in ENUM.KITS.CATEGORY.keys(): 
		toParse[catKey] = []
	
	for baseKitPartIndex in nameArr: 
		var ent  = API_001_Atlas.KitParts().getEntry(baseKitPartIndex)
		var dict = {"name":ent.name() , "index":ent.index()}
		toParse[ent.catType()].append(dict)
	
	
	for catKey in ENUM.KITS.CATEGORY.keys(): 
		mdWriter.add_header(catKey)
		for kitPart in toParse[catKey]:
			mdWriter.add_content_new_line("* ["+kitPart.name+"](../../SubAtlas/BaseKitParts/"+kitPart.index+")")
	
	
	return mdWriter




static func runRoles(nameArr,nameOfList,mdWriter:MarkdownWriter):
	var toPrint ={}
	for entry in nameArr:
		var split = entry.split("_")
		var role  = split[0].to_lower().capitalize()
		var tier  = "Tier "+split[1]
		if !toPrint.has(role) : toPrint[role] = []
		toPrint[role].append({"TIER":tier,"FILENAME":entry})
	
	for key in toPrint.keys():
		mdWriter.add_header(key)
		for tier in toPrint[key]:
			var head   = "* ["+tier["TIER"]+"]"
			var body   = "(../../SubAtlas/"+nameOfList+"/index.html"
			var inline = "#"+tier["FILENAME"]+")"
			mdWriter.add_content_new_line(head+body+inline)
	return mdWriter






static func runTileSet(nameArr,nameOfList,mdWriter:MarkdownWriter):
	for tileset in nameArr.size():
		var currentTilesetName    = nameArr.keys()[tileset]
		var currentTilesetEntries = nameArr.values()[tileset]
		mdWriter.add_header(currentTilesetName,2)
		mdWriter.create_table(["C_12_ATLAS_INDEX","C_6_NAME","C_0_DESCRIPTION"])
		
		
		for tile in currentTilesetEntries:
			var index = tile.getCompValue("C_12_ATLAS_INDEX")
			var name  = tile.getCompValue("C_6_NAME")
			var desc  = tile.getCompValue("C_0_DESCRIPTION")
			name      = "["+name+"](../../site/SubAtlas/Tiles/"+index+"/index.html)"
			mdWriter.add_row_table([name,index,desc])
		mdWriter.add_header("  ",3)
		
	return mdWriter



