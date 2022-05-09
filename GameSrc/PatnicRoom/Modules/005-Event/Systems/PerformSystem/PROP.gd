extends _004_PerformParent
class_name _004_Perform_Property

# CLASS    THIS --->  PROP  --->  SWAP  CONDUCTING                              
# CLASS    THIS --->  PROP  --->  ADD  BURNABLE                                 
# CLASS    THIS --->  PROP  --->  REMOVE  WET                                   

# ----- PROCESS -------------------------------------------------------------- ##


static func run(para:Dictionary,ent) -> void :
	var propEnum = PROPERTIES.OF[para.prop]
	
	match para.mode:
		"SWAP"   : if !ent.hasProperty(para.prop) :   ent.addProperty(propEnum);   else : ent.removeProperty(propEnum)
		"ADD"    : if !ent.hasProperty(para.prop) :   ent.addProperty(propEnum)
		"REMOVE" : if  ent.hasProperty(para.prop) :   ent.removeProperty(propEnum)



# ----- DOC ------------------------------------------------------------------ ##


static func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 


static func convertArrayToDict(parameters:Array) -> Dictionary : return {	
		 "prop" : parameters[2]
		,"mode" : parameters[3]   
	}

	

func getAutoDoc() -> Dictionary : return {
	"descriiption"  : "manipulates a property of triggered selection"
	,"concept"      : "PERFORM"
	,"name"         : "PROP"
	,"valids"       : [ ["ADD","REMOVE","SWAP"] , PROPERTIES.OF  ]
}
