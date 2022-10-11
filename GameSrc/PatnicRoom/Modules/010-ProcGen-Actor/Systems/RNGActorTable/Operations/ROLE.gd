extends Node
class_name _ROLE


# ----- HUB ---------------------------------------------------------------- ##


static func run(value):
	match value.keys()[0]:
		"INDEX"                 : return API_001_Atlas.Role().getEntry(value["INDEX"])
		"FOCUSED_M_TYPE"        : return getMType(value["FOCUSED_M_TYPE"])
		"PREFERD_CHUNK_KEYWORD" : pass



# ----- GETTER ------------------------------------------------------------- ##


static func getIndex(arrOfIndex:Array, toReturn=[]) -> Array:
	for indexName in arrOfIndex:   toReturn.append(API_001_Atlas.Role().getEntryByIndex(indexName))	
	return toReturn


static func getMType(arrOfMType:Array, toReturn=[]) -> Array:
	for atlasEntry in API_001_Atlas.Specialty().getEntries():
		for mTypeEntry in arrOfMType:
			if mTypeEntry == atlasEntry.getCompValue("C_37_M_TYPE"): 
				toReturn.append(atlasEntry)
	return toReturn


