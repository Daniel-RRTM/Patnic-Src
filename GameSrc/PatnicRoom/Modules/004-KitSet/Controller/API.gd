extends Node
# BOOKMARK[epic=Modules] 009_Stat_Mods                                         
# DOCS  > Docs\API\docs\Cogsmos\democrECS\SokraTILES.md                        
# DOCS  > TO ADD                                                               


# ----- INITIALICER -------------------------------------------------------------- ##


class KitSelection:
	var kitset ; var event ; var selects =[] ; var triggers=[]
	var reach  ; var sources ; var medium
	var alertTexture ; var highlightTexture


var _kitSetMerger := _008_KitSetMerger.new()
var _kitSelect    := _008_KitSelect.new()
var selection   



# ----- GETTER ------------------------------------------------------------------- ##

func getMergedKitsets(arrayOfKitparts:Array) -> KitSetEntity : return _kitSetMerger.mergeKitParts(arrayOfKitparts)

func redirectSelection(directionEnum) -> void : manageDirectionalSelect(directionEnum)

func drawHighlight()  -> void : _kitSelect.drawSelection(selection.selects,API_004_KitSet.selection.highlightTexture)
func drawAlert()      -> void : _kitSelect.drawSelection(selection.triggers,API_004_KitSet.selection.alertTexture)








# ----- PROCESS ------------------------------------------------------------------ ##




func manageKitSelection(inputNr:String) -> void:
	selection = _008_KitSelect_Util.setUpReferences(int(inputNr)-1)
	
	#>>> VECTOR 2D <<<#
	selection.selects = _008_KitSelect_Util.saniticePosition(API_005_Event.getSelectedPositions()) 
	
	#>>> ENTITIES ACROSS ALL LAYERS <<<#
	if selection.medium != "SELF": selection.selects  = _kitSelect.setSelections(selection.selects)
	else: selection.selects = [API_003_Player.currentChar] 
	selection.triggers = _kitSelect.validateSelects(API_004_KitSet.selection.event["SELECT"]["CONSIDER"])
	



	
func manageDirectionalSelect(directionEnum)->void:
	SokraTiles.getLayerNode(ENUM.SOKRATILES.LAYER.SELECTION).clearLayer()
	for caches in [selection.selects,selection.triggers]:   caches.clear()

	_004_Seize_MediumUniversal.run(int(selection.reach),directionEnum,API_003_Player.currentChar.pos())

	selection.selects  = _kitSelect.setSelections(_008_KitSelect_Util.saniticePosition(selection.selects))
	selection.triggers = _kitSelect.validateSelects(API_004_KitSet.selection.event["SELECT"]["CONSIDER"])

	API_004_KitSet.selection.alertTexture = "Marker_5_2"
	API_004_KitSet.drawAlert()




