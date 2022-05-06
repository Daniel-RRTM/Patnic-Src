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
	var saniticedOperation = line.replace("---> ","").dedent()
	return saniticedOperation.split(" ") as Array




static func change(line:String) -> Dictionary:
#	var saniticedOperation = line.split(" TO ")
#	var target = saniticedOperation[0].split(" ") as Array
#	var value = saniticedOperation[1].split(" ") as Array
	
	var atom = line.split(" ") as Array
	var nameSpace = line.split(">")[0].rstrip(" ").split(" ")
	var change = line.split(" > ")[1].split(" <--->")
	
	
	return  { "package":nameSpace[0] , "concept":nameSpace[1] , "target": change[0].dedent() , "value":change[1].dedent().split(" ") }





