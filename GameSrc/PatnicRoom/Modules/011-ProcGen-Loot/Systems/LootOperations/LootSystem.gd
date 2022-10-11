extends System
class_name _005_LootSystem


func declare() -> void:
	self.name              = "_0011_Valuables"
	self.description       = "generates random Valuables"
	self.APIRef            = API_011_ProcGen_Loot
	self.signalsConnection = {}
	self.operations        = {
		  "VALUABLES"      : _API_011_Loot_Valuables
	}

func prepare() -> void: pass


func valuables() -> _API_011_Loot_Valuables : return operations["VALUABLES"]



# ----- PROCESS -------------------------------------------------------------- ##

