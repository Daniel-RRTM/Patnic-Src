extends Node
class_name _005_Common_Quests


# ----- INITIALICE ----------------------------------------------------------- ##


var player : Entity
var connection : Entity

var quest : Entity
var listener : Array
var lootFilter : Entity

var mType: String
var type: String

# REFACTOR EVTL NICHT ALLE NÖTIG

func initialice(questPara:Entity, connectionPara:Entity, lootFilterPara:Entity,mTypePara,typePara) -> void:
	player = API_003_Player.currentChar
	lootFilter = lootFilterPara
	connection = connectionPara
	quest = questPara
	mType = mTypePara
	type = typePara
	var listenerComp = questPara.getCompValue("C_53_LISTENER")
	for type in listenerComp.keys():
		if type != "PERFORM":
			for step in listenerComp[type]:
				listener.append(API_015_Quest.instanciateNewListener(type,step))



# ----- GETTER --------------------------------------------------------------- ##


func connection()           -> Entity : return connection
func lootFilter()           -> Entity : return lootFilter
func quest()                -> Entity : return quest

func getAllListener()       -> Array  : return listener
func hasListenerNr(x:int)   -> bool   : return is_instance_valid(listener[x])
func getListenerNr(x:int)             : return listener[x]


