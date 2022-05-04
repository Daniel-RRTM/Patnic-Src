extends RichTextLabel



func _enter_tree() -> void: draw()

func draw():
	var stringForBBCode = ""
	for entry in API_008_CLI.activeCheats:
		stringForBBCode += drawBulletpoint()
		stringForBBCode += entry
		stringForBBCode += "\n"
	
	
	self.bbcode_text = stringForBBCode 





func drawBulletpoint(): return "[color=yellow]   > [/color]"
