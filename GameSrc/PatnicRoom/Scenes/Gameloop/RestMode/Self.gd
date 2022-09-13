extends Control

var selfTicker = []

onready var kitSlotBar = get_node("KitSlot/Panel/ProgressBar")
onready var traitBar    = get_node("Perk/Panel/ProgressBar")

onready var kitSlotRtl = get_node("KitSlot/counter")
onready var traitRtl    = get_node("Perk/counter")

onready var timer = get_node("Timer")

func _ready() -> void:
	selfTicker += getKitSlot()
	
	
	
	for progress in selfTicker:    progress["BAR"].max_value = progress["MAX"]
	timer.start()
	



func _on_Timer_timeout() -> void:
	if !selfTicker.empty():
		for progress in selfTicker:
			
			if progress["CURRENT"] == progress["BAR"].value:   selfTicker.erase(progress)
			if progress["CURRENT"] != progress["BAR"].value:   progress["BAR"].value += 1
			
			progress["RTL"].bbcode_text =  stationProgressToString(progress)
			
			if progress["BAR"].value == progress["MAX"]: 
				get_node(progress["BUTTON"]).visible = true




func stationProgressToString(progress):
	if progress["BAR"].value == progress["MAX"]:  return "[color=lime]FINISHED" 
	else:                                         return str(progress["BAR"].value)+" / "+str(progress["MAX"])






func getKitSlot():
	var kitSlot = API_003_Player.currentChar.getComp("C_39_KITSLOT_PROGRESSION")
	return [{
		"BAR"     : kitSlotBar,
		"RTL"     : kitSlotRtl,
		"BUTTON"  : "KitSlot/link",
		"MAX"     : kitSlot.neededForUpgrade,
		"CURRENT" : kitSlot.value
	}]


func getTrait():
	var trait = API_003_Player.currentChar.getComp("C_41_PERK_PROGRESSION")
	return [{
		"BAR"     : traitBar,
		"RTL"     : traitRtl,
		"BUTTON"  : "Perk/link",
		"MAX"     : C_41_PERK_PROGRESSION.neededForUpgrade,
		"CURRENT" : trait.value
	}]
