extends Node

#nodename,Textinhalt,upperLeft
var MenuepointsAttributes={
	0:["load","load last game",1500,575],
	1:["start","start new game",1500,775],
	2:["credits","credits",1500,900],
	3:["options","options",1500,841],
	4:["introduction","introduction",1500,913],
	5:["news","news",1500,1000],
}

var creditsInst
var introInst
var newsInst
var patchInst
var personalInst
var createInst
# FUNC _ready() -> void:
	#creditsInst = getInstanceOfSubscene("res://Src/scenes/Unique/Titlescreen/SubScene/credits.tscn")
	#introInst = getInstanceOfSubscene("res://Src/scenes/Unique/Titlescreen/SubScene/Introduction.tscn")
	#newsInst = getInstanceOfSubscene("res://Src/scenes/Unique/Titlescreen/SubScene/News.tscn")
	#patchInst = getInstanceOfSubscene("res://Src/scenes/Unique/Titlescreen/SubScene/Patchnotes.tscn")
	#personalInst = getInstanceOfSubscene("res://Src/scenes/Unique/Titlescreen/SubScene/personal.tscn")
	#createInst = getInstanceOfSubscene("res://Src/scenes/Unique/Titlescreen/SubScene/create new game/create new game.tscn")



func initialice():
	for i in MenuepointsAttributes.size():
		initNode(MenuepointsAttributes[i])

func initNode(nodeDictEntry):
	var node = TextInputField.new(nodeDictEntry)
	add_child(node)

func getInstanceOfSubscene(filepath):
	var loadedInfo = load(filepath)
	return loadedInfo.instance()



func manageSubscreens(textName):
	var menuepointToLoad
	match textName:
		"load":
			pass
		"start":
			replaceNode("root_Create")
		"credits":
			replaceNode("root_Credits")
		"options":
			pass
		"credits":
			replaceNode("root_Credits")
		"news":
			replaceNode("root_News")
		"introduction":
			replaceNode("root_Introduction")



var possibleNodes = ["root_Credits","root_Introduction","root_News","root_Personal","root_Create"]
func replaceNode(stringOfNode):
	removeAllNodes()
	
	match stringOfNode:
		"root_Credits":
			get_parent().get_node("open Info panel").add_child(creditsInst)
		"root_Introduction":
			get_parent().get_node("open Info panel").add_child(introInst)
		"root_News":
			get_parent().get_node("open Info panel").add_child(newsInst)
			get_parent().get_node("open Info panel").add_child(patchInst)
		"root_Patchnodes":
			get_parent().get_node("open Info panel").add_child(patchInst)
		"root_Personal":
			get_parent().get_node("open Info panel").add_child(personalInst)
		"root_Create":
			get_parent().get_node("open Info panel").add_child(createInst)

func removeAllNodes():
	for i in possibleNodes.size():
		if get_parent().get_node("open Info panel").has_node(possibleNodes[i]):
			get_parent().get_node("open Info panel").remove_child(get_parent().get_node("open Info panel").get_node(possibleNodes[i]))

