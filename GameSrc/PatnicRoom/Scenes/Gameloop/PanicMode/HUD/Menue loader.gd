extends Node
class_name _menueLoader


var kitInst
var charInst
var invInst  
var newsInst
var onlookInst
var parentUserInput
func _init(parentUserInputPara):
	parentUserInput = parentUserInputPara
	
	kitInst = getInstanceOfSubscene("res://Src/scenes/Gameloop/PanicMode/Subscenes/Kits Side Panel/Kits.tscn")
	charInst = getInstanceOfSubscene("res://Src/scenes/Gameloop/PanicMode/Subscenes/Monitor Side Panel/Monitor.tscn")
	invInst = getInstanceOfSubscene("res://Src/scenes/Gameloop/PanicMode/Subscenes/Inv Side Panel/Inv.tscn")  
	newsInst = getInstanceOfSubscene("res://Src/scenes/Gameloop/PanicMode/Subscenes/News Side Panel/News.tscn")
	onlookInst= getInstanceOfSubscene("res://Src/scenes/Gameloop/PanicMode/Subscenes/Onlook Sub Panel/Onlook.tscn")

func getInstanceOfSubscene(filepath):
	var loadedInfo = load(filepath)
	return loadedInfo.instance()



var possibleNodes = ["root_Kits","root_Status","root_inv","root_News"]
func replaceNode(stringOfNode):
	rmeovePreviousNode()
	match stringOfNode:
		"inv":
			parentUserInput.get_node("open Info panel").add_child(invInst)
		"kits":
			parentUserInput.get_node("open Info panel").add_child(kitInst)
		"char":
			parentUserInput.get_node("open Info panel").add_child(charInst)
		"news":
			parentUserInput.get_node("open Info panel").add_child(newsInst)
		"onlook":
			parentUserInput.get_node("Info side").add_child(onlookInst)

func rmeovePreviousNode():
	for i in possibleNodes.size():
		if parentUserInput.get_node("open Info panel").has_node(possibleNodes[i]):
			parentUserInput.get_node("open Info panel").remove_child(parentUserInput.get_node("open Info panel").get_node(possibleNodes[i]))





















