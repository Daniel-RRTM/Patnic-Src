extends Control


var valuable


func initialice(valuablePara:Array):
	valuable = valuablePara
	get_node("Type/RichTextLabel").bbcode_text      = "[center]"+valuablePara[0]
	get_node("SubType/RichTextLabel").bbcode_text   = "[center]"+valuablePara[1]
	get_node("Quality/RichTextLabel").bbcode_text   = "[center]"+str(valuablePara[2])
	get_node("Count/RichTextLabel").bbcode_text   = "[center]"+str(valuablePara[3])+"x"







func _on_Button_pressed():
	get_node("../../../../..").calcToSell(valuable,"VALUABLE")
