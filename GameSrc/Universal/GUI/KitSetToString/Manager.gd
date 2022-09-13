extends Control


onready var modControle      = get_node("Mod")
onready var baseControle     = get_node("Base")
onready var appendixControle = get_node("Appendix")
var kitSetEnt



func loadKitset(kitset:KitSetEntity): # BUG 
	kitSetEnt = kitset
	resetKitPart()
	loadKitPart(kitset.base, baseControle)
	
	if is_instance_valid(kitset.mod): 
		loadKitPart(kitset.mod, modControle)
		setKitPartButtonVisibillity("Mod",false,true,true)
	else : setKitPartButtonVisibillity("Mod",true,false,false)
	
	if is_instance_valid(kitset.appendix): 
		loadKitPart(kitset.appendix, appendixControle)
		setKitPartButtonVisibillity("Appendix",false,true,true)
	else : setKitPartButtonVisibillity("Appendix",true,false,false)
	
	API_003_Player.getCurrentStationSetter().setKitset(kitSetEnt)



func loadKitPart(kitPart:KitPartEntity,node:Control):
	node.get_node("Name/Text").text           = kitPart.name()
	node.get_node("Desc/Text").bbcode_text    = kitPart.decription()
	node.get_node("Summary/Text").bbcode_text = kitPart.mechanicalSummary()
	node.get_node("Rarity/Text").bbcode_text  = "[center]"+str(kitPart.rarity())+"/10 : "+ENUM.ITEMS.RARITY_TO_STRING.values()[int(kitPart.rarity())]


func resetKitPart():
	for nodePath in ["Base","Appendix","Mod"]:
		get_node(nodePath+"/Summary/Text").bbcode_text = ""
		get_node(nodePath+"/Rarity/Text").bbcode_text  = ""
		get_node(nodePath+"/Desc/Text").bbcode_text    = ""
		get_node(nodePath+"/Name/Text").text           = ""


func setKitPartButtonVisibillity(kitPartStr,add,rem,exc):
	get_parent().get_node("Buttons/"+kitPartStr+"/Add").visible      = add
	get_parent().get_node("Buttons/"+kitPartStr+"/Remove").visible   = rem
	get_parent().get_node("Buttons/"+kitPartStr+"/Exchange").visible = exc




func onBuildPressed() -> void:
	API_003_Player.stationSetter.confirmTask()
	get_node("../..//Title").loadToString()



