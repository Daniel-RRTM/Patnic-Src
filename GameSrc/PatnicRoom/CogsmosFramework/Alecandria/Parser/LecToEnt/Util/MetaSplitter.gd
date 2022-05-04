extends Node
class_name Alecandria_Util_SectionSplitter_Meta



static func run(lecContent:Array) -> Dictionary :#
	var dict = {}
	
	#>>> SINGLE VALUE <<<#
	for key in ["INDEX","USE","BY"]  :   
		var currentMetaData = lecContent.pop_front()
		var keyValuePair    = currentMetaData.split("-->")
		var value           = keyValuePair[1].dedent()
		
		dict[key] = value
	
	#>>> MULTI VALUE <<<#
	if "DESCRIPTION" in lecContent.pop_front() :
		dict["DESCRIPTION"] = []
		for line in lecContent :   dict["DESCRIPTION"].append(line)
	
	
	return dict



