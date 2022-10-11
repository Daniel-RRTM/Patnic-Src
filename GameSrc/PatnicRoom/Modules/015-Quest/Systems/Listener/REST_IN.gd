extends QuestListener
class_name _015_002_RestIn


# ----- OPERTATION ----------------------------------------------------------- ##


func run(para:Dictionary) -> void:
	if flag == "STEPS"   : currentCounter += 1
	if flag == "KIT_USE" : currentCounter += 1

# REFACTOR ALS WORKFLOW
# REFACTOR keine festen Variablen nutzen sondern alle als parameter:Dictionary initialisieren
func validateQuest() -> bool:
	if   comparator == "MIN" :   return currentCounter >= int(operator)
	elif comparator == "MAX" :   return currentCounter <= int(operator)
	return false



# ----- DOC ------------------------------------------------------------------ ##

func toStr() -> String: return "REST with "+operator+" "+comparator+" "+getAutoDoc()["signal"][flag]

static func getAutoDoc() -> Dictionary:
	return{	 "toString"  : "When Resting"
			,"input"     : "REST_WITH"
			,"list"      : [["MAX","MIN"],[100]]
			,"parameter" : ["LIMIT","SUM"]
			,"signal"    : {
				"STEPS" : "Player_Walked_Step",
				"KIT_USE" : "Player_Used_Kit",
			}
		}
