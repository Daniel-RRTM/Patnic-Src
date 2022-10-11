extends QuestListener
class_name _015_001_Kill


# ----- OPERTATION ----------------------------------------------------------- ##



# REFACTOR keine festen Variablen nutzen sondern alle als parameter:Dictionary initialisieren
func run(para:Dictionary) -> void:
	for currentFlag in para.flags :   if currentFlag == parameter.flags :   currentCounter += 1

func validateQuest() -> bool:
	if   comparator == "MIN" :   return currentCounter >= int(parameter.comparator)
	elif comparator == "MAX" :   return currentCounter <= int(operator)
	return false



# ----- DOC ------------------------------------------------------------------ ##

func toStr() -> String: return "KILL "+comparator+" with "+flag

static func getAutoDoc() -> Dictionary:
	return{	 "toString"  : "Kill"
			,"input"     : "KILL"
			,"parameter" : ["F_WANTED...","LIMIT","SUM"]
			,"list"      : [["F_WANTED_SINLES","F_WANTED_SPIRIT","F_WANTED_PERSONA","F_WANTED_ANIMAL","F_WANTED_CRITTER","F_WANTED_PARA_CRITTER"],["MIN","MAX"],[range(0,100)]]
			,"signal"    : {
				"KILL" : "Wanted_Actor_Killed"
			}
		}

