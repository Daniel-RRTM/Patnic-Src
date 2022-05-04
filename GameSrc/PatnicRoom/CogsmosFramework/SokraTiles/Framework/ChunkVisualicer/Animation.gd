extends SokraTiles_Chunk_Basic
class_name SokraTiles_Chunk_Animation


var cachedSelects = {}
var allAnimations = {}


func initialice(layerEnum):
	SokraTiles.addLayerManager(layerEnum,self)



func cacheForSelection(toCache:Dictionary): cachedSelects = toCache
func logStaticAnimation(tilesToAnimate):    allAnimations.append(tilesToAnimate)



func cancelCachedSelection():
	for i in cachedSelects.size():
		var currentSelect = cachedSelects[i]
		._drawCell(currentSelect["pos"],currentSelect["tex"])

	cachedSelects= {}




