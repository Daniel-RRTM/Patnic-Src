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
func saveChar()                                -> void  :  _005_SaveChar.savePlayState()
func setIndirectStats(ent)                     -> void  :  _005_Character_IndirectStats.calculate(ent)



func getJSONCrossReference() -> Dictionary: return {
	"common":{
		"C_9_CREDITS_ACCOUNT"       : "credits"
#		,"C_X_ARCHIVEMENTS"         : "archivements"
		,"C_68_KITVENTORY"          : "kitventory"
#		,"C_X_STATIONEN"            : "archivements"
	},
	"character":{
		 "C_39_KITSLOT_PROGRESSION" : "kitslot progression"
		,"C_51_PLAYER_KITSETS"      : "kitsets"
		,"C_45_CHARACTER_NAME"      : "name"
		,"C_12_ATLAS_INDEX"         : "texture"
		,"C_25_MAX_KITSETS"         : "max kitsets"
		,"C_44_STREETNAME"          : "street-name"
		,"C_19_ATTRIBUTES"          : "attributes"
		,"C_11_RACE_NAME"           : "race"
	}
}








