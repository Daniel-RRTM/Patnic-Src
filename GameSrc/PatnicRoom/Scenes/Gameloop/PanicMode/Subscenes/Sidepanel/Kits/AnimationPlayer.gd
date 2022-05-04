extends AnimationPlayer


func finish_free():
	get_parent().fsm.playEnterAnimation()
	get_parent().queue_free()
