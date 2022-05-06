extends _004_PerformParent
class_name _004_Perform_Property

# CLASS    THIS --->  PROP  --->  SWAP  CONDUCTING                              
# CLASS    THIS --->  PROP  --->  ADD  BURNABLE                                 
# CLASS    THIS --->  PROP  --->  REMOVE  WET                                   

func run(perfomance:Array) -> void :
	var para = saniticeParameter(perfomance)
	var propEnum = PROPERTIES.OF[para.prop]
	
	for ent in API_004_KitSet.selection.triggers:
		match para.mode:
			"SWAP"   : if !ent.hasProperty(para.prop) :   ent.addProperty(propEnum);   else : ent.removeProperty(propEnum)
			"ADD"    : if !ent.hasProperty(para.prop) :   ent.addProperty(propEnum)
			"REMOVE" : if  ent.hasProperty(para.prop) :   ent.removeProperty(propEnum)





func getParameter_quack()     -> Dictionary :   return {}
func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 
func getName_quack()          -> String     :   return "HAS_COND"


func saniticeParameter(parameters:Array) -> Dictionary : 
	return {	"prop" : parameters[2]   ,
				"mode" : parameters[3]   }

	

func getAutoDoc() -> Dictionary : return {
	"descriiption"  : "manipulates a property of triggered selection"
	,"concept"      : "PERFORM"
	,"name"         : "PROP"
	,"valids"       : [ ["ADD","REMOVE","SWAP"] , PROPERTIES.OF  ]
}
