extends Node2D

var options

onready var raceNode     =  get_node("Panel2/Race/OptionButton")
onready var kitsNode     =  get_node("Panel2/kits/OptionButton")
onready var nameNode     =  get_node("Panel2/Name/input")
onready var startButton  =  get_node("start")




func _ready() -> void:
	options = Utils.json().fileToDictionary("res://GameData/Misc/ChargenPresets.json") # REFACTOR 
	
	#>>> Race <<<#
	raceNode.add_item("")
	for raceToString in options.race.keys() : raceNode.add_item(raceToString.dedent())
	
	#>>> Kit <<<#
	kitsNode.add_icon_item(load(" "),"")
	for kit in options.kits : kitsNode.add_icon_item(load(kit.image),kit.name)




func _input(event: InputEvent) -> void:
	if Utils.node().isMouseOnNode(startButton) and event.is_action_pressed("Interface_Mouse_Left"):
		get_node("start/Hover zone")._on_Button_pressed()
		var chargenDict = setUpChargenDict()
		API_003_Player.generateNewChar(chargenDict)
		Gameloop.startPanicMode()



func _on_OptionButton_item_selected(index):
	#if !nameNode.bbcode_text.empty() and raceNode.selected != 0 and kitsNode.selected != 0 :
	startButton.visible = !nameNode.text.empty() and kitsNode.selected != 0 and raceNode.selected != 0



func setUpChargenDict():
	var kitSelect   = kitsNode.get_item_text(kitsNode.selected)
	var raceSelect  = raceNode.get_item_text(raceNode.selected)
	var nameSelect  = nameNode.text
	
	var kitsOfCat   = API_001_Atlas.KitParts().getKitGroup(kitSelect.to_upper())
	var randomKitnr = Utils.rng().getRandomNumber(1,kitsOfCat.size())
	kitSelect       = [kitsOfCat.values()[randomKitnr-1].baseKit.index(),"",""]
	
	var dict = Utils.json().fileToDictionary("res://Config/Savestate/template/char1.json")
	dict ["kitsets"]  = [kitSelect]
	dict ["race"]     = raceSelect
	dict["name"]      = nameSelect
	dict["credits"]   = 0
	
	return dict




