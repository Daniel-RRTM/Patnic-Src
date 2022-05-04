extends Node
class_name _004_PerformParent



var index        :  Dictionary
var concatStart  :  int
var selects      : Array

func initialice(indexList:Dictionary):
	index       = indexList
	concatStart = 2
	
	



func setUpParse(step:Array) -> Array :
	selects         = API_004_KitSet.selection.kitset.selectedEntities()
	if hasConcat(step) :   return getKeywords(step)
	else                      :   return trimStep(step)



func getKeywords(step:Array) -> Array : 
	var propArr = []
	propArr.append(step[2])
	for x in range(step.size()):   if x>2: if  x%2==0:   propArr.append(step[x])
	return propArr



func hasConcat(step:Array) -> bool :    
	return step.has("AND")



func trimStep(step:Array) -> Array : 
	return step.slice(2,step.size(),1,true)


