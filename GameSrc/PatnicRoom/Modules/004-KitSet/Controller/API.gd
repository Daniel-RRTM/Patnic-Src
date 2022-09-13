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

func drawHighlight()  -> void : _kitSelect.drawSelection(selection.selectedEnts,API_004_KitSet.selection.highlightTexture)
func drawAlert()      -> void : _kitSelect.drawSelection(selection.triggeredEnts,API_004_KitSet.selection.alertTexture)








# ----- PROCESS ------------------------------------------------------------------ ##




func manageKitSelection(inputNr:String) -> void:
	var kitSet = API_003_Player.currentChar.kitventory().kitsets().getByNr(int(inputNr)-1)
	API_004_KitSet.selection = _008_KitSelect._setSelectionReference(kitSet)
	
	if kitSet.currentCooldownTime != kitSet.cooldownTime: API_004_KitSet.selection = null
	else:
		API_004_KitSet.selection.sourcePos = API_005_Event.runSource(API_004_KitSet.selection)
		API_004_KitSet.selection.selectedPos = API_005_Event.runMedium(API_004_KitSet.selection)
		API_004_KitSet.selection.selectedEnts = _008_KitSelect.getEntsOfPos(API_004_KitSet.selection.selectedPos)
		API_004_KitSet.selection.triggeredEnts = API_005_Event.getTriggeredSelects(API_004_KitSet.selection)
	


	
func manageDirectionalSelect(directionEnum)->void:
	SokraTiles.getLayerNode(ENUM.SOKRATILES.LAYER.SELECTION).clearLayer()
	for caches in [selection.selectedEnts,selection.triggeredEnts,selection.selectedPos]:   caches.clear()
	
	for pos in selection.sourcePos:   _004_Seize_MediumUniversal.run(int(selection.reach),directionEnum,pos)
	
	selection.selectedEnts = _008_KitSelect.getEntsOfPos(API_004_KitSet.selection.selectedPos)
	selection.triggeredEnts = API_005_Event.getTriggeredSelects(API_004_KitSet.selection)
	
	API_004_KitSet.selection.alertTexture = "Marker_5_2"
	API_004_KitSet.drawAlert()




