extends SokraTiles_Chunk_Basic
class_name SokraTiles_Chunk_Floor


func initialice(layerEnum,layerNode) -> void:
	self.entsOnMap = SokraTiles.getLayerDictionary(layerEnum)
	SokraTiles.addLayerManager(layerEnum,layerNode)







