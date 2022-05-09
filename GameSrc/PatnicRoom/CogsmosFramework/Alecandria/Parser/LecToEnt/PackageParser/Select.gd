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
			var arrPara = saniticedOperation.split(" ") as Array
			for parameter in arrPara: if parameter.empty(): arrPara.erase(parameter)
			effectDict[concept].append(arrPara)
	
	
	
	
	var consideration = API_005_Event.convertConsiderArrayToDictionary(effectDict["CONSIDER"])
	
	var seize = {	 effectDict["SEIZE"][0][0] : effectDict["SEIZE"][0][1]
					,effectDict["SEIZE"][1][0] : effectDict["SEIZE"][1][1]
					,effectDict["SEIZE"][2][0] : effectDict["SEIZE"][2][1] }
	
	effectDict = {
		 "SEIZE"    : seize
		,"CONSIDER" : consideration
		,"PERFORM"  : effectDict["PERFORM"]
	}
	
	
	
	
	if ent.hasComp("C_49_EVENT_REFERENCE"): 
		if ent.getComp("C_49_EVENT_REFERENCE").value is String : ent.getComp("C_49_EVENT_REFERENCE").value = {"SELECT":{}}
		if ent.getComp("C_49_EVENT_REFERENCE").value is Dictionary :ent.getComp("C_49_EVENT_REFERENCE").value["SELECT"] = effectDict
	else:ent.addComponent(C_49_EVENT_REFERENCE.new({"SELECT":effectDict}))
	
	
	
	return ent


