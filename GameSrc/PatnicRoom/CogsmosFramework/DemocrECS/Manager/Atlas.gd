extends Object
class_name DemokrECTS_Atlas

# VAR > indexComponent : Instance of Entity                       
var atlasEntry : Dictionary
# VAR > entry.indexComponent.value : Array of all Comp.name       
var entryComponentRef : Dictionary
# VAR > Entity child (i.e. TileEntity)                            
var classOfEntries

  

# ----- GETTER --------------------------------------------------------------- ##

# FUNC returns ALL, use getEntry() for specific            
# FUNC Dict uses [indexComponent] : [Instance of Entity]   
func getEntries() -> Dictionary: 
	return atlasEntry 


# FUNC index is value of C_12_ATLAS_INDEX   
func getEntry(index:String) -> Entity: 
	return atlasEntry[index] as Entity


func getEntriesWithComp(compname:String):
	var validEnts : Array
	for entry in entryComponentRef:   
		if entry.has(compname) : validEnts.append(atlasEntry[entry]) 
	return validEnts


# FUNC searchedTerm is dynamic typed   
func getEntriesWithCompValue(searchedTerm,compname:String) -> Array:
	var validEnts : Array
	for entry in getEntriesWithComp(compname):
		if entry.getCompValue(compname) == searchedTerm : validEnts.append(entry) 
	return validEnts



# ----- SETTER --------------------------------------------------------------- ##


func addEntity(ent,compIndex="C_12_ATLAS_INDEX"):
	if ent is classOfEntries:
		if !atlasEntry.has(ent):
			
			var index                = ent.getCompValue(compIndex)
			atlasEntry[index]        = ent
			entryComponentRef[index] = ent.components.keys()
		
		else: printerr("Error in Atlas_TileEntity! ["+str(ent.name())+"] already exists")
	else: printerr("Error in Atlas_TileEntity! ["+(ent.name())+"] could not be added")


