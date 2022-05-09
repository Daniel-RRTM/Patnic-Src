extends System
class_name _005_MediumSystem


func declare() -> void:
	self.name              = "_005_Medium,"
	self.description       = "applies the shape of selections on source(s)"
	self.APIRef            = API_005_Event
	self.signalsConnection = {}
	
	self.operations = {
		 "AREA"   : _004_Seize_MediumArea
		,"LINEA"  : _004_Seize_MediumLinea
		,"SELECT" : _004_Seize_MediumSelect
		,"SELF"   : _004_Seize_MediumSelf
	}


func prepare() -> void: pass



# ----- PROCESS -------------------------------------------------------------- ##


func operateOnParameter(taskData:Dictionary) -> Array:
	if   !taskData.has("source"): printerr("taskData[source] for "+name+" is not set as key")
	elif !taskData.has("medium"): printerr("taskData[medium] for "+name+" is not set as key")
	elif !taskData.has("reach"): printerr("taskData[reach] for "+name+" is not set as key")
	elif !operations.keys().has(taskData.medium): printerr("Operation ["+taskData.medium+"] in System ["+name+"] not found!")
	else : return self.operations[taskData.medium].run(taskData)
	return []


