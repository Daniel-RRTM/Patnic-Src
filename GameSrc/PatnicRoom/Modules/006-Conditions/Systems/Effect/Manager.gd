extends System
class_name _006_EffectSystem


func declare() -> void:
	self.name              = "_006_EffectSystem,"
	self.description       = "runs custome function for affected ent each round"
	self.APIRef            = API_006_Condition
	self.signalsConnection = {}
	self.operations        = {
		 "affecting"       : _004_Seize_MediumArea
		,"constraining"    : _004_Seize_MediumLinea
		,"spreading"       : _004_Seize_MediumSelect
	}


func prepare() -> void: pass


func constraining() -> _006_EFFECTS_CONSTRAINT : return operations["constraining"] 
func affecting()    -> _006_EFFECTS_AFFECTING  : return operations["affecting"] 
func spreading()    -> _006_EFFECTS_SPREADING  : return operations["spreading"] 



# ----- PROCESS -------------------------------------------------------------- ##


func operateOnParameter(taskData:Dictionary) -> Array:
	if   !taskData.has("source"): printerr("taskData[source] for "+name+" is not set as key")
	elif !taskData.has("medium"): printerr("taskData[medium] for "+name+" is not set as key")
	elif !taskData.has("reach"): printerr("taskData[reach] for "+name+" is not set as key")
	elif !operations.keys().has(taskData.medium): printerr("Operation ["+taskData.medium+"] in System ["+name+"] not found!")
	else : return self.operations[taskData.medium].run(taskData)
	return []

