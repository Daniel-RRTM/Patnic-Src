extends _004_PerformParent
class_name _004_Perform_Component

# CLASS    COMP  --->  C_1_IS_WALKABLE SET TRUE                                 X
# CLASS    COMP --->  C_9_CREDITS_ACCOUNT DECREMENT BY 100                     X
# CLASS    COMP --->  C_48_RARITY INCREMENT BY 2                               X

# ----- PROCESS -------------------------------------------------------------- ##


static func run(para:Dictionary,ent) -> void :
	if ent.hasComp(para.compName):
			
		var comp = ent.getComp(para.compName)
		if para.operand == "DECREMENT" :   comp.value -= int(para.value)
		if para.operand == "INCREMENT" :   comp.value += int(para.value)
		if para.operand == "SET"       :
			if para.value == "TRUE" : comp.value = true
			elif para.value == "FALSE" : comp.value = false
			else : comp.value = para.value
	
	if para.compName == "C_12_ATLAS_INDEX":
		if ent is TileEntity: SokraTiles.getMeatFloor().drawCell_quack(ent.index(),ent.position)
		if  ent is InteractEntity : SokraTiles.getMeatInteract().drawCell_quack(ent.index(),ent.position)



# ----- DOC ------------------------------------------------------------------ ##


static func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 


static func convertArrayToDict(parameters:Array) -> Dictionary : 
	parameters.erase("THAN")
	return {	"compName" : parameters[0]   ,
				"operand"  : parameters[1]   ,
				"value"    : parameters[2]   }



func getAutoDoc() -> Dictionary : return {
	"descriiption"  : "manipulates a Component of triggered selection"
	,"concept"      : "CONSIDER"
	,"name"         : "TYPE"
	,"inputs"       :  [  DemocrECS.getAllComponents() , ["SET","INCREMENT","DECREMENT"] , "dynamic typed value" ]
}


