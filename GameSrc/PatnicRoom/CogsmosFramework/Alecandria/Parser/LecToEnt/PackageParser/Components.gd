extends Node
class_name _Alecandria_LecToEnt_PackageComponents



static func run(content:Array,ent) -> Array:
	var cachedDictComps = {}
	var cachedInstances = []
	var dictName = ""
	for component in content:
		
		
		if   "(" in component :   dictName = component.replace(" ","").replace("(","")
		elif ")" in component :   dictName = ""
		
		else:
			var key   = component.split("--->")[0].replace(" ","")
			var value = component.split("--->")[1].lstrip(" ")
			
			if !dictName.empty():
				if !cachedDictComps.has(dictName): cachedDictComps[dictName] = {}
				cachedDictComps[dictName][key] = value
			else:
				var compInstance = DemocrECS.getComponentClass(key).new(value)
				cachedInstances.append(compInstance)
	
	
	for compInst in cachedInstances: 
		ent.addComponent(compInst)
	
	for compToString in cachedDictComps.keys():
		ent.addComponent(DemocrECS.getComponentClass(compToString).new(cachedDictComps[compToString]))
	
	
	return ent


