extends Node
class_name _Alecandria_LecToEnt_PackageMeta



static func run(content:Dictionary,ent) -> Array:
	var cachedInstances = []
	
	for component in content.keys():
		var compInstance = DemocrECS.getComponentClass(component).new(content[component])
		cachedInstances.append(compInstance)
	
	for compInst in cachedInstances: ent.addComponent(compInst)
	
	return ent


