extends Control


# ----- INITIALICE ----------------------------------------------------------- ##


onready var baseRTL     : RichTextLabel = get_node("content/base/RichTextLabel")
onready var modRTL      : RichTextLabel = get_node("content/mod/RichTextLabel")
onready var appendixRTL : RichTextLabel = get_node("content/appendix/RichTextLabel")


var kitParts = ["base","mod","appendix"]
var uiNodes
var kitset


# ----- FILL ENTRY ----------------------------------------------------------- ##


func setNewKiSsetSlotToMod(extra_arg_0: int) -> void:
	print(extra_arg_0)
	var cachedKitset = API_003_Player.currentChar._005_Common_Kitventory.getGearedKitSetByNr(extra_arg_0)
	API_003_Player.getCurrent_005_Common_Stationetter().setKitset(cachedKitset)
	
	resetNodes()
	updateForm(cachedKitset)


var scene = load("res://GameSrc/PatnicRoom/scenes/Gameloop/RestMode/Station/kitPartToModList/table.tscn").instance()
func showListOfRelevantKitParts(kitPartEnum) -> void:
	getKitPartToModNode(kitPartEnum).add_child(scene)
	scene.initialice(kitPartEnum)

	

# ----- CLEAR ENTRY ----------------------------------------------------------- ##


func resetNodes():
	for entry in ["mod","base","appendix"]:
		var nodePathRTL = "content/"+entry+"/RichTextLabel"
		get_node(nodePathRTL).clear()
		
		for button in ["add","change","remove"]:
			var nodePathButton = "content/"+entry+"/buttons/"+button
			get_node(nodePathButton).visible = false


func updateForm(kitset):
	if is_instance_valid(kitset):
		for kitPart in kitParts:
			uiNodes = getNodesByKitPart(kitPart,kitset)
			
			if is_instance_valid(uiNodes.kitpart) : fillKitPart()
			else                                  : uiNodes.voidButtons.visible = true





# ----- HELPER ----------------------------------------------------------- ##


func getKitPartToModNode(kitPartEnum):
	match kitPartEnum:
		ENUM.KITS.PARTS.BASE     : return get_node("content/base")
		ENUM.KITS.PARTS.MOD      : return get_node("content/mod")
		ENUM.KITS.PARTS.APPENDIX : return get_node("content/appendix")


func getNodesByKitPart(keyword,kitset):
	if keyword == "mod"      : return UINodes.new(kitset.mod, modRTL)
	if keyword == "base"     : return UINodes.new(kitset.base, baseRTL)
	if keyword == "appendix" : return UINodes.new(kitset.appendix, appendixRTL)


func fillKitPart():
	uiNodes.filledButtons[0].visible = true
	uiNodes.filledButtons[1].visible = true
	uiNodes.rtl.bbcode_text          = uiNodes.kitpart.name()


class UINodes:
	var kitpart; var rtl ; var filledButtons ; var voidButtons
	
	func _init(kitPartPara,rtlPara) -> void:
		var buttonHub = rtlPara.get_parent().get_node("buttons")
		
		kitpart       =   kitPartPara
		rtl           =   rtlPara
		filledButtons = [ buttonHub.get_node("change"), buttonHub.get_node("remove") ]
		voidButtons   =   buttonHub.get_node("add")





