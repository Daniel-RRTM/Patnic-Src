extends Node
class_name _008_KitSelect_Util


class KitSelection:
	var kitset ; var event ;var selects =[] ; var triggers=[]
	var reach  ; var source ; var medium
	var alertTexture ; var highlightTexture



static func setUpReferences(inputNr:int):
	var selection = KitSelection.new()
	
	selection.kitset = API_003_Player.currentChar.kitventory().kitsets().getByNr(inputNr)
	selection.event  = selection.kitset.event
	
	selection.reach  = selection.event["SELECT"]["SEIZE"][2][1]
	selection.source = API_003_Player.currentChar.pos()
	selection.medium = selection.event["SELECT"]["SEIZE"][0][1]
	
	selection.alertTexture     = API_005_Event.getAlertColor(selection.medium)
	selection.highlightTexture = API_005_Event.getHighlightColor(selection.medium)
	
	return selection
	



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
