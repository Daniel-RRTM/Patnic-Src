extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_pressed(extra_arg_0):
	for x in ["1","2","3","4","5"]: get_node("texts/"+str(x)).visible = false
	
	match extra_arg_0:
		0 : get_node("texts/1").visible = true
		1 : get_node("texts/2").visible = true
		2 : get_node("texts/3").visible = true
		3 : get_node("texts/4").visible = true
		4 : get_node("texts/5").visible = true
