extends System
class_name _007_UniqueStatModsSystem


func declare() -> void:
	self.name                = "_007_UniqueStatModsSystem"
	self.description         = "Operations for the Perform concept of Events"
	self.APIRef              = API_007_Statmod
	self.signalsConnection   = {}
	self.operations          = {
		 "DEAL_PLAIN_DAMAGE" : _007_001_DEAL_PLAIN_DAMAGE
		,"SPAWN_TILE_AROUND" : _007_005_SPAWN_TILE_AROUND
		,"EXCHANGE_TEXTURE"  : _007_003_EXCHANGE_TEXTURE
		,"MOVE_SELECT"       : _007_004_MOVE_SELECT
		,"SPAWN_TILE"        : _007_006_SPAWN_TILE
		,"DROP_LOOT_FILTER"  : _007_007_DROP_LOOT_FILTER
	}


func prepare() -> void: pass


func dealPlainDamage() -> _007_001_DEAL_PLAIN_DAMAGE : return operations["DEAL_PLAIN_DAMAGE"]
func dropLootFilter()  -> _007_005_SPAWN_TILE_AROUND : return operations["SPAWN_TILE_AROUND"]
func exchangeTexture() -> _007_003_EXCHANGE_TEXTURE  : return operations["EXCHANGE_TEXTURE"]
func spawnTileAround() -> _007_006_SPAWN_TILE        : return operations["SPAWN_TILE"]
func spawnTile()       -> _007_007_DROP_LOOT_FILTER  : return operations["DROP_LOOT_FILTER"]
func moveTile()        -> _007_004_MOVE_SELECT       : return operations["MOVE_SELECT"]



# ----- PROCESS -------------------------------------------------------------- ##

