extends Node
class_name _Alecandria_LecToEnt_PackageUpgrade


static func run(content:Array,ent) -> Array:
	var effectDict = {}
	var concept    = ""
	
	for line in content:
		
		if ":" in line : 
			concept = line.replace(":","").dedent()
			effectDict[concept] = []
		
		else:
			match concept:
				"ADD"    : effectDict[concept].append(default(line))
				"REMOVE" : effectDict[concept].append(default(line))
				"CHANGE" : effectDict[concept].append(change(line))
	
	ent.addComponent(C_49_EVENT_REFERENCE.new(effectDict))
	return ent




static func default(line:String) -> Array:
	var saniticedOperation = line.replace(" ---> ","").dedent()
	return saniticedOperation.split(" ") as Array




static func change(line:String) -> Dictionary:
	var saniticedOperation = line.split(" TO ")
	var target = saniticedOperation[0].split(" ") as Array
	var value = saniticedOperation[1].split(" ") as Array
	return {"target": target , "value":value}





