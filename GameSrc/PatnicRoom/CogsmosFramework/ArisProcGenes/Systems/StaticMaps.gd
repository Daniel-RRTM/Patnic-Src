extends Node
class_name _Arisprocgenes_StaticMaps



static func run(mapPath:String):
	SokraTiles.loadChunk(mapPath)
	SokraTiles.setHasPlayerRested(false)
	var tilesToFree = SokraTiles.tilemap
	
	var base = Gameloop.scene.get_node("root_Map/Map side/HBoxContainer/ViewportContainer/Viewport")
	base.get_node("Perception/Meat Layer/Floor").entsOnMap = SokraTiles.getLayerDictionary(ENUM.SOKRATILES.LAYER.MEAT_GROUND)
	base.get_node("Perception/Meat Layer/Interactables").entsOnMap = SokraTiles.getLayerDictionary(ENUM.SOKRATILES.LAYER.MEAT_INTERACTABLE)
	
	Signals.emit_signal("Tilemap_Changed")
	
	


