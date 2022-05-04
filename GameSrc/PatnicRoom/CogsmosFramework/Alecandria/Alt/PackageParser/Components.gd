extends Node
class_name _Alecandria_LecToEnt_PackageComponents



static func run(content:Array,ent) -> Array:
	var cachedInstances = []
	for component in content:
		var compClass = component.split("--->")[0].replace(" ","")
		var compValue = component.split("--->")[1].dedent()
		var compInstance = DemocrECS.getComponentClass(compClass).new(compValue)
		cachedInstances.append(compInstance)
	for compInst in cachedInstances: ent.addComponent(compInst)
	return ent


