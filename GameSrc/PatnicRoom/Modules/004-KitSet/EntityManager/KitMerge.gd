extends Node
class_name _008_KitSetMerger


# ----- MAIN --------------------------------------------------------------------- ##

# REFACTOR             

func mergeKitParts(kitparts:Array) -> KitSetEntity :
	var kitSetEnt = KitSetEntity.new()

	for part in kitparts:
		if is_instance_valid(part) :
			if   part.hasFlag("F_15_KITPART_TYPE_BASE"):
				kitSetEnt.base = part
			
			if part.hasFlag("F_16_KITPART_TYPE_MOD"):
				kitSetEnt.mod = part
			
			if part.hasFlag("F_17_KITPART_TYPE_APPENDIX") :   
				kitSetEnt.appendix = part
	
	
	kitSetEnt.toString = getToString(kitSetEnt)
	kitSetEnt.event = kitSetEnt.base.event().duplicate(true)
	kitSetEnt.cooldownTime = kitSetEnt.base.cooldownTime()

	if is_instance_valid(kitSetEnt.mod):
		kitSetEnt.event = loadModPart(kitSetEnt)
		kitSetEnt.cooldownTime += kitSetEnt.mod.cooldownTime()
	
	if is_instance_valid(kitSetEnt.appendix) :   pass
	
	kitSetEnt.currentCooldownTime = kitSetEnt.cooldownTime
	return kitSetEnt




func loadModPart(kitSetEnt:KitSetEntity) -> Dictionary :
	var event = kitSetEnt.getMergedEvent().duplicate(true)
	for mode in kitSetEnt.mod.event().keys():
		var mod = kitSetEnt.mod.event()[mode].duplicate(true)
		
		if   "CHANGE" in mode :   event = modifyMod(mod,event)
		elif "ADD"    in mode :   event = addMod(mod,event)
		elif "REMOVE" in mode :   event = deleteMod(mod,event)
	return event


func getToString(kitset:KitSetEntity):
	var kitToString = ""
	if is_instance_valid(kitset.mod)      : kitToString +=          "["+kitset.mod.name()      + "] "
	if is_instance_valid(kitset.base)     : kitToString +=          "["+kitset.base.name()     + "] "
	if is_instance_valid(kitset.appendix) : kitToString += " of [" + kitset.appendix.name()+ "] "
	return kitToString







func addMod(toMod:Array,event:Dictionary) -> Dictionary :
	for mod in toMod: 
		var convertedDict = {}
		var section       = mod.pop_front()
		var package       = mod.pop_front()
		
		if   "CONSIDER" in package : 
			convertedDict = API_005_Event.convertConsiderArrayToDictionary([mod])
		elif "PERFORM"  in package : 
			convertedDict = API_005_Event.convertPerformanceArrayToDictionary([mod])
		
		event[section][package].append(convertedDict[0])
	return event



func deleteMod(toMod:Array,event:Dictionary) -> Dictionary :
	for mod in toMod: 
		var section = mod.pop_front()
		var concept = mod.pop_front()
		var conMod  = API_005_Event.convertSingleConsider(mod) if concept == "CONSIDER" else API_005_Event.convertSinglePerform(mod)
		
		for currentTarget in event[section][concept]:
			if currentTarget.hash() == conMod.hash(): 
				event[section][concept].erase(currentTarget)
	
	return event



func modifyMod(toMod:Array,event:Dictionary) -> Dictionary :
	for mod in toMod: 
		
		if "SEIZE" in mod.concept:
			var target = mod.target.split(" ") as Array
			event[mod.package][mod.concept][target[0]] = mod.value[1]
		
		else:
			var conMod     = API_005_Event.convertSingleConsider(mod.value)             if mod.concept == "CONSIDER" else API_005_Event.convertSinglePerform(mod.value)
			var conTarget  = API_005_Event.convertSingleConsider(mod.target.split(" ")) if mod.concept == "CONSIDER" else API_005_Event.convertSinglePerform(mod.target.split(" "))
			
			for i in event[mod.package][mod.concept].size():
				if event[mod.package][mod.concept][i].hash() == conTarget.hash(): 
					event[mod.package][mod.concept][i] = conMod
	
	return event




