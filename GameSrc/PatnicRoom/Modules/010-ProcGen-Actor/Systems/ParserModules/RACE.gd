extends Node
class_name _RACE


# ----- HUB ---------------------------------------------------------------- ##


static func run(value):
	match value.keys()[0]:
		"INDEX"                 : return getIndex(value["INDEX"])
		"PREFERD_CHUNK_KEYWORD" : pass



# ----- GETTER ------------------------------------------------------------- ##


static func getIndex(arrOfIndex:Array, toReturn=[]) -> Array:
	for indexName in arrOfIndex:   toReturn.append(API_001_Atlas.Race().getEntryByIndex(indexName))	
	return toReturn


