extends Panel

func _ready() -> void:
	var basepath = "res://GameSrc/PatnicRoom/scenes/Gameloop/RestMode/"
	
	get_node("2").initialice(basepath+"Self/Charsheet/Charsheet.tscn",ENUM.INPUT_REST.SELF.CHAR)
	get_node("1").initialice(basepath+"Self/Inventory/Inventar.tscn",ENUM.INPUT_REST.SELF.INVENTORY)
	get_node("3").initialice(basepath+"Self/Rootnet/Rootnet.tscn",ENUM.INPUT_REST.SELF.ROOTNET)
	get_node("4").initialice("res://GameSrc/PatnicRoom/scenes/Gameloop/RestMode/Station/Station.tscn",ENUM.INPUT_REST.STATION.WORKSHOP)
	get_node("6").initialice("res://GameSrc/PatnicRoom/scenes/Gameloop/RestMode/Station/Station.tscn",ENUM.INPUT_REST.STATION.TERMINAL)
	get_node("5").initialice("res://GameSrc/PatnicRoom/scenes/Gameloop/RestMode/Station/Station.tscn",ENUM.INPUT_REST.STATION.RETREAT)
	
	get_node("panic button/text").initialice("res://Src/scenes/Gameloop/PanicMode/PanicMode.tscn",ENUM.INPUT_REST.SPECIAL.PANIC)



