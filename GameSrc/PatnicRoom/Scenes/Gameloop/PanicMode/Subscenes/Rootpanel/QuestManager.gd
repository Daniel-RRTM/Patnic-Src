extends Control


var cachedQuests :Array


func _ready():
	Signals.connect("Player_Turn_Started",self,"printAllQUest")
	for panel in get_children()  : clearQuestPanel(panel)
	
	for quest in API_003_Player.getAllQuests():
		var dict = {"toStr":[]}
		if   quest.quest().hasFlag("F_19_UNIVERSAL_QUEST") : dict["type"] = "Order"
		elif quest.quest().hasFlag("F_20_SPECIFIC_QUEST")  : dict["type"] = "Task"
		elif quest.quest().hasFlag("F_21_FAVOR_QUEST")     : dict["type"] = "Flavor"
		dict["name"] = quest.connection().getCompValue("C_6_NAME")
		for listen in quest.listener: dict["toStr"].append({"desc":listen.toStr(), "of":listen.comparator})
		cachedQuests.append(dict)



func printAllQUest():
	for i in range(0,3):
		var node = get_node(str(i))
		var quest = cachedQuests[i]
		
		node.get_node("Connection").bbcode_text = quest.name
		node.get_node("Type").bbcode_text       = getType(quest.type)
		
		for j in quest.toStr.size():
			var step = node.get_node("Steps/"+str(j))
			step.get_node("Of").bbcode_text = quest.toStr[j].of
			step.get_node("Out").bbcode_text = str(API_003_Player.getAllQuests()[i].listener[j].currentCounter)
			step.get_node("desc").bbcode_text = getDesc(step)+API_003_Player.getAllQuests()[i].quest.getCompValue("C_0_DESCRIPTION")#toStr[j].desc


func clearQuestPanel(panel:Control) -> void:
	panel.get_node("Type").bbcode_text = ""
	panel.get_node("Connection").bbcode_text = ""
	for step in panel.get_node("Steps").get_children():  
		for node in ["desc","Of","Out"]: 
			step.get_node(node).bbcode_text = ""




func getType(type) -> String:
	match type:
		"Order" : return "[color=green]"+type
		"Task"  : return "[color=yellow]"+type
		"Favor" : return "[color=red]"+type
	return ""

func getDesc(step)-> String:
	if step.get_node("Out").bbcode_text == step.get_node("Of").bbcode_text: return "[color=green]"
	return ""

