extends Node


 
# DOCS  docs/docs/Modules/004.md                                                  
# BOOKMARK[epic=Modules] 004_KitSet                                                
# ----- INITIALICER -------------------------------------------------------------- ##


var sourceSystem   := _005_SourceSystem.new()
var mediumSystem   := _005_MediumSystem.new()
var performSystem  := _005_PerformSystem.new()
var considerSystem := _005_ConsiderSystem.new()



# ----- PROCESS ------------------------------------------------------------------ ##


func convertConsiderArrayToDictionary(considerations:Array) -> Array : 
	return considerSystem.parseConsiderationsToDictionaries(considerations)


func convertPerformanceArrayToDictionary(considerations:Array) -> Array : 
	return performSystem.parseConsiderationsToDictionaries(considerations)

# REFACTOR 
func convertSinglePerform(considerations:Array) -> Dictionary : 
	return performSystem.parseSinglePerformArray(considerations)

func convertSingleConsider(considerations:Array) -> Dictionary : 
	return considerSystem.parseSingleConsiderArray(considerations)


func runSource(taskData:Dictionary) -> Array : 
	return sourceSystem.operateOnParameter(taskData)


func runMedium(taskData:Dictionary) -> Array : 
	return mediumSystem.operateOnParameter(taskData)


func getTriggeredSelects(taskData:Dictionary) -> Array: 
	return considerSystem.getTriggeredFromConsiderations(taskData)


func runKitSet(step:Dictionary) -> void  : 
	if "FILE" in step.typeOfCache:
		for select in API_004_KitSet.selection.triggeredEnts:
			performSystem._operateOnParameter(step,select)




func getHighlightColor(medium:String)  -> String :   return _004_Util.getHighlightTextureOfEvent(medium)
func getAlertColor(medium:String)      -> String :   return _004_Util.getAlertTextureOfEvent(medium)

func isNeedingDirection()                -> bool :   return _004_Util.getEventsNeedingDirection().has(API_004_KitSet.selection.medium)











