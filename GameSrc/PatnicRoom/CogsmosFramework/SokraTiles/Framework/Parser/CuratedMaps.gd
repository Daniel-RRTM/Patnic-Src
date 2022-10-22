extends Node
class_name SokraTiles_CuratedMapsParser


static func parse() -> Dictionary:
	var filepath = "res://GameData/Tiled/Maps/Unique/"
	var curatedMaps = {}
	
	for mapName in Utils.directory().getFileNamesInFilepath(filepath):
		var mapDict  = Utils.json().fileToDictionary(filepath+mapName)
		var playable = mapDict["properties"][1]["value"] if mapDict["properties"][1]["name"] == "PLAYABLE" else mapDict["properties"][0]["value"]  
		var id       = mapDict["properties"][0]["value"] if mapDict["properties"][0]["name"] == "ID" else mapDict["properties"][1]["value"]  
		
		if playable: curatedMaps[id] = filepath+mapName


	return curatedMaps













