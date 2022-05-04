extends Node
class_name _Util_Dictionary


# FUNC possible modes : [zeroOut]   , [increment] , [decrement]   
# FUNC                : [arrToDict] , [merge]     , [replace]   
func use(toManinpulate, mode:String, altDict={}):
	match mode:
		"arrToDict" :    return arrToDict(toManinpulate)
		"increment" :    return increment(toManinpulate,altDict)
		"decrement" :    return decrement(toManinpulate,altDict)
		"replace"   :    return increment(toManinpulate,altDict)
		"zeroOut"   :    return zeroOut(toManinpulate)
		"merge"     :    return increment(toManinpulate,altDict)




func zeroOut(dict:Dictionary) -> Dictionary :
	for key in dict.keys() :   dict[key] = 0
	return dict


func increment(dictOne:Dictionary, dictTwo:Dictionary) -> Dictionary :
	for key in dictOne.keys() :   if  dictTwo.has(key) :   dictOne[key] += dictTwo[key]
	for key in dictTwo.keys() :   if !dictOne.has(key) :   dictOne[key]  = dictTwo[key]
	return dictOne


func decrement(dictOne:Dictionary, dictTwo:Dictionary) -> Dictionary :
	for key in dictOne.keys() :   if  dictTwo.has(key) :   dictOne[key] -= dictTwo[key]
	for key in dictTwo.keys() :   if !dictOne.has(key) :   dictOne[key]  = dictTwo[key]
	return dictOne


func replace(dictOne:Dictionary, dictTwo:Dictionary) -> Dictionary :
	for key in dictOne.keys() :   if  dictTwo.has(key) :   dictOne[key]  = dictTwo[key]
	return dictOne


func arrToDict(arr:Array,dict={}):
	for currentField in arr :   dict[currentField] = currentField
	return dict


func mergeDictionary(dictOne:Dictionary,dictTwo:Dictionary):
	for key in dictTwo.keys():    dictOne[key] = dictTwo[key]
	return dictOne



