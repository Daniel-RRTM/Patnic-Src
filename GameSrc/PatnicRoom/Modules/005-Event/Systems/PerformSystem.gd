extends System
class_name _005_PerformSystem


func declare() -> void:
	self.name              = "_005_Perfrom,"
	self.description       = "manipulates triggered ents of selection"
	self.APIRef            = API_005_Event
	self.signalsConnection = {}
	
	self.operations = {
		 "COMP" : _004_Perform_Component
		,"COND" : _004_Perform_Condition
		,"FLAG" : _004_Perform_Flag
		,"PROP" : _004_Perform_Property
		,"UNIQ" : _004_Perform_UniqueStatmod
	}


func prepare() -> void: pass



# ----- PROCESS -------------------------------------------------------------- ##


func _operateOnParameter(taskData:Dictionary,ent) -> Array:
	if   !taskData.has("operation"): printerr("taskData for "+name+" is not set as key")
	elif !operations.keys().has(taskData.operation): printerr("Operation ["+taskData.operation+"] in System ["+name+"] not found!")
	else : return self.operations[taskData.operation].run(taskData.parameter,ent)
	return []



func parseConsiderationsToDictionaries(taskData:Array) -> Array:
	var toReturn : Array
	for consideration in taskData:
		var currentConsider : Dictionary
		
		currentConsider["typeOfCache"] = consideration.pop_front()
		currentConsider["operation"]   = consideration.pop_front()
		currentConsider["parameter"]   = self.operations[currentConsider.operation].convertArrayToDict(consideration)
		
		toReturn.append(currentConsider)
	return toReturn


