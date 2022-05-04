extends SokraTiles_Chunk_Animation
class_name Sokratiles_Chunk_Condition


# ----- INITIALICE ----------------------------------------------------------- ##

var observedEntries = []

func _ready():
	.initialice(ENUM.SOKRATILES.LAYER.CONDITION)
	Signals.connect("Actor_Turn_Finished",self,"updateMap")



# ----- SETTER --------------------------------------------------------------- ##


func addLayerEntry(ent,condClassName,index:String) -> void:
	var newEntry = { 
		"affectedEnt"  : ent,
		"conditionEnt" : ent.conditions[condClassName],
		"texture"      : index
	}
	observedEntries.append(newEntry)
	_drawCell(index,ent.pos())


func removeLayerEntry(ent) -> void:
	for i in observedEntries.size():
		var entry = observedEntries[i-1]
		if   entry.affectedEnt.get_instance_id()  == ent.get_instance_id() : observedEntries.remove(i-1)
		elif entry.conditionEnt.get_instance_id() == ent.get_instance_id() : observedEntries.remove(i-1)



# ----- SIGNAL_CALLS ------------------------------------------------------------ ##


func updateMap() -> void:
	if !observedEntries.empty():
		self.clear()
		for currentEntry in observedEntries:

			if !is_instance_valid(currentEntry.conditionEnt): 
				observedEntries.erase(currentEntry)
			else:_drawCell(currentEntry.texture,currentEntry.affectedEnt.pos())

