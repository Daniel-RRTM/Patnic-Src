extends Control



func loadKitpartByIndex(kitPartIndex:String) -> void:
	var cache = API_001_Atlas.KitParts().getEntry(kitPartIndex).event().main()
	setSeize(cache)
	setConsider(cache)
	setPerform(cache)




func setSeize(event:Dictionary) -> void :
	var space = get_node("Space")
	space.get_node("Medium/TagPanel/text").text     = event["SELECT"]["SEIZE"][0][0]
	space.get_node("Medium/ContentPanel/text").text = event["SELECT"]["SEIZE"][0][1]
	space.get_node("Source/TagPanel/text").text     = event["SELECT"]["SEIZE"][1][0]
	space.get_node("Source/ContentPanel/text").text = event["SELECT"]["SEIZE"][1][1]
	space.get_node("Reach/TagPanel/text").text      = event["SELECT"]["SEIZE"][2][0]
	space.get_node("Reach/ContentPanel/text").text  = event["SELECT"]["SEIZE"][2][1]


func setConsider(event:Dictionary) -> void :
	for nr in event["SELECT"]["CONSIDER"].size():
		var consideration = event["SELECT"]["CONSIDER"][nr]
		var cache = consideration.duplicate(true)
		
		var row = get_node("Trigger/List/row"+str(nr))
		row.get_node("Upper/RTL").text = cache.pop_front()
		row.get_node("Middle/RTL").text = cache.pop_front()
		
		for value in cache:
			row.get_node("Lower/RTL").text += value+"  "



func setPerform(event:Dictionary) -> void :
	for nr in event["RUN"]["PERFORM"].size():
		var effect = event["RUN"]["PERFORM"][nr]
		var cache = effect.duplicate(true)
		
		var row = get_node("Effect/List/row"+str(nr))
		row.get_node("Upper/RTL").text = cache.pop_front()
		row.get_node("Middle/RTL").text = cache.pop_front()
		
		for value in cache:
			row.get_node("Lower/RTL").text += value+" "


