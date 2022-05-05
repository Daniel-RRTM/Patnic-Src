extends Node
class_name _Alecandria_LecToEnt_PackageSelect



static func run(content:Array,ent) -> Array:
	var effectDict = {}
	var concept    = ""
	
	for line in content:
		
		if ":" in line : 
			concept = line.replace(":","").dedent()
			effectDict[concept] = []
		
		else:
			var saniticedOperation = line.replace(" --->","").dedent()
			var arrPara= saniticedOperation.split(" ") as Array
			effectDict[concept].append(arrPara)
	
	
	if ent.hasComp("C_49_EVENT_REFERENCE"): ent.getComp("C_49_EVENT_REFERENCE").value["SELECT"] = effectDict
	else:ent.addComponent(C_49_EVENT_REFERENCE.new({"SELECT":effectDict}))
	
	
	return ent


