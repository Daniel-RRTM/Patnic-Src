extends Node
class_name _Alecandria_LecToEnt_PackageEffect



static func run(content:Array,ent) -> Array:
	var eventEnt = ConditionEntity.new()
	var concept
	var effectDict = {}
	
	for line in content:
		if ":" in line : 
			concept = line.replace(":","").dedent()
			effectDict[concept] = []

		else:
			var saniticedStep = line.replace("--->","").split(" ") as Array
			for parameter in saniticedStep: if parameter.empty(): saniticedStep.erase(parameter)
			effectDict[concept].append(SYNTAX.EVENT.EFFECTS[saniticedStep[0]].getArrToDict(saniticedStep))
	
	
	
	
	
	
	for step in effectDict["EFFECT"]:ent.effects.append(step)
	
	
	
	
	
	
	return ent


