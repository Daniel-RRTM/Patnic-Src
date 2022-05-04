extends Node


 
# DOCS  docs/docs/Modules/004.md                                                  
# BOOKMARK[epic=Modules] 004_KitSet                                                
# ----- INITIALICER -------------------------------------------------------------- ##


var considerHub := _004_Consider.new() 
var performHub  := _004_Perform.new()



func getSources()                          -> Array : return _004_Seize_Source.getByHub()
func getSelectedPositions()                -> Array : return _004_Seize_Medium.getByHub()
func runConsideration(consideration:Array) -> Array : return considerHub.run(consideration)
func runKitSet(step:Array)                 -> void  : performHub.run(step)


func getHighlightColor(medium:String)  -> String :   return _004_Util.getHighlightTextureOfEvent(medium)
func getAlertColor(medium:String)      -> String :   return _004_Util.getAlertTextureOfEvent(medium)

func isNeedingDirection()                -> bool :   return _004_Util.getEventsNeedingDirection().has(API_004_KitSet.selection.medium)



# ----- PROCESS ------------------------------------------------------------------ ##















