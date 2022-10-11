extends Node
class_name _Alecandria_LecToEnt_PackageListener

# REFACTOR              

static func run(content:Array,ent) -> Array:
	var table = {}
	var type : String
	
	for line in content:
		if ":" in line: 
			type = line.replace(":","")
			table[type] = []
	
		else:
			line.replace("--->","")
			line.replace("-->","")
			line.replace("->","")
			match type:
				"REST_WITH" : table[type].append(restIn(line.split(" ")))
				"KILL"    : table[type].append(kill(line.split(" ")))
				"PERFORM" : table[type].append(perform(line.split(" ")as Array))
	
	ent.addComponent(C_53_LISTENER.new(table))
	
	return ent



static func restIn(arr) -> Dictionary:
	return{
		"flag"       : arr[3],
		"operator"   : arr[0],
		"comparator" : arr[1],
	}



static func kill(arr) -> Dictionary:
	return{
		"flags":arr[5],
		"operation"       : arr[3],
		"flag"   : "KILL",
		"operator" : arr[0],
		"comparator" : arr[1]
	}

static func perform(arr) -> Dictionary:
	arr.erase("--->")
	return API_005_Event.convertSinglePerform(arr)



