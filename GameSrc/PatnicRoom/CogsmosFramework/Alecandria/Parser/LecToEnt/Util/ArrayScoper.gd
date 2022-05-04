extends Node
class_name Alecandria_Util_ArrayScoper



static func getUseType(lecContent:Array) -> String : 
	for line in lecContent:   if "USE" in line :   return line.split("-->  ")[1]
	return "ERROR!! USE NOT FOUND"



static func getMetaSection(lecContent:Array)      -> Array :   return _spliceFromTo(lecContent,"META","MAIN")
static func getMainSection(lecContent:Array)      -> Array :   return _spliceFromTo(lecContent,"MAIN","REFERENCE")
static func getReferenceSection(lecContent:Array) -> Array :   return _spliceFromTo(lecContent,"REFERENCE","END")







static func _spliceFromTo(lecContent:Array,from:String,to:String) -> Array :
	var splicedContent = []
	var parse = false
	
	for line in lecContent:   
		if to in line and !line.dedent().begins_with("C_"): 
			parse = false
		if parse and line.dedent() != "REFERENCE":    
			splicedContent.append(line)
		if from in line and !line.dedent().begins_with("C_"):   
			parse = true
	
	return splicedContent


