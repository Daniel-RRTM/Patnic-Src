extends _004_PerformParent
class_name _004_Perform_Passive

# CLASS    COND  --->  INCAPACITATED  --->  LVL 3  AND  DURA 5                   X
# CLASS    COND  --->  INCAPACITATED  --->  DURA 3  AND  LVL 5                   
# CLASS    COND  --->  INCAPACITATED  --->  DURA 3  AND  LVL 5                   

# ----- PROCESS -------------------------------------------------------------- ##


static func run(para:Dictionary,ent) -> void :
	if !ent.hasComp("C_24_PASSIVE_ACTIVE"): ent.addComponent(C_24_PASSIVE_ACTIVE.new([]))
	var passiveComp = ent.getComp("C_24_PASSIVE_ACTIVE")
	var kitSetStr = API_004_KitSet.selection.entity.toString
	
	if !passiveComp.value.has(kitSetStr):
		passiveComp.value.append(kitSetStr) 
		if para.type == "COMP":
			var compInst = ent.getComp(para.typePara)
			if para.operand == "INCREMENT": compInst.value += para.value
			if para.operand == "DECREMENT": compInst.value -= para.value



# ----- DOC ------------------------------------------------------------------ ##
		

static func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 


static func convertArrayToDict(parameters:Array) -> Dictionary : 
	return {	"type" : parameters[0]        ,
				"typePara" : parameters[1]   ,
				"operand"    : parameters[2],   
				"value" : int(parameters[3])}



func getAutoDoc() -> Dictionary : return {
	"description"  : "instanciates a Condition by set input and attaches it to triggered selection"
	,"concept"      : "PERFORM"
	,"name"         : "COND"
	,"inputs"       :  [  
		[ "COMP_INDEX" , ["SET","INCREMENT","DECREMENT"] , "dynamic typed value" ]
	]
}


