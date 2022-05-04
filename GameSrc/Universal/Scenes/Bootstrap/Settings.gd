extends Node

signal saveSettings

var settingsDict = {}


# BUG TO IMPLEMENT
func _ready() -> void:
#	var defaultSettings = Utils.json().fileToDictionary("res://Config/Settings.json")
#
#	for categoryKey in defaultSettings.keys():
#		for optionKey in defaultSettings[categoryKey].keys():
#
#			var optionValue = defaultSettings[categoryKey][optionKey]["default"]
#			settingsDict[optionKey] = optionValue
	
	print(settingsDict)



func saveSettings(): 
	emit_signal("saveSettings")
	print(settingsDict)






func getClearerInterface():  return settingsDict["Clearer Interface"]
func getColorDeficency():    return settingsDict["Color Deficency"]
func getPhotophobia():       return settingsDict["Photophobia"]
func getCommunityMods():     return settingsDict["Community mods"]
func getPersonalMods():      return settingsDict["Personal mods"]
