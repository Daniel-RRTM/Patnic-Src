extends Node
class_name _Alecandria_LecToEnt_PackageComponents



static func run(content:Array,ent) -> Array:
	var cachedInstances = []
	var dictName =""
	var dictCache = {}
	for component in content:
		
		if "(" in component: dictName = component.replace(" ","").replace("(","")
		elif ")" in component: dictName = ""
		
		else:
			if !dictName.empty():
				if !dictCache.has(dictName): dictCache[dictName]={}
				var key = component.split("--->")[0].replace(" ","")
				var value = component.split("--->")[1].dedent()
				dictCache[dictName][key]=value
				
			else:
				var compClass = component.split("--->")[0].replace(" ","")
				var compValue = component.split("--->")[1].dedent()
				var compInstance = DemocrECS.getComponentClass(compClass).new(compValue)
				cachedInstances.append(compInstance)
	
	
	for compInst in cachedInstances: ent.addComponent(compInst)
	for dictComp in dictCache.keys():ent.addComponent(DemocrECS.getComponentClass(dictComp).new(dictCache[dictComp]))
		
	
	return ent


