extends Node
class_name _Alecandria_LecToEnt_PackageFlag



static func run(content:Array,ent) -> Array:
	for flag in content:   ent.addFlag(flag)
	return ent


