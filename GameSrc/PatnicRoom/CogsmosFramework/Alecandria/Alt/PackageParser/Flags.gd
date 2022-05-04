extends Node
class_name _Alecandria_LecToEnt_PackageFlag



static func run(content:Array) -> Array:
	var toReturn = []
	for component in content:
		var compClass = component.split("--->")[0]
		var compValue = component.split("--->")[0]
		var compInstance = DemocrECS.getComponentClass(compClass.new(compValue))
		toReturn.append(compInstance)
	return toReturn


