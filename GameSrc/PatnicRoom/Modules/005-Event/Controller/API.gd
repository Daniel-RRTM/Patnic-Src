extends Node


 
# DOCS  docs/docs/Modules/004.md                                                  
# BOOKMARK[epic=Modules] 004_KitSet                                                
# ----- INITIALICER -------------------------------------------------------------- ##


var considerHub := _004_Consider.new() 
var performHub  := _004_Perform.new()

var sourceSystem := _004_Seize_Source.new()
func _ready():
	API_004_KitSet.selection



func getSources()                          -> void : for source in API_004_KitSet.selection.event.getSource(): sourceSystem.addTask(source)
func getSelectedPositions()                -> Array : return _004_Seize_Medium.getByHub()
func runConsideration(consideration:Array) -> Array : return considerHub.run(consideration)
func runKitSet(step:Array)                 -> void  : performHub.run(step)


func getHighlightColor(medium:String)  -> String :   return _004_Util.getHighlightTextureOfEvent(medium)
func getAlertColor(medium:String)      -> String :   return _004_Util.getAlertTextureOfEvent(medium)

func isNeedingDirection()                -> bool :   return _004_Util.getEventsNeedingDirection().has(API_004_KitSet.selection.medium)



# ----- PROCESS ------------------------------------------------------------------ ##




var sourceSystemAlt := _005_SourceSystem.new()
var mediumSystemAlt := _005_MediumSystem.new()
var considerSystemAlt := _005_ConsiderSystem.new()



func runSource(taskData:Dictionary) -> Array : 
	return sourceSystemAlt.operateOnParameter(taskData)


func runMedium(taskData:Dictionary) -> Array : 
	return mediumSystemAlt.operateOnParameter(taskData)


func convertConsiderArrayToDictionary(considerations:Array) -> Array : 
	return considerSystemAlt.parseConsiderationsToDictionaries(considerations)


func getTriggeredSelects(taskData:Dictionary) -> Array: 
	return considerSystemAlt.getTriggeredFromConsiderations(taskData)








