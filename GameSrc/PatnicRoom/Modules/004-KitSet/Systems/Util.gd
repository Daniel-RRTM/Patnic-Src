extends Node
class_name _008_KitSelect_Util



static func saniticePosition(toSanitice:Array) -> Array :
	var toReturn = {}
	
	#>>> OUT OF MAP <<<#
	for pos in toSanitice:
		if pos.x < 0 or pos.x >100 or pos.y < 0 or pos.y >100: pass
		else:toReturn[pos]=pos
	
	#>>> SOURCE ITSELF <<<#
#	for pos in toReturn.keys():
#		for source in [API_004_KitSet.selection.source]:
#			if pos == source: toReturn.erase(pos)
	
	return toReturn.keys()


