extends Node
# BOOKMARK[epic=Modules] 009_Stat_Mods                                         
# DOCS  > Docs\API\docs\Cogsmos\democrECS\SokraTILES.md                        
# DOCS  > TO ADD                                                               
 
 
# ----- INITIALICER -------------------------------------------------------------- ##


var _statmodindex : Dictionary
var uniqueStatModsSystem : _007_UniqueStatModsSystem


func _ready() :
	self.name            = "API_019_EffectStatmods"
	uniqueStatModsSystem = _007_UniqueStatModsSystem.new()



# ----- GETTER ------------------------------------------------------------------- ##


func getStatModNames()                  -> Array      :   return SYNTAX.EVENT.STAT_MODS.keys()
func getStatMods()                      -> Dictionary :   return SYNTAX.EVENT.STAT_MODS


# ----- RUN ---------------------------------------------------------------------- ##


func manageUniqueStatmod(ent, statmodName:String, modValue) -> void:
	uniqueStatModsSystem.addTask(statmodName,modValue,ent)
	Signals.emit_signal("API_007_runUniqueStatMods")
	#if is_instance_valid(ent): _statmodindex.EFFECT_UNIQUE_STATMOD[statmodName].run(ent,modValue)




