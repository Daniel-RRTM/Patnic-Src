extends Node2D



func _enter_tree() -> void:
	get_node("AnimationPlayer").play("rightToLeft")

func exitAnimation():
	get_node("AnimationPlayer").play("LeftToRight")
	yield(get_node("AnimationPlayer"),"animation_finished")
	Signals.emit_signal("animationFinished")
func _init() :
	Signals.connect("selfDestruct",self,"selfdestruct")

func selfdestruct():
	return self
