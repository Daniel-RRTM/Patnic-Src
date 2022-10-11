extends Node
class_name _Alecandria_LecToEnt_PackageLootFilter

# REFACTOR              

static func run(content:Array,ent) -> Array:
	var table = {}
	var percent
	
	for line in content:
		if "_OF_" in line: 
			percent = line.replace(":","")
			table[percent] = {}
			
		
		else:
			var lineArr = line.split(" ---> ") as Array
			var type = lineArr.pop_front()
			
			match type:
				"KITPART"   : table[percent] = kitpart(lineArr)
				"VALUABLES" : table[percent] = valuables(lineArr)

	
	ent.addComponent(C_61_LOOT_TABLE.new({"DECLARATION":table}))
	
	return ent





static func kitpart(arr) -> Dictionary:
	return {
		"part" : arr[0],
		"cat"  : [arr[1]],
		"filter" : [arr[2].split("AND")]
	}


static func valuables(arr) -> Dictionary:
	var cache = arr[2].split(" TO ")
	return {
		"type" : arr[0],
		"subType"  : arr[1],
		"rarity" : [int(cache[0]),int(cache[1])]
	}


