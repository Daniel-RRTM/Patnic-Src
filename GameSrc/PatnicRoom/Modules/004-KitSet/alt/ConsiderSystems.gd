extends System
class_name _005_ConsiderSystem


func declare() -> void:
	self.name              = "_005_Medium,"
	self.description       = "applies the shape of selections on source(s)"
	self.APIRef            = API_005_Event
	
	self.signalsConnection = {   
		#"API_008_runCmds" : "runTasks"   
	}
	
	# REFACTOR using parameter 
	self.operations  = {
		 "COMP"   : _004_Consider_ComponentAlt
		,"COND"  : _004_Consider_ConditionAlt
		,"FLAG" : _004_Consider_FlagAlt
		,"PROP"   : _004_Consider_PropertyAlt
		,"TYPE"   : _004_Consider_TypeAlt
	}


func prepare() -> void: pass



func _operateOnParameter(taskData:Dictionary) -> Array:
	if   !taskData.has("source"): printerr("taskData for "+name+" is not set as key")
	elif !operations.keys().has(taskData.source): printerr("Operation ["+taskData.source+"] in System ["+name+"] not found!")
	else : return self.operations[taskData.source].run(taskData)
	return []



func parseConsiderationsToDictionaries(taskData:Array) -> Array:
	var toReturn = []
	for consideration in taskData:
		
		var currentConsider = {	 "connector" : consideration.pop_front()
								,"operation" : consideration.pop_front() }
		currentConsider["parameter"] = self.operations[currentConsider.operation].convertArrayToDict(consideration)
		
		toReturn.append(currentConsider)
	return toReturn



func getTriggeredFromConsiderations(taskData:Dictionary) -> Array:
	var toReturn = []
	for consi in taskData.consider :
		
		if "THIS" in consi.connector : 
			taskData.triggeredEnts  = self.operations[consi.operation].run(consi.parameter,taskData.selectedEnts)
		
		
		elif "OR" in consi.connector :
			taskData.triggeredEnts += self.operations[consi.operation].run(consi.parameter,taskData.selectedEnts)
		
		
		elif "AND" in consi.connector :
			taskData.triggeredEnts  = self.operations[consi.operation].run(consi.parameter,taskData.triggeredEnts)
	
	return taskData.triggeredEnts



