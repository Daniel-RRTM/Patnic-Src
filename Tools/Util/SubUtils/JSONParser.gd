extends Node
class_name _Util_JSON




func fileToDictionary(filepath:String):                                                          #parses file of JSON to dictionary
	var fileToDictionaryFile = File.new()
	fileToDictionaryFile.open(filepath,File.READ)
	var fileToDictionaryJSON = JSON.parse(fileToDictionaryFile.get_as_text())
	fileToDictionaryFile.close()
	return fileToDictionaryJSON.result


func tilesOfTilesetToDictionary(filepath):
	var tileset = fileToDictionary(filepath)
	return tileset["tiles"]
