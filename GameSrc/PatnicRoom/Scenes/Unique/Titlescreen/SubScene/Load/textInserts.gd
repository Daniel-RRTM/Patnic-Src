extends Node2D


func _ready() -> void:
	var fileWriter = File.new()
	_getNews(fileWriter)
	_getPatchnotes(fileWriter)



func _getPatchnotes(fileWriter:File) -> void:
	fileWriter.open("res://Config/TextInserts/Patches.txt", File.READ)
	var content = fileWriter.get_as_text().split("\n") as Array
	fileWriter.close()
	
	get_node("Patchnotes/Body/Content").bbcode_text  = "[color=red][center]"+content.pop_front()+"[/center][/color]\n"
	get_node("Patchnotes/Body/Content").bbcode_text += "Ver [color=yellow]"+content.pop_front()+"[/color]\n"
	get_node("Patchnotes/Body/Content").bbcode_text += "Of  [color=yellow]"+content.pop_front()+"[/color]\n"
	
	for line in content: get_node("Patchnotes/Body/Content").bbcode_text += line+"\n"




func _getNews(fileWriter:File) -> void:
	fileWriter.open("res://Config/TextInserts/News.txt", File.READ)
	get_node("News/Body/Content").bbcode_text = fileWriter.get_as_text()
	fileWriter.close()
