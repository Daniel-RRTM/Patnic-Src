extends Node
class_name _008_KitSetMerger


# ----- MAIN --------------------------------------------------------------------- ##

func mergeKitParts(kitparts:Array) -> KitSetEntity :
	var kitSetEnt = KitSetEntity.new()

	for part in kitparts:
		if is_instance_valid(part) :
			if   part.hasFlag("F_15_KITPART_TYPE_BASE")     :   kitSetEnt.base = part
			elif part.hasFlag("F_16_KITPART_TYPE_MOD")      :   kitSetEnt.mod     = part
			elif part.hasFlag("F_17_KITPART_TYPE_APPENDIX") :   kitSetEnt.appendix      = part
	
	
	kitSetEnt.toString = getToString(kitSetEnt)
	kitSetEnt.event    = kitSetEnt.base.event().main().duplicate(true)

	if is_instance_valid(kitSetEnt.mod)      :   loadModPart(kitSetEnt)
	if is_instance_valid(kitSetEnt.appendix) :   pass
	
	return kitSetEnt




func loadModPart(kitSetEnt:KitSetEntity) -> void :
	var toMod = kitSetEnt.mod.event().main()["DATA"]
	var event = kitSetEnt.getMergedEvent()
	if toMod.has("MODIFICATION") : modifyMod(toMod,event)
	if toMod.has("ADDITION")     : addMod(toMod,event)
	if toMod.has("DELETION")     : deleteMod(toMod,event)



func getToString(kitset:KitSetEntity):
	var kitToString = ""
	if is_instance_valid(kitset.mod)      : kitToString +=          "["+kitset.mod.name()      + "] "
	if is_instance_valid(kitset.base)     : kitToString +=          "["+kitset.base.name()     + "] "
	if is_instance_valid(kitset.appendix) : kitToString += " of [" + kitset.appendix.name()+ "] "
	return kitToString







func addMod(toMod:Dictionary,event:Dictionary) -> void :
	for mod in toMod["ADDITION"]: 
		var section = mod.pop_front() 
		var package = mod.pop_front()
		event[section][package].append(mod)


func deleteMod(toMod:Dictionary,event:Dictionary) -> void :
	for mod in toMod["DELETION"]: 
		var cache = mod.duplicate(true)
		var section = cache.pop_front() 
		var package = cache.pop_front()
		for step in event[section][package]:
			if cache == step:
				event[section][package].erase(step)



func modifyMod(toMod:Dictionary,event:Dictionary) -> void :
	for mod in toMod["MODIFICATION"]: 
		var cache   = mod.duplicate(true)
		var section = cache.pop_front() 
		var package = cache.pop_front()
		
		
		for nr in event[section][package].size()-1:
			var step = event[section][package][nr]
			if cache.size() == step.size():
				if cache[0] == step[0] and cache[1] == step[1]:
					event[section][package][nr] = cache



