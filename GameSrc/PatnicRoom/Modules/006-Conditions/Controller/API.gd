extends Node
# BOOKMARK[epic=Modules] 008_Conditions                                        
# DOCS  > Docs\API\docs\Cogsmos\democrECS\SokraTILES.md                        
# DOCS  > TO ADD                                                               

 
# ----- INITIALICER -------------------------------------------------------------- ##


func _init() -> void:   self.name = "API_001_Conditions"



# ----- GETTER -------------------------------------------------------------- ##



# ----- SETTER -------------------------------------------------------------- ##


func attachConditionToEnt(ent, condName:String, duration:int, var level:int=0) -> void: 
	_006_Condition_Attacher.run(ent,condName,duration,level)



