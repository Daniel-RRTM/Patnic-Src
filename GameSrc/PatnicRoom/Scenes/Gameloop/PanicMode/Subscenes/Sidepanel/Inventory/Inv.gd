extends Control

var fsm
func buildRef(fsmPara): 
	fsm = fsmPara

func _enter_tree() -> void: 
	get_node("AnimationPlayer").play("rightToLeft")




func exitAnimation(fsmPara):
	fsm = fsmPara
	get_node("AnimationPlayer").play("LeftToRight")
	self.queue_free()


