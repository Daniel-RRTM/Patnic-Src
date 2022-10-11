extends Node
class_name Statistics_JSON_Hub



static func run() -> void:
	var compAtlas = {}
	var file = File.new()
	
	for key in DemocrECS.getAllComponents().keys():compAtlas[key] = DemocrECS.getComponentClass(key).getAutoDoc()
	Utils.json().saveDictAsJSON("GameData/Alecandria/Components.json",compAtlas)
	
 


