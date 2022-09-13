extends Control



func loadKitpartByIndex(kitPartIndex:String) -> void:
	var cache = API_001_Atlas.KitParts().getEntry(kitPartIndex).event()
	setSeize(cache["SELECT"]["SEIZE"])
	setConsider(cache["SELECT"]["CONSIDER"])
	setPerform(cache["RUN"]["PERFORM"])




func setSeize(event:Dictionary) -> void :
	get_node("Space/Medium/ContentPanel/Text").text = event["MEDIUM"]
	get_node("Space/Source/ContentPanel/Text").text = event["SOURCE"]
	get_node("Space/Reach/ContentPanel/Text").text  = event["REACH"]



func setConsider(event:Array) -> void :
	for nr in event.size():
		var cache = event[nr].duplicate(true)
		var row   = get_node("Trigger/List/Row"+str(nr))
		
		row.get_node("Upper/RTL").text = cache["connector"]
		row.get_node("Middle/RTL").text = cache["operation"]
		
		var para = cache["parameter"].values()
		para.invert()
		for value in para:
			row.get_node("Lower/RTL").text += str(value)+"  "



func setPerform(event:Array) -> void :
	for nr in event.size():
		var cache = event[nr].duplicate(true)
		var row   = get_node("Effect/List/Row"+str(nr))
		
		row.get_node("Upper/RTL").text = cache["typeOfCache"]
		row.get_node("Middle/RTL").text = cache["operation"]
		
		row.get_node("Lower/RTL").text = cache["parameter"]["type"]+" "
		for value in cache["parameter"]["parameter"]:
			row.get_node("Lower/RTL").text += value+"  "


