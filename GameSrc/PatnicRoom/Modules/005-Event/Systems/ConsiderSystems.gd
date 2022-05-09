extends System
class_name _005_ConsiderSystem


func declare() -> void:
	self.name              = "_005_Medium,"
	self.description       = "applies the shape of selections on source(s)"
	self.APIRef            = API_005_Event
	self.signalsConnection = {}
	
	self.operations = {
		 "COMP" : _004_Consider_Component
		,"COND" : _004_Consider_Condition
		,"FLAG" : _004_Consider_Flag
		,"PROP" : _004_Consider_Property
		,"TYPE" : _004_Consider_Type
	}

func prepare() -> void: pass



# ----- PROCESS -------------------------------------------------------------- ##



func parseConsiderationsToDictionaries(taskData:Array) -> Array:
	var toReturn : Array
	for consideration in taskData:
		toReturn.append(parseSingleConsiderArray(consideration))
	return toReturn



func getTriggeredFromConsiderations(taskData:Dictionary) -> Array:
	var toReturn = []
	for consi in taskData.consider :
		
		if "THIS" in consi.connector : 
			taskData.triggeredEnts  = self.operations[consi.operation].run(consi.parameter,taskData.selectedEnts)
		
		
		elif "OR" in consi.connector :
			taskData.triggeredEnts += self.operations[consi.operation].run(consi.parameter,taskData.triggeredEnts)
		
		
		elif "AND" in consi.connector :
			taskData.triggeredEnts  = self.operations[consi.operation].run(consi.parameter,taskData.triggeredEnts)
	
	return taskData.triggeredEnts






func parseSingleConsiderArray(taskData:Array) -> Dictionary:
	var currentConsider : Dictionary
	currentConsider["connector"] = taskData.pop_front()
	currentConsider["operation"]   = taskData.pop_front()
	currentConsider["parameter"]   = self.operations[currentConsider.operation].convertArrayToDict(taskData)
	return currentConsider 

