extends Node
class_name _KitsUILoader


var itteration
var kitsShown  = [null,null,null,null,null]
var nodePaths  = {
	 "TITLE"    : "Title/text"
	,"COOLDOWN" : "Title/cooldownTimer"
	
	,"BASE"     : "kitbase/BaseText"
	,"MOD"      : "kitMod/ModText"
	,"APPENDIX" : "kitAppendix/AppendixText"
}


func _ready() -> void:
	getShownKitPanels()
	fillFirstSide()

func getShownKitPanels():
	for i in range(0,5):
		var stringToNode = "Kit"+str(i+1)
		kitsShown[i] = get_node(stringToNode)




func fillFirstSide():   
	itteration = 0
	itterateThroughPage()
	
func fillSecondSide():  
	itteration = 5
	itterateThroughPage()




func itterateThroughPage():
	for kitSetForm in kitsShown:
		
		var kitSetEntity = API_003_Player.currentChar.kitventory().kitsets().getByNr(itteration)
		
		if is_instance_valid(kitSetEntity):  fillKitsetForm(kitSetForm,kitSetEntity)
		else: clearKitSetForm(kitSetForm)
		itteration += 1


func fillKitsetForm(kitSetForm,kitSetEntity):
	for kitVar in nodePaths.keys():
		
		var currentNode = getNode(kitSetForm,nodePaths[kitVar])
		var cachedVar   = getKitVarBeyKeyword(kitVar,kitSetEntity)
		
		if is_instance_valid(currentNode):  currentNode.bbcode_text = formatBBCode(cachedVar)



func getKitVarBeyKeyword(keword,kit):
	match keword:
		"TITLE"    :  return formatKitNrBBCode()+kit.toString
		"COOLDOWN" :  return kit.getFormatedCooldownTimer()
		"BASE"     :  return kit.base.mechanicalSummary()
		"MOD"      :  if is_instance_valid(kit.mod):      return kit.mod.mechanicalSummary()       ; else: return ""
		"APPENDIX" :  if is_instance_valid(kit.appendix): return kit.appendix.mechanicalSummary()  ; else: return ""




func getNode(kitSetForm,kitVar):               return kitSetForm.get_node(kitVar)
func clearKitSetForm(kitSetForm):   for nodePath in nodePaths.values(): getNode(kitSetForm,nodePath).bbcode_text = ""

func formatBBCode(content,color="white"):      return "[color="+color+"]"+content+" [/color]"
func formatKitNrBBCode():                      return "[color=yellow]"+str(itteration+1)+" >[/color]  "






