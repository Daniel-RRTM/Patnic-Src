extends System
class_name _005_MediumSystem


func declare() -> void:
	self.name              = "_005_MediumSystem,"
	self.description       = "applies the shape of selections on source(s)"
	self.APIRef            = API_005_Event
	self.signalsConnection = {}
	self.operations        = {
		 "AREA"            : _004_Seize_MediumArea
		,"LINEA"           : _004_Seize_MediumLinea
		,"SELECT"          : _004_Seize_MediumSelect
		,"UNIVERSAL"       : _004_Seize_MediumUniversal
		,"QUAD"            : _004_Seize_MediumQuad
		,"CONE"            : _004_Seize_MediumCone
		,"SELF"            : _004_Seize_MediumSelf
	}


func prepare() -> void : pass


func mediumSelf() -> _004_Seize_MediumSelf      : return operations["SELF"] 
func universal()  -> _004_Seize_MediumUniversal : return operations["UNIVERSAL"] 
func select()     -> _004_Seize_MediumSelect    : return operations["SELECT"] 
func linea()      -> _004_Seize_MediumLinea     : return operations["LINEA"] 
func area()       -> _004_Seize_MediumArea      : return operations["AREA"] 
func quad()       -> _004_Seize_MediumQuad      : return operations["QUAD"] 
func cone()       -> _004_Seize_MediumCone      : return operations["CONE"] 



# ----- PROCESS -------------------------------------------------------------- ##


func operateOnParameter(taskData:Dictionary) -> Array:
	if   !taskData.has("source"): printerr("taskData[source] for "+name+" is not set as key")
	elif !taskData.has("medium"): printerr("taskData[medium] for "+name+" is not set as key")
	elif !taskData.has("reach"): printerr("taskData[reach] for "+name+" is not set as key")
	elif !operations.keys().has(taskData.medium): printerr("Operation ["+taskData.medium+"] in System ["+name+"] not found!")
	else : return self.operations[taskData.medium].run(taskData)
	return []

