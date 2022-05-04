extends Control

var filepath:String

var formType:String
var formCategory:String
var formName:String




func initialice(toInsert:Dictionary):
	formCategory = toInsert["CAT"]
	formType     = toInsert["TYPE"]
	formName     = toInsert["NAME"]
	filepath     = toInsert["PATH"]
	
	
	get_node("TYPE/RTL").bbcode_text = formType
	get_node("CAT/RTL").bbcode_text = formCategory
	get_node("NAME/RTL").bbcode_text = formName


func _on_Button_pressed() -> void:
	var dir = Directory.new()
	dir.remove(filepath)
	self.queue_free()
