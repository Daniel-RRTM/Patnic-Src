extends Node
class_name Alecandria_LecToEnt_Saniticer


static func saniticeMetaSection(metaSection:Array):
	var dictToReturn = {"INDEX":"","USE":"","BY":""}
	for pairNr in metaSection.size() :
		var pair = metaSection[pairNr]
		
	#>>> MULTI VALUE <<<#
		if "DESCRIPTION" in pair : dictToReturn["DESCRIPTION"] = metaSection.slice(pairNr+1,metaSection.size())
	#>>> SINGLE VALUE <<<#
		else : dictToReturn[dictToReturn.keys()[pairNr]] = pair.split("-->")[1].dedent() 
	
	return dictToReturn



static func getSingleStep(step:String) -> String :return step.split("-->")[1].dedent() 
static func getCompOfEntry(entry:String)-> String:return entry.replace("vvvv","").split("--->")[0].dedent().rstrip(" ")
static func getStringEnum(entry:String) -> String : return entry.dedent()
