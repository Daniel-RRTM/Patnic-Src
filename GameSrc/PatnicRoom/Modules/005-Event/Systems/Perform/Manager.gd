extends System
class_name _005_PerformSystem


func declare() -> void:
	self.name              = "_005_PerformSystem"
	self.description       = "manipulates triggered ents of selection"
	self.APIRef            = API_005_Event
	self.signalsConnection = {}
	self.operations        = {
		 "COMP"            : _004_Perform_Component
		,"COND"            : _004_Perform_Condition
		,"FLAG"            : _004_Perform_Flag
		,"PROP"            : _004_Perform_Property
		,"UNIQ"            : _004_Perform_UniqueStatmod
		,"CMD"             : _004_Perform_Commando
		,"PASSIVE"         : _004_Perform_Passive
		,"MSG"             : _004_Perform_Msg
	}


func prepare() -> void: pass


func uniq()    -> _004_Perform_UniqueStatmod : return operations["UNIQ"] 
func cmd()    -> _004_Perform_UniqueStatmod  : return operations["CMD"] 
func cond()    -> _004_Perform_Condition     : return operations["COND"] 
func comp()    -> _004_Perform_Component     : return operations["COMP"] 
func prop()    -> _004_Perform_Property      : return operations["PROP"] 
func passive() -> _004_Perform_Passive       : return operations["PASSIVE"]
func flag()    -> _004_Perform_Flag          : return operations["FLAG"] 
func msg()     -> _004_Perform_Msg           : return operations["MSG"] 



# ----- PROCESS -------------------------------------------------------------- ##


func _operateOnParameter(taskData:Dictionary,ent) -> Array:
	if   !taskData.has("operation"): printerr("taskData for "+name+" is not set as key")
	elif !operations.keys().has(taskData.operation): printerr("Operation ["+taskData.operation+"] in System ["+name+"] not found!")
	else : return self.operations[taskData.operation].run(taskData.parameter,ent)
	return []


func parseConsiderationsToDictionaries(taskData:Array) -> Array:
	var toReturn : Array
	for consideration in taskData:			
		toReturn.append(parseSinglePerformArray(consideration))
	return toReturn


func parseSinglePerformArray(taskData:Array) -> Dictionary:
	var currentConsider : Dictionary
	currentConsider["typeOfCache"] = taskData.pop_front()
	currentConsider["operation"]   = taskData.pop_front()
	currentConsider["parameter"]   = self.operations[currentConsider.operation].convertArrayToDict(taskData)
	return currentConsider 

