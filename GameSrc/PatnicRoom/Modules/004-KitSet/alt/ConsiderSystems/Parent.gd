extends Node
class_name _004_ConsiderParentAlt



var index        :  Dictionary
var concatStart  :  int

func initialice(indexList:Dictionary):
	index       = indexList
	concatStart = 2
	
	



func setUpParse(step:Array) -> Array :
	if hasConcat(step) :   return getKeywords(step)
	else                      :   return trimStep(step)



func getKeywords(step:Array) -> Array : 
	var propArr = []
	propArr.append(step[2])
	for x in range(step.size()):   if x>2: if  x%2==0:   propArr.append(step[x])
	return propArr



func hasConcat(step:Array) -> bool :    
	return step.has("AND") or step.has("OR")



func trimStep(step:Array) -> Array : 
	return step.slice(2,step.size(),1,true)


func saniticeParameter(para:Array) -> Dictionary : return {}
