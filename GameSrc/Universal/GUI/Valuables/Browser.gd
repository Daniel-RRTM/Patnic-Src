extends Control


var valuablesComp : C_50_VALUABLES
var entries       : Array

onready var typeFilter    = get_node("Filter/Type")
onready var subTypeFilter = get_node("Filter/SubType")
onready var qualityFilter = get_node("Filter/Quality")

func _ready(): initialice()

func initialice() -> void:
	clearEntries()
	valuablesComp = API_003_Player.currentChar.getComp("C_50_VALUABLES")
	var sceneQueue   = ["One.tscn","One.tscn"]
	for valuable in valuablesComp.validPaths:
		
		sceneQueue.invert()
		var filepathToScene = sceneQueue.front()
		var packedScene     = load("res://GameSrc/Universal/GUI/Valuables/subscene/Entry"+filepathToScene)
		var instancedScene  = packedScene.instance()
		
		instancedScene.initialice(valuable)
		entries.append({"type":valuable[0],"subType":valuable[1],"quality":str(valuable[2]),"scene":instancedScene})
		get_node("All KitParts/ScrollContainer/VBoxContainer").add_child(instancedScene)



func _on_filter_pressed(itemIndex:int) -> void:
	for entry in entries: entry["scene"].visible = false
	
	for entry in entries:
		var validations = []
		
		for filter in [typeFilter,subTypeFilter,qualityFilter]:
			var entrySelection  = entry[filter.getAttribute()]
			var filterSelection = filter.getSelectionText()
			
			validations.append(entrySelection == filterSelection or filterSelection == "")
		entry.scene.visible = validations.count(true) == 3



func clearEntries():
	for node in get_node("All KitParts/ScrollContainer/VBoxContainer").get_children():
		node.queue_free()
