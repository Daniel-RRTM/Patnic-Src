extends Control


onready var desc = get_node("Info/Item") 
onready var type = get_node("Info/Type") 
onready var subType = get_node("Info/SubType") 
onready var rarity = get_node("Info/Rarity") 
onready var stocks = get_node("Info/Stocks")


onready var total = get_node("Control/Total/Value")


var sum
func insert(object) -> void:
	object = object.values()
	sum = 0
	for node in [type,subType,rarity,stocks]:
		var currentPair = object.pop_front()
		node.get_node("Value").bbcode_text = str(currentPair[0])
		node.get_node("Price").bbcode_text = "[color=yellow]"+str(currentPair[1])
		
		sum += currentPair[1]
	
	total.bbcode_text = "[color=red]"+str(sum)





func _on_Cancel_pressed():
	get_node("..").toSell = {   "object":null , "mode":null   }
	self.visible = false


func _on_Confirm_pressed():
	get_node("..").sell(sum)
	self.visible = false
