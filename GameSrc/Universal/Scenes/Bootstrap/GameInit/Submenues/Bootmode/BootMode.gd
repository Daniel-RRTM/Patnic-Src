
extends Node



func _on_Restmode_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen
	SokraTiles.loadChunk("res://GameData/Tiled/TileMaps/Story/Suburban_One.json")
	GameInit.runRestmode()
	HomErrorLog.printIntoSeshLog("BOOT","starting in [color=lime]Rest-mode")


func _on_Quickstart_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen
	GameInit.runQuickStart()
	HomErrorLog.printIntoSeshLog("BOOT","starting with [color=lime]Quickstart[color=white] Char")


func _on_Statistics_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen
	GameInit.runStatistics()
	HomErrorLog.printIntoSeshLog("BOOT","starting in [color=lime]Statistics[color=white]")	


func _on_Tilemap_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen
	GameInit.runTilemapTest()
	HomErrorLog.printIntoSeshLog("BOOT","starting in [color=lime]Tilemap[color=white]")


func _on_LEC_Viewer_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen
	get_tree().change_scene(ENUM.FILE_PATHS.SCENES.LEC_VIEWER)
	HomErrorLog.printIntoSeshLog("BOOT","starting in [color=lime]Alecandria[color=white]")


# BOOKMARK[Debug] EXEPRIMENTAL BOOTMODE                                 
func _on_Experimental_pressed() -> void:
	var test = C_50_VALUABLES.new()
	print(test.get("REAGENTs","HERMETIC",11))
	
	test.add("REAGENTs","HERMETIC",5,5)
	print(test.get("REAGENTs","HERMETIC"))
	test.substract("REAGENTs","HERMETIC",5,2)
	print(test.get("REAGENTs","HERMETIC"))
	HomErrorLog.printIntoSeshLog("BOOT","starting in [color=lime]Experimental[color=white]")





var groups = []

func _on_Log_pressed():
	get_node("Log/group").add_item("")
	get_node("Log").visible = true
	for node in get_node("../..").get_children(): if node.name != "Form": node.visible = false
	
	for line in HomErrorLog.getFileData():
		get_node("Log/RichTextLabel").bbcode_text += line.time+"  "+line.group+"  "+line.desc+"[color=white]\n"
		if !groups.has(line.group): 
			groups.append(line.group)
			get_node("Log/group").add_item(line.group)


func _on_group_item_selected(index):
	var group = get_node("Log/group").get_item_text(index)
	get_node("Log/RichTextLabel").bbcode_text = ""
	for line in HomErrorLog.getFileData():
		if group == line.group: 
			get_node("Log/RichTextLabel").bbcode_text += line.time+"  "+line.group+"  "+line.desc+"[color=white]\n"


func _on_TextEdit_text_changed():
	var option = get_node("Log/group").get_item_text(get_node("Log/group").selected)
	if "\n" in get_node("Log/TextEdit").text:
		get_node("Log/RichTextLabel").bbcode_text = ""
		for line in HomErrorLog.getFileData():
			if option == line.group or option == ""  and get_node("Log/TextEdit").text.strip_escapes() in line.desc : 
				get_node("Log/RichTextLabel").bbcode_text += line.time+"  "+line.group+"  "+line.desc+"[color=white]\n"
	


func _on_reset_pressed():
	HomErrorLog.deleteExternalLog()
	get_node("Log/RichTextLabel").bbcode_text = ""


func _on_BROWSE_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	get_tree().change_scene("res://GameSrc/Alt Alecandria/Main.tscn")
	GameInit.isBrowseLecBootMode = true
	HomErrorLog.printIntoSeshLog("BOOT","starting in [color=lime]Alecandria Browse[color=white]")


func _on_DESIGN_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	get_tree().change_scene("res://GameSrc/Alt Alecandria/Main.tscn")
	GameInit.isDesignLecBootMode = true
	HomErrorLog.printIntoSeshLog("BOOT","starting in [color=lime]Alecandria Design[color=white]")



func _on_Deserialice_pressed():
	OS.window_fullscreen = true
	Statistics_JSON_Hub.run()
	get_tree().quit()
