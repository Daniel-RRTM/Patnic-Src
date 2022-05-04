extends Node
# BOOKMARK[epic=Modules] 006_Player                                             
# DOCS  > Docs\API\docs\Cogsmos\democrECS\SokraTILES.md                        
# DOCS  > TO ADD                                                               


# ----- INITIALICE ----------------------------------------------------------- ##


var currentChar       := PlayerEntity.new()
var chargenSelecttion : Dictionary
var startingKitsets   : Array

var inputMode         := true
var inputSignals      := _005_In.new()

var team              := _005_Common_Team.new()

var stations          := _005_Common_Station.new()
var stationSetter     := _005_Common_StationSetter.new()



# ----- GETTER --------------------------------------------------------------- ##


func getInputMode()            -> bool                      :  return inputMode
func getStations()             -> _005_Common_Station       :  return stations
func getCurrentStationSetter() -> _005_Common_StationSetter :  return stationSetter



# ----- CHARACTER ------------------------------------------------------------ ##


func generateNewChar(chargenDict:Dictionary)   -> void  :  _005_LoadChar.generateNewSaveState(chargenDict)

func loadChar()                                -> void  :  _005_LoadChar.parse("one",1)
func loadQuickStartChar()                      -> void  :  _005_LoadChar.parse("quickStart",1)
func loadCharBySaveStateName(saveState:String) -> void  :  _005_LoadChar.parse(saveState,1)

func setIndirectStats(ent)                     -> void  :  _005_Character_IndirectStats.calculate(ent)

	










