extends TextureRect

func _ready():
	get_node(".").texture = Utils.rng().getBackground("panic")
