extends Button


onready var currentKitSetDetails = get_node("../../../parent")
onready var station = get_node("../../../..")

func _on_press(kitPartEnum,modeEnum) -> void:
	if !API_003_Player.stations.currentStation.isCounting:
		API_003_Player.stationSetter.setMode(modeEnum)
		API_003_Player.stationSetter.setKitset(currentKitSetDetails.kitSetEnt)
		var kitsetToBuild = currentKitSetDetails.kitSetEnt
	
	match kitPartEnum:
		ENUM.KITS.PARTS.BASE: API_003_Player.stationSetter.setKitPartToMod(API_003_Player.stations.currentStation.kitset.base)
		ENUM.KITS.PARTS.MOD: API_003_Player.stationSetter.setKitPartToMod(API_003_Player.stations.currentStation.kitset.mod)
		ENUM.KITS.PARTS.APPENDIX: API_003_Player.stationSetter.setKitPartToMod(API_003_Player.stations.currentStation.kitset.appendix)
	
	get_node("../../../../KitSetOverview/Build").visible = true
	get_node("../../../../KitSetOverview").visible = true
	get_node("../../../../KitSetOverview/parent/Window/Frame2").visible = true
	get_node("../../../../KitSetOverview/parent/Merge").visible = true
