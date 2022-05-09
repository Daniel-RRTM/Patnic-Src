extends Node
class_name _Alecandria_LecToEnt_PackageRun


static func run(content:Array,ent) -> Array:
	var effectDict = {}
	var concept    = ""
	
	for line in content:
		
		if ":" in line : 
			concept = line.replace(":","").dedent()
			effectDict[concept] = []
		
		else:
			var saniticedOperation = line.replace(" --->","").dedent()
			var arrPara = saniticedOperation.split(" ") as Array
			for parameter in arrPara: if parameter.empty(): arrPara.erase(parameter)
			effectDict[concept].append(arrPara)
	
	
	
	if ent.hasComp("C_49_EVENT_REFERENCE"): 
		var cache    = ent.getCompValue("C_49_EVENT_REFERENCE")
		cache["RUN"] = {   "PERFORM":API_005_Event.convertPerformanceArrayToDictionary(effectDict["PERFORM"])   }
		ent.getComp("C_49_EVENT_REFERENCE").value = cache
	
	
	else:ent.addComponent(C_49_EVENT_REFERENCE.new({"RUN":{"PERFORM":API_005_Event.convertPerformanceArrayToDictionary(effectDict["PERFORM"])}}))
	
	
	return ent
