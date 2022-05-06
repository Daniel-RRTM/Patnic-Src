extends Node
class_name _008_KitSetMerger


# ----- MAIN --------------------------------------------------------------------- ##

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

	if is_instance_valid(kitSetEnt.mod)      :   loadModPart(kitSetEnt)
	if is_instance_valid(kitSetEnt.appendix) :   pass
	
	return kitSetEnt




func loadModPart(kitSetEnt:KitSetEntity) -> void :
	var event = kitSetEnt.getMergedEvent().duplicate(true)
	for mode in kitSetEnt.mod.event().keys():
		if "CHANGE" in mode : modifyMod(kitSetEnt.mod.event()[mode],event)
		if "ADD" in mode     : addMod(kitSetEnt.mod.event()[mode],event)
		if "REMOVE" in mode     : deleteMod(kitSetEnt.mod.event()[mode],event)



func getToString(kitset:KitSetEntity):
	var kitToString = ""
	if is_instance_valid(kitset.mod)      : kitToString +=          "["+kitset.mod.name()      + "] "
	if is_instance_valid(kitset.base)     : kitToString +=          "["+kitset.base.name()     + "] "
	if is_instance_valid(kitset.appendix) : kitToString += " of [" + kitset.appendix.name()+ "] "
	return kitToString







func addMod(toMod:Array,event:Dictionary) -> void :
	for mod in toMod: 
		var section = mod.pop_front() 
		var package = mod.pop_front()
		event[section][package].append(mod)


func deleteMod(toMod:Array,event:Dictionary) -> void :
	for mod in toMod: 
		var cache = mod.duplicate(true)
		var section = cache.pop_front() 
		var package = cache.pop_front()
		for step in event[section][package]:
			if cache == step:
				event[section][package].erase(step)



func modifyMod(toMod:Array,event:Dictionary) -> void :
	
	for mod in toMod: 
		for step in event[mod.package][mod.concept]:
			if PoolStringArray(step).join(" ") == mod.target: step = mod.value
		
		
#		var cache   = mod.duplicate(true)
#		var section = cache.pop_front() 
#		var package = cache.pop_front()
#
#		for nr in event[section][package].size()-1:
#			var step = event[section][package][nr]
#			if cache.size() == step.size():
#				if cache[0] == step[0] and cache[1] == step[1]:
#					event[section][package][nr] = cache



