extends Node
class_name _Alecandria_LecToEnt_PackageEffect



static func run(content:Array,ent) -> Array:
	var eventEnt    = ConditionEntity.new()
	for component in content:
		var cache = component.replace("--->","").split(" ") as Array
		for parameter in cache: if parameter.empty(): cache.erase(parameter)
		
		var dict = SYNTAX.EVENT.EFFECTS[cache[0]].getArrToDict(cache)
		
		ent.effects.append(dict)
	
	
#	for compInst in cachedInstances: 
#		ent.addComponent(compInst)
#
#	for compToString in cachedDictComps.keys():
#		ent.addComponent(DemocrECS.getComponentClass(compToString).new(cachedDictComps[compToString]))
	
	
	return ent


