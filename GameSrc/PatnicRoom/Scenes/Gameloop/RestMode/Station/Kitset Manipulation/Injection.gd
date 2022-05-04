extends Control


func _ready() -> void:
	var typeNodeNames = ["base","mod","appendix"]
	var modeNodeNames = ["add","remove","change"]
	
	for i in typeNodeNames.size():
		var currentTypeEnum = typeNodeNames[i]
		
		for j in modeNodeNames.size():
			var currentModeEnum = modeNodeNames[j]
			
			var button = get_node(currentTypeEnum+"/buttons/"+currentModeEnum)
			
			button.kitPartEnum = i
			button.modeEnum    = j



