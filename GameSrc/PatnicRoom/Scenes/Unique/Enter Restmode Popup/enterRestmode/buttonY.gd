extends Control

func _ready():
	minVec = rect_global_position
	var cacheSizeOfRect = Vector2(get_end().x-get_begin().x,get_end().y-get_begin().y)
	maxVec = Vector2(minVec.x+cacheSizeOfRect.x,minVec.y+cacheSizeOfRect.y)


var minVec
var maxVec
func _input(event):
		if event.is_action("Interface_Mouse_Left") and isMouseOnNode(minVec,maxVec):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			get_node("../..").remove_child(get_node("root_enterSaveroom"))
			get_tree().change_scene("res://Src/scenes/Gameloop/RestMode/Init.tscn")

func isMouseOnNode(minVec,maxVec):
	var mouse = get_global_mouse_position()
	return mouse.x > minVec.x and mouse.y > minVec.y and mouse.x < maxVec.x and mouse.y < maxVec.y
