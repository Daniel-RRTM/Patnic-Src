extends Camera2D

func _ready() -> void:
	get_tree().get_root().get_node("Node2D").recievePlayerCam(self)
	
	


func updateCenter(player:Vector2) -> void:
		var pixelToTileX = player.x*ENUM.SOKRATILES.TILE_PIXEL_SIZE
		var pixelToTileY = player.y*ENUM.SOKRATILES.TILE_PIXEL_SIZE
		
		position.x = pixelToTileX
		position.y = pixelToTileY


