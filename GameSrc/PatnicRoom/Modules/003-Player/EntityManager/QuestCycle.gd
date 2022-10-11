extends Node
class_name _005_Common_QuestCycle


# REFACTOR DYNAMISCH SCHREIBEN

var atlas = {
	"Meat":{
		"Connection" : "",
		"Order"      :{   "ent":"" , "finished":false , "active":false  },
		"Task"       :{   "ent":"" , "finished":false , "active":false  },
		"FavorL"     :{   "ent":"" , "finished":false , "active":false  },
		"FavorR"     :{   "ent":"" , "finished":false , "active":false  }
		},
	"Matrix":{
		"Connection" : "",
		"Order"      :{   "ent":"" , "finished":false , "active":false  },
		"Task"       :{   "ent":"" , "finished":false , "active":false  },
		"FavorL"     :{   "ent":"" , "finished":false , "active":false  },
		"FavorR"     :{   "ent":"" , "finished":false , "active":false  }
		},
	"Magic":{
		"Connection" : "",
		"Order"      :{   "ent":"" , "finished":false , "active":false  },
		"Task"       :{   "ent":"" , "finished":false , "active":false  },
		"FavorL"     :{   "ent":"" , "finished":false , "active":false  },
		"FavorR"     :{   "ent":"" , "finished":false , "active":false  }
	}
}


func initialiceBySavedJson(dict:Dictionary):
	var questsActive = 0
	for mType in dict.keys():
		addConnection(mType,API_001_Atlas.Connection().getEntry(dict[mType]["Connection"]))
		
		for questType in ["Order","Task","FavorL","FavorR"]:
			setCompletion(mType,questType,dict[mType][questType]["finished"])
			var state = dict[mType][questType]["active"]
			setActive(mType,questType,state)
			
			var entryIndex = dict[mType][questType]["ent"]
			if entryIndex != "" : addQuest(mType,questType,API_001_Atlas.Quest().getEntry(entryIndex))
			else                : addQuest(mType,questType,entryIndex)
			
			if state: questsActive = beginQuest(mType,questType,questsActive)



func addQuest(mType:String, type:String, quest:Entity)      -> void : atlas[mType][type]["ent"] = quest 
func addConnection(mType:String, connection:Entity)         -> void : atlas[mType]["Connection"] = connection
func setCompletion(mType:String, type:String, state:bool)   -> void : atlas[mType][type]["finished"] = state
func setActive(mType:String, type:String, state:bool)       -> void : atlas[mType][type]["active"] = state

func beginQuest(mType:String, type:String, compNr:int) -> int :
	var questListener = atlas[mType][type]["ent"]
	var connection    = atlas[mType]["Connection"]
	var lootFilter    = questListener
	API_003_Player.getAllQuests()[compNr].initialice(questListener,connection,lootFilter,mType,type) # REFACTOR CACHED VARS IN DIE INITIALISIERUNG VERSCHIEBEN
	return compNr+1




func isFavorNoSided(mType:String) -> bool : 
	return !atlas[mType]["FavorL"]["finished"] and !atlas[mType]["FavorR"]["finished"]

func isFavorDoubleSided(mType:String) -> bool : 
	return atlas[mType]["FavorL"]["finished"] and atlas[mType]["FavorR"]["finished"]

func isFavorOneSided(mType:String) -> bool : 
	var first  = atlas[mType]["FavorL"]["finished"] and !atlas[mType]["FavorR"]["finished"]
	var second = atlas[mType]["FavorR"]["finished"] and !atlas[mType]["FavorL"]["finished"]
	return  first or second




