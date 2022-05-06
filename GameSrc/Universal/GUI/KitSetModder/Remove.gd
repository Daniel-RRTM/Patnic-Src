extends Button



func _on_press(kitPartEnum,modeEnum):
	if kitPartEnum == ENUM.KITS.PARTS.BASE and modeEnum == ENUM.KITS.STATION_MODE.REMOVE: clearSlot()
	else:   
		API_003_Player.stationSetter.setMode(modeEnum)
		selectKitPartToAdd(kitPartEnum)


func selectKitPartToAdd(kitPartEnum):
	var kitPartsToShow = []
	
	var allKitParts = API_003_Player.currentChar.kitventory().kitparts().getAll()
	var kitsetToBuild = get_parent().get_parent().get_parent().get_node("parent").kitSetEnt
	
	for kitpart in allKitParts:
		var test = [kitpart.family(),kitsetToBuild.base.family(),kitpart.partType()]
		if  kitpart.family() == kitsetToBuild.base.family() and kitPartEnum == kitpart.partType():
			kitPartsToShow.append(kitpart)
			
	get_parent().get_parent().get_parent().get_parent().get_node("BuilldSelection/ScrollContainer").loadItems(kitPartsToShow)
	get_parent().get_parent().get_parent().get_parent().get_node("BuilldSelection").visible =true




func clearSlot():
	API_003_Player.getCurrent_005_Common_Stationetter().setOnDefault()
	
	var cache = API_003_Player.getCurrentStation().kitset.toString
	API_003_Player.removeGearedKitSet(cache)
	API_003_Player.append_005_Common_Kitventory(cache)
	
	get_parent().get_parent().get_node("kitset_overview/parent").resetKitPart()
	get_parent().get_parent().loadPlayerGearedKitsets()
	get_parent().get_parent().get_parent().visible = false
