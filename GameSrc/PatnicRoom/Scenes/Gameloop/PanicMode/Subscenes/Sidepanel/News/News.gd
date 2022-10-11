extends Control

var fsm
func buildRef(fsmPara): 
	fsm = fsmPara


func _enter_tree() -> void: 
	name = "News"
	get_node("AnimationPlayer").play("rightToLeft")
	



func exitAnimation(fsmPara):
	fsm = fsmPara
	get_node("AnimationPlayer").play("LeftToRight")


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "LeftToRight":
		fsm.playEnterAnimation()
		self.queue_free()



func refreshFilter(buttonName:String) -> void:
	API_014_NewsLog.catToShow[buttonName] = !API_014_NewsLog.catToShow[buttonName]
	API_014_NewsLog.reprintAll()
	



