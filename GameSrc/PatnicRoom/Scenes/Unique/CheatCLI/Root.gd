extends Node2D


onready var allCmd = API_008_CLI.getGroupedSyntax()

onready var allGroups = [
	 get_node("Common")
	,get_node("Kits")
	,get_node("Spawn")
	,get_node("Gear")
]




func _enter_tree(): 
	if API_008_CLI.getGroupedSyntax().empty(): API_008_CLI.groupCmds()
	API_009_Sound.playTriggerPanicSlide()


func _ready():
	for child in allGroups:   
		if child is Control:   
			child.fillGrouping(allCmd[child.name.to_lower()])


