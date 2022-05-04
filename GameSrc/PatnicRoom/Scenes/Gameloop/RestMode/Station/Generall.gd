extends Node2D

var kitset:KitSetEntity
var metaValues = Rest_Form_Getter.getFormMeta()



func _ready():
	get_node("background").texture = Utils.rng().getRngBackground()
	Gameloop.scene                 = self
	var mTypeValues                = metaValues[Davinci.externalCachedInput]
	API_003_Player._005_Common_Station.changeStation(Davinci.externalCachedInput)
	get_node("Title").initialice(mTypeValues["symbols"])
	
	
	
	var maxKits = API_003_Player.currentChar.getCompValue("C_25_MAX_KITSETS")
	var kitSets = API_003_Player.currentChar._005_Common_Kitventory.gearedKitset.listOfKits.values()
	
	get_node("geared_kitset_table").loadKitsets(kitSets,maxKits)
	
	for i in kitSets.size():
		var cat = kitSets[i].base.catType()
		var currentStationCat = ENUM.KITS.CATEGORIES[Davinci.externalCachedInput]
		
		if !currentStationCat.keys().has(cat):
			get_node("geared_kitset_table/Kitsets/VBoxContainer/"+str(i)+"/block").visible = true




func buildKitset() -> void:
	API_003_Player.getCurrent_005_Common_Stationetter().confirmTask()
	get_node("Title").loadToString()
	get_node("Title").reminderToString()


func loadKitsetToString(kitSet):
	get_node("kitset to mod/kitset_to_string").loadKitset(kitSet)
	get_node("kitset to mod").visible = true





