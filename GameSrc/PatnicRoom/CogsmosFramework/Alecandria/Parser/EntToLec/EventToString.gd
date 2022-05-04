extends Node
class_name Alecandria_Parser_EntToLec_EventToString





static func run(ent) -> String :
	var entToString = "MAIN\n"
	entToString += Alecandria_Parser_EntToLec_UniversalToString.getPackage()
	entToString += getComps(ent)
	entToString += Alecandria_Parser_EntToLec_UniversalToString.getPackage()
	entToString += getArray(ent.flags,"FLAGS")
	entToString += Alecandria_Parser_EntToLec_UniversalToString.getPackage()
	entToString += getArray(ent.properties,"PROPERTIES")
	
	return entToString




static func getComps(ent) -> String :
	var toReturn = "  COMPONENTS\n"
	
	for compToString in ent.components.keys():
		var compValue  = ent.getCompValue(compToString)
		var spacing    = getCompSpacing(compToString)
		toReturn      += "    "
		
		if "C_74" in compToString :   toReturn += "\n    "+compToString+spacing+"vvvv    "+getEventDict(compValue)+"\n"
		else                      :   toReturn += compToString+spacing+"--->    "+str(compValue)+"\n"
	
	return toReturn



static func getCompSpacing(compToString:String) -> String :
	var spacing=""
	for i in range(compToString.length()-25,0): spacing += " "
	return spacing





const ARROW = ["--->","-->","->"]
static func getEventDict(event:Dictionary) -> String : 
	var toReturn = "\n"
	
	#>>> PACKAGE <<<#
	for package in event.keys():
		toReturn += "      "+package+"\n"
		
		
		#>>> CONCEPT <<<#
		for concept in event[package].keys():
			toReturn += "        "+concept+"\n"
			
			
			#>>> STEP <<<#
			for step in event[package][concept]:
				toReturn += "          "
				var arrowToSet = getArrowsToSet(step)
				
				
				#>>> VALUE <<<#
				var counter = 0
				for toDraw in arrowToSet:
					var value = step[counter]
					
					
					if toDraw and 3 > counter:
						var spacing  = ENUM.LEC.SPACING[counter]
						var arrow    = ARROW[counter]
						
						toReturn    += value+"  "
						for x in range(spacing-value.length()): toReturn += " "
						toReturn    += arrow+"  "
					
					
					else: toReturn += value+"  "
					counter += 1
					
					
					
				toReturn += "\n"
	return toReturn




static func getArrowsToSet(step:Array)-> Array:
	var arrowToSet = []
	var concat     = true
	for value in step:
		
		if ["BY","AND","LVL"].has(value):
			arrowToSet.append(!arrowToSet.pop_back())
			arrowToSet.append(false)
			concat=false
		
		elif concat :  arrowToSet.append(true)
		else        :  arrowToSet.append(false)
	
	arrowToSet.append(!arrowToSet.pop_back())
	return arrowToSet




static func getArray(arr:Array,packageName:String) -> String :
	var toReturn = packageName+"\n"
	
	for compToString in arr:
			toReturn += "    "
			toReturn += compToString
			toReturn += "\n"
	
	return toReturn
