extends Node
class_name _006_Condition_Saniticer



static func saniticeParameter(parameter:Array) -> Array :
	var trimPara = trimDownParameter(parameter)
	var para     = cascadeIndirectValues(trimPara)
	return cascadeComparison(para)




static func trimDownParameter(values:Array) -> Array:
	for arrow in ["--->","--->","->"] : values.erase(arrow)
	for key in SYNTAX.EVENT.EFFECTS.keys():
		if values[0] in key: values.remove(0)  
	return values




static func cascadeIndirectValues(values:Array) -> Array:
	var toReturn = []
	for value in values:
		if isIndirectValue(value): 
			for operand in ["+","-","*","/"]: if operand in value: toReturn.append(value.split(operand).join(" "+operand+" "))
		else: toReturn.append(value)
	return toReturn


static func cascadeComparison(values:Array) -> Array:
	var toReturn = []
	var counter = values.size()
	while counter != 0:
		if ["LESS","BIGGER","EQUALS","NOT"].has(values[counter-1]): 
			toReturn.remove(counter)
			toReturn.append([values[counter-2],values[counter-1],values[counter]])
			counter -=1
		else:toReturn.append(values[counter-1])
		counter -= 1
	toReturn.invert()
	return toReturn




static func isIndirectValue(string:String) -> bool:
	for operand in ["+","-","*","/"]:
		if operand in string: return true
	return false










