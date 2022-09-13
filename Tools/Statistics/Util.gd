extends Node
class_name Statistics_Util



static func getIndexByMode(mode:String,compName:String) -> String:
	match mode:
		"Properties" : return str(DemocrECS.getAllProperties().find(compName))
		"Components" : return compName.split("_")[1]
		"Templates"  : return DemocrECS.getAllTemplates()[compName]
		"Flags"      : return str(DemocrECS.getAllFlags().find(compName))
		
		"Meeles"     : return API_001_Atlas.KitParts().getEntry(compName).name()
		"Guns"       : return API_001_Atlas.KitParts().getEntry(compName).name()
		"Armors"     : return API_001_Atlas.KitParts().getEntry(compName).name()
		"Hacks"      : return API_001_Atlas.KitParts().getEntry(compName).name()
		"Cyberwares" : return API_001_Atlas.KitParts().getEntry(compName).name()
		"Drones"     : return API_001_Atlas.KitParts().getEntry(compName).name()
		"Spells"     : return API_001_Atlas.KitParts().getEntry(compName).name()
		"Infusions"  : return API_001_Atlas.KitParts().getEntry(compName).name()
		"Rites"      : return API_001_Atlas.KitParts().getEntry(compName).name()
		
		_            : return compName
	return ""



static func getObjectByMode(mode:String,compName:String):
	match mode:
		"Components"    : return DemocrECS.getAllComponents()[compName].getAutoDoc()
		"Templates"     : return DemocrECS.getAllTemplates()[compName]
		"Properties"    : return null
		"Flags"         : return null
		
		"Roles"         : return API_001_Atlas.Role().getEntry(compName)
		"Races"         : return API_001_Atlas.Race().getEntry(compName)
		"Specialties"   : return API_001_Atlas.Specialties().getEntry(compName)
		"SpawnTables"   : return API_001_Atlas.RNGActorTemplate().getEntry(compName)
		
		"TileSets"      : return API_001_Atlas.Tiles().getTilesOfSet(compName)
		"Tiles"         : return API_001_Atlas.Tiles().getEntry(compName)
		"Interactables" : return API_001_Atlas.Interactables().getEntry(compName)
		
		"Meeles"        : return API_001_Atlas.KitParts().getEntry(compName)
		"Guns"          : return API_001_Atlas.KitParts().getEntry(compName)
		"Armors"        : return API_001_Atlas.KitParts().getEntry(compName)
		"Hacks"         : return API_001_Atlas.KitParts().getEntry(compName)
		"Cyberwares"    : return API_001_Atlas.KitParts().getEntry(compName)
		"Drones"        : return API_001_Atlas.KitParts().getEntry(compName)
		"Spells"        : return API_001_Atlas.KitParts().getEntry(compName)
		"Infusions"     : return API_001_Atlas.KitParts().getEntry(compName)
		"Rites"         : return API_001_Atlas.KitParts().getEntry(compName)
		
		"Cmds"         : return API_008_CLI.getAllCmdMeta()[compName]
		"UniqueStatmods" : return API_007_Statmod.getStatMods()[compName].getDoc()
		"Conditions" : return API_001_Atlas.Conditions().getEntry(compName)
		
		_            : return compName
	return ""




static func runParserByMode(mode:String,compName,filepath:String):
	match mode:
		"Components"    : Statistics_Parser_Component.calc(compName,filepath)
		"Templates"     : pass
		"Properties"    : pass
		"Flags"         : pass
		
		"Roles"         : Statistics_Parser_Generall.calc(mode,filepath,compName)
		"Races"         : Statistics_Parser_Generall.calc(mode,filepath,compName)
		"Specialties"   : Statistics_Parser_Generall.calc(mode,filepath,compName)
		"SpawnTables"   : Statistics_Parser_Generall.calc(mode,filepath,compName)
		
		"TileSets"      : pass # STUB    
		"Tiles"         : Statistics_Parser_Generall.calc(mode,filepath,compName)
		"Interactables" : Statistics_Parser_Generall.calc(mode,filepath,compName)
		
		# STUB    JUST CORE NEED MODS   
		"Meeles"        : Statistics_Parser_KitParts.calc(mode,filepath,compName)
		"Guns"          : Statistics_Parser_KitParts.calc(mode,filepath,compName)
		"Armors"        : Statistics_Parser_KitParts.calc(mode,filepath,compName)
		"Hacks"         : Statistics_Parser_KitParts.calc(mode,filepath,compName)
		"Cyberwares"    : Statistics_Parser_KitParts.calc(mode,filepath,compName)
		"Drones"        : Statistics_Parser_KitParts.calc(mode,filepath,compName)
		"Spells"        : Statistics_Parser_KitParts.calc(mode,filepath,compName)
		"Infusions"     : Statistics_Parser_KitParts.calc(mode,filepath,compName)
		"Rites"         : Statistics_Parser_KitParts.calc(mode,filepath,compName)

		"Conditions"    : Statistics_Parser_Generall.calc(mode,filepath,compName)
		"Cmds"          : Statistics_Parser_Cmd.calc(compName,filepath)
		"UniqueStatmods": Statistics_Parser_UniqueStatmods.calc(compName,filepath)
		
		
		_            : pass


