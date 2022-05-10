extends Node
class_name _Util_Directory


func getDirNamesInFilepath(filePath:String, saveStates=[]) -> Array:
	var dirManager = Directory.new()
	dirManager.open(filePath)
	dirManager.list_dir_begin()
	var currentDirName = dirManager.get_next()
	
	while currentDirName != "":
		if !"." in currentDirName: saveStates.append(currentDirName)
		currentDirName = dirManager.get_next()
	
	return saveStates


func getFileNamesInFilepath(filePath:String, saveStates=[]) -> Array:
	var dirManager = Directory.new()
	dirManager.open(filePath)
	dirManager.list_dir_begin(true,false)
	var currentDirName = dirManager.get_next()
	
	while currentDirName != ""  :
		saveStates.append(currentDirName)
		currentDirName = dirManager.get_next()
	
	return saveStates


