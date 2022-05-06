extends Node2D



var root

func initialice(ent,pos,rootPara):
	root = rootPara

	var baseNode = .get_node("Stat")
	var entData = getDataToFill(ent)
	
	get_node("Title/name").bbcode_text = "You are looking at... [color=yellow]"+entData["NAME"]
	get_node("Stat/1/value").bbcode_text = entData["DESC"]
	get_node("Stat/2/value").bbcode_text = "[color=yellow]"+str(entData["WALKABLE"])
	
	if ent is ActorEntity:
		get_node("Stat/2/name").bbcode_text = "Race"
		get_node("Stat/3/name").bbcode_text = "Role"
		get_node("Stat/4/name").bbcode_text = "Specialty"
		get_node("Stat/2/value").bbcode_text = "[color=yellow]"+str(entData["RACE"])
		get_node("Stat/3/value").bbcode_text = "[color=yellow]"+str(entData["ROLE"])
		get_node("Stat/4/value").bbcode_text = "[color=yellow]"+str(entData["SPECIALTY"])
	
	for propNr in ent.properties:
		var propToString = PROPERTIES.OF.keys()[propNr]
		get_node("Stat/9/value").bbcode_text += propToString.to_lower()+", "
		
		
	
	
	
	self.visible = true
	self.global_position = pos







func getDataToFill(ent) -> Dictionary:
	var toReturn={}
	
	if ent is TileEntity: 
		toReturn["NAME"] = ent.name() 
		toReturn["WALKABLE"] = ent.isWalkable() 
		toReturn["DESC"] = ent.description()
	
	if ent is InteractEntity: 
		toReturn["NAME"] = ent.name()     
		toReturn["WALKABLE"] = ent.isWalkable() 
		toReturn["DESC"] = ent.description()
	
	if ent is ActorEntity: 
		toReturn["NAME"] = ent.synonym()
		toReturn["WALKABLE"] = false 
		toReturn["DESC"] = ""
		toReturn["RACE"] = ent.getCompTempValue("race","C_6_NAME")
		toReturn["ROLE"] = ent.getCompTempValue("role","C_6_NAME")
		toReturn["SPECIALTY"] = ent.getCompTempValue("specialty","C_6_NAME")
		
	
	return toReturn











func _input(event) -> void:
	if !Utils.node().isMouseOnNode(self.get_node("panel")):
		self.queue_free()
