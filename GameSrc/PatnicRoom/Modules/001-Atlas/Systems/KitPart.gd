extends DemokrECTS_Atlas
class_name _001_Kitparts
 

# ----- INITIALICE ----------------------------------------------------------- ##


var cache = {}

var baseKitParts		= {}
var modKitParts			= {}
var appendixKitParts	= {}

var nameIndexCrossRef	= {}
var allBasekitGroups    = {}


func _init() -> void : 
	allBasekitGroups["ALL"] = {}
	for cat in ENUM.KITS.CATEGORY.values(): allBasekitGroups[cat] = {}
	classOfEntries as Entity


func sortEntries():
	for entry in cache.values(): 
		var familyIndex = entry.index().split("__")[0]
		entry.addComponent(C_69_KITSET_FAMILY.new(familyIndex))
		
		match entry.partType():
			ENUM.KITS.PARTS.BASE     : baseKitParts[entry.index()]     = entry
			ENUM.KITS.PARTS.MOD      : modKitParts[entry.index()]      = entry
			ENUM.KITS.PARTS.APPENDIX : appendixKitParts[entry.index()] = entry
		entryComponentRef[entry.index()] = entry.components.keys()
		atlasEntry[entry.index()] = entry
	
	
	for entry in baseKitParts.values():
		var entrySubclass = KitpartEntry.new(entry)
		var catEnum       = ENUM.KITS.CATEGORY[entry.catType().to_upper()]
		allBasekitGroups[catEnum][entry.index()] = entrySubclass
		allBasekitGroups["ALL"][entry.index()] = entrySubclass
	cache.clear()



# ----- SETTER --------------------------------------------------------------- ##


func getCachedEntry(index:String) -> Entity : 
	return cache[index] as Entity

func getEntryByName(name:String) -> Entity:
	return atlasEntry[nameIndexCrossRef[name]] as Entity



func getKitGroup(string_enum_kitCat) -> Dictionary:
	if string_enum_kitCat is String : return allBasekitGroups[ENUM.KITS.CATEGORY[string_enum_kitCat.to_upper()]]
	elif string_enum_kitCat != -1   : return allBasekitGroups[string_enum_kitCat]
	return {}



# ----- SETTER --------------------------------------------------------------- ##


# FUNC > OVER-RIDE 
func addEntity(ent,compIndex="NOT_USED_HERE"):
	if ent is KitPartEntity:
		if !atlasEntry.has(ent):
		
			cache[ent.index()] = ent
			nameIndexCrossRef[ent.name()] = ent.index()
		
		else: printerr("Error in Atlas_TileEntity! ["+str(ent.name())+"] already exists")
	else: printerr("Error in Atlas_TileEntity! ["+(ent.name())+"] could not be added")



# ----- HELPER --------------------------------------------------------------- ##


class KitpartEntry:
	var baseKit
	var modArr = {}
	var appendixArr = {}

	func _init(basepara) -> void:
		baseKit = basepara
		for entry in API_001_Atlas.KitParts().getEntries().values():
			if entry.index().begins_with(baseKit.index()): 
				if entry.partType()==ENUM.KITS.PARTS.MOD      : modArr[entry.index()] = entry
				if entry.partType()==ENUM.KITS.PARTS.APPENDIX : appendixArr[entry.index()] = entry



