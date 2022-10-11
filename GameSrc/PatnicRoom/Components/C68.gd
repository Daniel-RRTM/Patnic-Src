extends Component
class_name C_68_KITVENTORY


var listOfKits: Dictionary = {}

func _init(para) -> void:
	self.name = "C_68_KITVENTORY"
	for kitPart in para:
		listOfKits[kitPart.index()] = kitPart


func getKitSetDict():                  			return listOfKits

func getKitSetByString(kitToString:String):    	return listOfKits[kitToString]
func getKitSetByNr(kitsetNr:int):      			return listOfKits.values()[kitsetNr]


func addKitSet(kitset):
	Signals.emit_signal("Player_Found_KitPart",{"keyword":"kitparts","index":kitset.index()})
	var kitPartEnt
	if kitset is String: 		kitPartEnt = API_001_Atlas.KitParts().getEntry(kitset)
	if kitset is KitPartEntity: kitPartEnt = kitset
	
	if is_instance_valid(kitPartEnt):
		listOfKits[kitPartEnt.index()] = kitPartEnt

func removeKitset(kitset) -> void:
	if kitset is String:
		listOfKits[kitset].queue_free()
		listOfKits.erase(kitset)
	if kitset is KitPartEntity: 
		var index = kitset.index()
		listOfKits[index].queue_free()
		listOfKits.erase(index)


static func getType_quack():   return "ARRAY"
static func getAutoDoc():
	return{
		"suggestion"  : "",
		"description" : "name of its fightingstyle",
		"validInputs" : [],
		"validType"   : getType_quack(),
		"nameToShow"  : "role description",
}
