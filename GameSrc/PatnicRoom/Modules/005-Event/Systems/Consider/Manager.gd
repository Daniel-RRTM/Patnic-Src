extends System
class_name _005_ConsiderSystem


func declare() -> void:
	self.name              = "_005_Medium,"
	self.description       = "applies the shape of selections on source(s)"
	self.APIRef            = API_005_Event
	self.signalsConnection = {}
	self.operations        = {
		 "COMP"            : _004_Consider_Component
		,"COND"            : _004_Consider_Condition
		,"FLAG"            : _004_Consider_Flag
		,"PROP"            : _004_Consider_Property
		,"TYPE"            : _004_Consider_Type
		,"TEMP"            : _004_Consider_Template
	}

func prepare() -> void: pass


func template() -> _004_Consider_Template  : return operations["TEMP"] 
func prop()     -> _004_Consider_Property  : return operations["PROP"] 
func cond()     -> _004_Consider_Condition : return operations["COND"] 
func comp()     -> _004_Consider_Component : return operations["COMP"] 
func flag()     -> _004_Consider_Flag      : return operations["FLAG"] 
func type()     -> _004_Consider_Type      : return operations["TYPE"] 


func getAutoDoc() -> Dictionary : return {
	"name"         : "Consideration"
	,"description"  : "returns valid entities, which have the corespondig value in their Component!"

	,"package"      : "SELECT"
	,"concept"      : "CONSIDER"
	,"context"    : [{   "keyword":"THIS" , "explanation":"starts a new validation, needs to be the first context"                                }
					,{   "keyword":"AND"  , "explanation":"further narrowing selection down, needs true statements for this and previous steps"   }
					,{   "keyword":"OR"   , "explanation":"Adds Entities to selection based on soley this statement, independent of previous"     }]

	,"inputs"       :  [ 
		["COMP_INDEX" , ["NOT","EQUALS","LESS","MORE"] , ["Value","COMP_INDEX"]] 
	]
}

# ----- PROCESS -------------------------------------------------------------- ##



func parseConsiderationsToDictionaries(taskData:Array) -> Array:
	var toReturn : Array
	for consideration in taskData:
		toReturn.append(parseSingleConsiderArray(consideration))
	return toReturn


func getTriggeredFromConsiderations(taskData:Dictionary) -> Array:
	var toReturn = []
	for consi in taskData.consider :
		
		if "THIS" in consi.connector : 
			taskData.triggeredEnts  = self.operations[consi.operation].run(consi.parameter,taskData.selectedEnts)
		
		
		elif "OR" in consi.connector :
			taskData.triggeredEnts += self.operations[consi.operation].run(consi.parameter,taskData.selectedEnts)
		
		
		elif "AND" in consi.connector :
			taskData.triggeredEnts  = self.operations[consi.operation].run(consi.parameter,taskData.triggeredEnts)
	
	return taskData.triggeredEnts


func parseSingleConsiderArray(taskData:Array) -> Dictionary:
	var currentConsider : Dictionary
	currentConsider["connector"] = taskData.pop_front()
	currentConsider["operation"]   = taskData.pop_front()
	currentConsider["parameter"]   = self.operations[currentConsider.operation].convertArrayToDict(taskData)
	return currentConsider 


