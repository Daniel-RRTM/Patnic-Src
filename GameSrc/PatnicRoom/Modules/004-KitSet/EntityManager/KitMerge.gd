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
	kitSetEnt.event    = kitSetEnt.base.event().duplicate(true)

	if is_instance_valid(kitSetEnt.mod)      :   kitSetEnt.event = loadModPart(kitSetEnt)
	if is_instance_valid(kitSetEnt.appendix) :   pass
	
	return kitSetEnt




func loadModPart(kitSetEnt:KitSetEntity) -> Dictionary :
	var event = kitSetEnt.getMergedEvent().duplicate(true)
	for mode in kitSetEnt.mod.event().keys():
		if   "CHANGE" in mode :   event = modifyMod(kitSetEnt.mod.event()[mode],event)
		elif "ADD"    in mode :   event = addMod(kitSetEnt.mod.event()[mode],event)
		elif "REMOVE" in mode :   event = deleteMod(kitSetEnt.mod.event()[mode],event)
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
		
		if   "CONSIDER" in package : convertedDict = API_005_Event.convertConsiderArrayToDictionary([mod])
		elif "PERFORM"  in package : convertedDict = API_005_Event.convertPerformanceArrayToDictionary([mod])
		
		event[section][package].append(convertedDict[0])
	return event


func deleteMod(toMod:Array,event:Dictionary) -> Dictionary :
	for mod in toMod: 
		var cache = mod.duplicate(true)
		var section = cache.pop_front() 
		var package = cache.pop_front()
		for step in event[section][package]:
			if cache == step:
				event[section][package].erase(step)
	return event


func modifyMod(toMod:Array,event:Dictionary) -> Dictionary :
	for mod in toMod: 
		
		
		if "SEIZE" in mod.concept:
			var cache = mod.target.split(" ")
			event[mod.package][mod.concept][cache[0]] = mod.value[1] 
		
		if "CONSIDER" in mod.concept:event[mod.package][mod.concept].append(API_005_Event.convertSingleConsider(mod.valusse))
		if "PERFORM" in mod.concept:event[mod.package][mod.concept].append(API_005_Event.convertSinglePerform(mod.value))
	
	return event




