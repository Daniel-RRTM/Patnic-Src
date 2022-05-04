extends System
class_name _007_UniqueStatModsSystem


func declare() -> void:
	self.name              = "_007_UniqueStatMod"
	self.description       = "Operations for the Perform concept of Events"
	self.APIRef            = API_007_Statmod
	
	self.signalsConnection = {   
		"API_007_runUniqueStatMods" : "runTasks"   
	}
	
	self.operations  = {
		"DEAL_PLAIN_DAMAGE"       :  _007_001_DEAL_PLAIN_DAMAGE  ,
		"SPAWN_TILE_AROUND"       :  _007_005_SPAWN_TILE_AROUND  ,
		"EXCHANGE_TEXTURE"        :  _007_003_EXCHANGE_TEXTURE   ,
		"MOVE_SELECT"             :  _007_004_MOVE_SELECT        ,
		"SPAWN_TILE"              :  _007_006_SPAWN_TILE         ,
	}


func prepare() -> void:
	self.APIRef._statmodindex = self.operations


