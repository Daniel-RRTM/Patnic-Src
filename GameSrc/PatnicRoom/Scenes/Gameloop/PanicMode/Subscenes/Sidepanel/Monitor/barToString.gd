extends RichTextLabel

func _process(delta) -> void: 
	bbcode_text = "[center]"+str(API_003_Player.currentChar.getCompValue("C_57_HITPOINTS"))
