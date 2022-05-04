extends SokraTiles_Chunk_Basic
class_name SokraTiles_Chunk_Interactables


func initialice(layerEnum,layerNode) -> void:
	entsOnMap = SokraTiles.getLayerDictionary(layerEnum)
	SokraTiles.addLayerManager(layerEnum,layerNode)



