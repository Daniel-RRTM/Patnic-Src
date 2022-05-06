extends Node
class_name _Alecandria_LecToEnt_PackageTable


static func run(content:Array,ent) -> Array:
	var table = {}
	
	for line in content:
		var lineArr = line.split(" ---> ") as Array
		var collumnName =lineArr.pop_front()
		table[collumnName] = []
		
		for entry in lineArr.pop_front().split("AND"):
			table[collumnName].append(entry.replace(" ",""))
			
	
	
	ent.addComponent(C_74_EVENT_MAIN_DICT.new({"DECLARATION":table}))
	
	return ent
