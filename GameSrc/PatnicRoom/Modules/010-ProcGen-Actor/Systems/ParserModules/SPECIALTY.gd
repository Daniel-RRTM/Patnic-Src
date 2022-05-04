extends Node
class_name _SPECIALTY


# ----- HUB ---------------------------------------------------------------- ##


static func run(value):
	match value.keys()[0]:
		"INDEX"                 : return getIndex(value["INDEX"])
		"FOCUSED_M_TYPE"        : return getMType(value["FOCUSED_M_TYPE"])
		"SOCIAL_HIRACHY"        : pass
		"BEHAVIOUR"             : pass
		"TIER"                  : pass



# ----- GETTER ------------------------------------------------------------- ##


static func getIndex(arrOfIndex:Array, toReturn=[]) -> Array:
	for indexName in arrOfIndex:   toReturn.append(API_001_Atlas.Specialty().getEntryByIndex(indexName))	
	return toReturn


static func getMType(arrOfMType:Array, toReturn=[]) -> Array:
	for atlasEntry in API_001_Atlas.Specialty().getEntries():
		for mTypeEntry in arrOfMType:
			if mTypeEntry == atlasEntry.getCompValue("C_37_M_TYPE"): 
				toReturn.append(atlasEntry)
	return toReturn


