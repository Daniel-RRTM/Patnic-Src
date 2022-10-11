extends Control

var fsm
func buildRef(fsmPara): 
	fsm = fsmPara

func _enter_tree() -> void: 
	name = "Jurnal"
	get_node("AnimationPlayer").play("rightToLeft")




func exitAnimation(fsmPara):
	fsm = fsmPara
	get_node("AnimationPlayer").play("LeftToRight")
	emit_signal("animation_finished")
	#self.queue_free()


