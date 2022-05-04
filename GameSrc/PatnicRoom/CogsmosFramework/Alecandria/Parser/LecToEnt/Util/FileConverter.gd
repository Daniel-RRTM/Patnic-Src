extends Node
class_name Alecandria_Util_FileConverter



static func run(filepath:String) -> Array:
	var fileToString     = _getFileToString(filepath)
	var linesOfContent   =  fileToString.split("\n")
	var saniticedContent = _sanitice(linesOfContent)
	return saniticedContent






static func _getFileToString(filepath:String) -> String :
	var fileManager = File.new()
	var content = ""
	
	fileManager.open(filepath, File.READ)
	while not fileManager.eof_reached():   content += fileManager.get_line()+"\n"
	fileManager.close()
	
	return content




static func _sanitice(linesOfFile:Array) -> Array :
	var saniticedContent = []
	
	for line in linesOfFile:
		
		if !line.empty() : 
			if !line.begins_with("//") and !line.begins_with("}") :
				if line.count(" ") != line.length():
					saniticedContent.append(line)
	
	return saniticedContent



