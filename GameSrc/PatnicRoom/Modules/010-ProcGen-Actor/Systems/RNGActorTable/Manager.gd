extends System
class_name _010_ActorAttributesSystem


func declare() -> void:
	self.name               = "_010_ActorAttributesSystem"
	self.description        = "Operations are called by the F3-Cheatmenue"
	self.APIRef             = API_010_ProcGen_Actor
	self.signalsConnection  = {}
	self.operations         = {
		 "RACE"             : _RACE
		,"ROLE"             : _ROLE
		,"SPECIALTY"        : _SPECIALTY
	}


func prepare() -> void:pass


func specialty() -> _SPECIALTY : return operations["SPECIALTY"]
func race()      -> _RACE      : return operations["RACE"]
func role()      -> _ROLE      : return operations["ROLE"]



# ----- PROCESS -------------------------------------------------------------- ##

