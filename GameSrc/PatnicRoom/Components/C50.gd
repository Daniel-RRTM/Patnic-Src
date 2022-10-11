extends Component
class_name C_50_VALUABLES

var value: Dictionary
var validPaths = []
var validInputs = {  "PERFORMANCE_ENHANCING_DRUGS" : [   "AMPHETAMINES" , "BARBITURATES" , "OPIOTS"     ]
					,"PRE_CRASH_DATA"              : [   "SCIENCE"      , "CULTURE"      , "META"       ]
					,"REAGENTS"                    : [   "SHAMANIC"     , "CHAOTIC"      , "HERMETIC"   ] }


func _init(valuePara:Array=[]):
	name = "C_50_VALUABLES"
	
	for type in validInputs.keys():   
		value[type] = {}
		for subType in validInputs[type]:    
			value[type][subType] = {}
			for rarity in range(1,11):
				value[type][subType][rarity] = 0
	
	if !valuePara.empty():
		for path in valuePara: add(path[0],path[1],path[2],path[3])


func get(type="",subType="",rarity="0"):
	type = type.to_upper() ; subType = subType.to_upper() ; rarity = int(rarity)
	if   !validInputs.keys().has(type)     or   type    == "" : return value
	elif !validInputs[type].has(subType)   or   subType == "" : return value[type]
	elif !rarity in range(11)              or   rarity  == 0  : return value[type][subType]
	else: return value[type][subType][int(rarity)]
	return {"N/A":"N/A"}



func substract(type="",subType="",rarity="",factor=1) -> void : add(type,subType,rarity,0-factor)
func add(type="",subType="",rarity="",factor=1) -> void:
	Signals.emit_signal("Player_Found_Valuables",{"keyword":"valuables"})
	type = type.to_upper() ; subType = subType.to_upper() ; rarity = int(rarity)
	value[type][subType][rarity] += factor
	validPaths.append([type,subType,rarity,value[type][subType][rarity]])
	_refreshValidPaths()



func _refreshValidPaths() -> void : 
	for path in validPaths: 
		if get(path[0],path[1],path[2]) == 0: 
			validPaths.erase(path)



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "unique Title",
	"validInputs" : [],
	"validType"   : getType_quack(),
	"nameToShow"  : "Streetname",
	"configKey"   : "street-name"
}
static func getType_quack(): return "Dictionary"
