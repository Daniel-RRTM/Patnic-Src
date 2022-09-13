extends Node
class_name Statistics_OverviewParser



static func calc(mode:String, relativePath:String,attributes:Array) -> void:
	var filepath = Gameloop.absolutefilePath+relativePath
	var mdWriter = MarkdownWriter.new()
	
	mdWriter.add_template_title(mode)
	mdWriter.create_table(["Nr","Name"])
	
	
	for compName in attributes:
		var indexNr = Statistics_Util.getIndexByMode(mode,compName).replace(" ","_")
		var ref     = "["+compName+"](List/"+indexNr+".md)"
		
		mdWriter._add_row_table([indexNr,ref])
	
	
	mdWriter.writeData(filepath)
	mdWriter.clear()
	print(mode+" done!")



