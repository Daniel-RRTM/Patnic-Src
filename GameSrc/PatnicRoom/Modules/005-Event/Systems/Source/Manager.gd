extends System
class_name _005_SourceSystem


func declare() -> void:
	self.name              = "_005_SourceSystem"
	self.description       = "gets the position(s) form which the selection starts"
	self.APIRef            = API_005_Event
	self.signalsConnection = {}
	self.operations        = {
		"SELF"             : _004_Seize_SourceSelf
	}


func prepare() -> void: pass


func mediumSelf() -> _004_Seize_SourceSelf : return operations["SELF"] 



# ----- PROCESS -------------------------------------------------------------- ##


func operateOnParameter(taskData:Dictionary) -> Array:
	if   !taskData.has("source"): printerr("taskData for "+name+" is not set as key")
	elif !operations.keys().has(taskData.source): printerr("Operation ["+taskData.source+"] in System ["+name+"] not found!")
	else : return self.operations[taskData.source].run(taskData)
	return []



func getAutoDoc() -> Dictionary : return {
		"keyword"      : "SELF"
	   ,"opertion"     : "MEDIUM"
	   ,"concept"      : "SOURCE"
	   
	   ,"description"  : "selects (just) pos of player as startingpoint"
	   
	   ,"validSteps"   : [  
	   ]
   
   }