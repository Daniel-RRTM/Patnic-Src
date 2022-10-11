extends Object
class_name _Alecandria_Parser_Util


const SECTOR_SEPARATOR  = "//==============================================================================\\\\"
const SECTOR_BEGIN     = "{"
const SECTOR_END       = "}"

const PACKAGE_SEPARATOR = "//------------------------------------------------------------------------------\\\\"
const PACKAGE_BEGIN     = "["
const PACKAGE_END       = "]"

const KEY_VALUE_SEPARATOR = "--->"


static func loadContent(filePath:String) -> Array :
	var file = File.new()
	file.open(filePath, File.READ)
	return file.get_as_text().split("\n") as Array
	file.close()



static func removeSeparators(content:Array,toReturn = []) -> Array:
	for line in content: 
		if ![SECTOR_SEPARATOR,PACKAGE_SEPARATOR].has(line):
			if !line.empty(): toReturn.append(line)
	return toReturn



static func scopeSector(content:Array) -> Dictionary:
	var currentMode   = "EMPTY"
	var scopedContent = {  "META":[] , "MAIN":[] , "REFERENCES":[]   }
	for line in content:
		if   currentMode == "EMPTY" : currentMode = line.rstrip(SECTOR_BEGIN)
		elif line == SECTOR_END     : currentMode = "EMPTY"
		else                        : scopedContent[currentMode].append(line.lstrip(" "))
	return scopedContent




static func getEntityByType(type:String) -> Entity :
	match type:
		"RACE"            : return Entity.new()
		"ROLE"            : return Entity.new()
		"SPECIALTY"       : return Entity.new()
		"CONNECTION"      : return ActorEntity.new()
		"ACTOR_RNG_TABLE" : return ActorRngTemplateEntity.new()
		"CONDITION"       : return ConditionEntity.new()
		"KITPART_BASE"    : return KitPartEntity.new() as Entity
		"KITPART_MOD"     : return KitPartEntity.new() as Entity
	return Entity.new()


# BOOKMARK[epic=Cogsmos] Alecandria --- Package Parser                                
static func getPackageParserByKeyWord() -> Dictionary:
	return{
		 "COMPONENTS" : _Alecandria_LecToEnt_PackageComponents
		,"FLAGS"      : _Alecandria_LecToEnt_PackageFlag
		,"PROPERTIES" : _Alecandria_LecToEnt_PackageProperties
		,"SELECT"     : _Alecandria_LecToEnt_PackageSelect
		,"RUN"        : _Alecandria_LecToEnt_PackageRun
		,"TABLE"      : _Alecandria_LecToEnt_PackageTable
		,"UPGRADE"    : _Alecandria_LecToEnt_PackageUpgrade
		,"CONDITION"  : _Alecandria_LecToEnt_PackageEffect
		,"LISTENER"   : _Alecandria_LecToEnt_PackageListener
		,"LOOTFILTER" : _Alecandria_LecToEnt_PackageLootFilter

	} 















static func addToAtlas(ent,filepath):
	if !ent.hasComp("C_12_ATLAS_INDEX"): HomErrorLog.printIntoSeshLog("BOOT","[color=red]CRITICAL: [color=white] \""+filepath+"\" has no INDEX for referencing")
	if isValid(ent):
			
			match ent.getCompValue("C_72_LEC_META_USE"):
				"CONNECTION"        : API_001_Atlas.Connection().addEntity(ent)
				"KITPART_BASE"      : API_001_Atlas.KitParts().addEntity(ent)
				"QUEST"             : API_001_Atlas.Quest().addEntity(ent)
				"LOOT_FILTER"        : API_001_Atlas.LootFilter().addEntity(ent)
				"KITPART_MOD"       : API_001_Atlas.KitParts().addEntity(ent)
				"ACTOR_ROLE"        : API_001_Atlas.Role().addEntity(ent)
				"CONDITION"         : API_001_Atlas.Conditions().addEntity(ent,"C_6_NAME")
				"ACTOR_RNG_TABLE"   : API_001_Atlas.RNGActorTemplate().addEntity(ent)
				"ACTOR_RACE"        : API_001_Atlas.Race().addEntity(ent)
				"ACTOR_SPECIALTY"   : API_001_Atlas.Specialties().addEntity(ent)


	
static func isValid(ent):
	for compToString in ENUM.LEC.TYPES_METADATA[ent.getCompValue("C_72_LEC_META_USE")]["MANDATORY"]: 
		if !ent.hasComp(compToString): 
			HomErrorLog.printIntoSeshLog("BOOT","[color=yellow]EXCEPTION:  [color=yellow]"+ent.getCompValue("C_12_ATLAS_INDEX")+"[color=whiteis missing Component:[color=yellow]"+compToString)
			printerr("Parsing went wrong! look into sessionLog.csv for more info!")
			return false
	return true

