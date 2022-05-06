extends Node
class_name _Alecandria_LecToEnt_PackageProperties



static func run(content:Array,ent) -> Array:
	for property in content:   ent.addProperty(property)
	return ent


