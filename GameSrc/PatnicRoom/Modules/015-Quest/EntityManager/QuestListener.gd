extends Node
class_name QuestListener


# ----- INIT ----------------------------------------------------------------- ##


var flag : String
var operator : String
var comparator : String
var parameter : Dictionary

var currentCounter = 0
var signals : Dictionary


# REFACTOR keine festen Variablen nutzen sondern alle als parameter:Dictionary initialisieren
func initialice(step:Dictionary) -> void:
	flag = step.flag
	operator = step.operator
	comparator = step.comparator
	parameter = step
	for key in signals.keys(): if step.flag == key: API_015_Quest.connectSignal(signals[key],self,"run")



# ----- PROCESS -------------------------------------------------------------- ##

func validateSignal(para:Dictionary)  -> bool : return true
func run(para:Dictionary)             -> void : pass
func validateQuest()                  -> bool : return false




# ----- DOC ------------------------------------------------------------------ ##


static func getAutoDoc() -> Dictionary:
	return{	 "toString"  : ""
			,"parameter" : ["","",""]
			,"list"      : [ ["","",""] , ["",""] , [-1]]
			,"signal"    : ""
			,"input"     : ""  
			}
