extends RichTextLabel

var writtenOut
var sceneToLoad
var enumNr

func initialice(scenePara,enumPara) -> void:
	sceneToLoad = scenePara
	enumNr      = enumPara

func _ready():
	bbcode_enabled = true
	writtenOut=bbcode_text
	bbcode_text = "[color=white]"+writtenOut+"[/color]"	


func _input(event:InputEvent) -> void:
	if isMouseOnNode(self) and event.is_action("Interface_Mouse_Left"):
		API_009_Sound.playLeavePanicRoom()
		SokraTiles.setHasPlayerRested(true) 
		get_tree().change_scene(ENUM.FILE_PATHS.SCENES.PANIC)
		var test = API_003_Player.stations
		
		
	if isMouseOnNode(self):
		bbcode_text = "[color=red]"+writtenOut
		
	if !isMouseOnNode(self):
		bbcode_text = writtenOut



func isMouseOnNode(node):
	var minVec = node.rect_global_position
	var cacheSizeOfRect = Vector2(node.get_end().x-node.get_begin().x,node.get_end().y-node.get_begin().y)
	var maxVec = Vector2(minVec.x+cacheSizeOfRect.x,minVec.y+cacheSizeOfRect.y)
		
	var mouse = node.get_global_mouse_position()

	return mouse.x > minVec.x and mouse.y > minVec.y and mouse.x < maxVec.x and mouse.y < maxVec.y
