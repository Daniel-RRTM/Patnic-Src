extends Node
class_name Statistics_Hub



static func getStatistics() -> void:
	Statistics_JSON_Generall.countCategoryEntries()
	print("CALCULATING STATISTICS...")
	print("MARKDOWNS")
	
	var toParse = [
		 {   "mode":"Components"        ,   "array":DemocrECS.getAllComponents().keys()                        ,   "path":"/Docs/Wiki/Docs/EntityAttributes/Components/Overview.md"   }
		,{   "mode":"Flags"             ,   "array":DemocrECS.getAllFlags()                                    ,   "path":"/Docs/Wiki/Docs/EntityAttributes/Flags/Overview.md"        }
		,{   "mode":"Templates"         ,   "array":DemocrECS.getAllTemplates().keys()                         ,   "path":"/Docs/Wiki/Docs/EntityAttributes/Templates/Overview.md"    }
		,{   "mode":"Properties"        ,   "array":DemocrECS.getAllProperties()                               ,   "path":"/Docs/Wiki/Docs/EntityAttributes/Properties/Overview.md"   }
		
		,{   "mode":"Roles"             ,   "array":API_001_Atlas.Role().getEntries().keys()                   ,   "path":"/Docs/Wiki/Docs/ActorAttributes/Roles/Overview.md"         }
		,{   "mode":"Specialties"       ,   "array":API_001_Atlas.Specialties().getEntries().keys()            ,   "path":"/Docs/Wiki/Docs/ActorAttributes/Specialties/Overview.md"   }
		,{   "mode":"Races"             ,   "array":API_001_Atlas.Race().getEntries().keys()                   ,   "path":"/Docs/Wiki/Docs/ActorAttributes/Races/Overview.md"         }
		,{   "mode":"SpawnTables"       ,   "array":API_001_Atlas.RNGActorTemplate().getEntries().keys()       ,   "path":"/Docs/Wiki/Docs/ActorAttributes/SpawnTables/Overview.md"   }
		
		,{   "mode":"Tiles"             ,   "array":API_001_Atlas.Tiles().getEntries().keys()                  ,   "path":"/Docs/Wiki/Docs/Chunk/Tiles/Overview.md"                   }
		,{   "mode":"Interactables"     ,   "array":API_001_Atlas.Interactables().getEntries().keys()          ,   "path":"/Docs/Wiki/Docs/Chunk/Interactables/Overview.md"           }
		,{   "mode":"TileSets"          ,   "array":API_001_Atlas.Tiles().getTileSetEntries().keys()           ,   "path":"/Docs/Wiki/Docs/Chunk/TileSets/Overview.md"                }
		
		,{   "mode":"Conditions"        ,   "array":API_001_Atlas.Conditions().getEntries().keys()             ,   "path":"/Docs/Wiki/Docs/Events/Conditions/Overview.md"             }
		,{   "mode":"Cmds"              ,   "array":API_008_CLI.getAllCmdMeta().keys()                         ,   "path":"/Docs/Wiki/Docs/Events/Cmds/Overview.md"                   }
		,{   "mode":"UniqueStatmods"   ,   "array":API_007_Statmod.getStatModNames()                          ,   "path":"/Docs/Wiki/Docs/Events/UniqueStatmods/Overview.md"         }
		 
		,{   "mode":"Meeles"            ,   "array":API_001_Atlas.KitParts().getKitGroup("MEELE").keys()       ,   "path":"/Docs/Wiki/Docs/KitParts/Meeles/Overview.md"               }
		,{   "mode":"Guns"              ,   "array":API_001_Atlas.KitParts().getKitGroup("GUN").keys()         ,   "path":"/Docs/Wiki/Docs/KitParts/Guns/Overview.md"                 }
		,{   "mode":"Armors"            ,   "array":API_001_Atlas.KitParts().getKitGroup("ARMOR").keys()       ,   "path":"/Docs/Wiki/Docs/KitParts/Armors/Overview.md"               }
		,{   "mode":"Cyberwares"        ,   "array":API_001_Atlas.KitParts().getKitGroup("CYBERWARE").keys()   ,   "path":"/Docs/Wiki/Docs/KitParts/Cyberwares/Overview.md"           }
		,{   "mode":"Hacks"             ,   "array":API_001_Atlas.KitParts().getKitGroup("HACK").keys()        ,   "path":"/Docs/Wiki/Docs/KitParts/Hacks/Overview.md"                }
		,{   "mode":"Drones"            ,   "array":API_001_Atlas.KitParts().getKitGroup("DRONE").keys()       ,   "path":"/Docs/Wiki/Docs/KitParts/Drones/Overview.md"               }
		,{   "mode":"Infusions"         ,   "array":API_001_Atlas.KitParts().getKitGroup("INFUSION").keys()    ,   "path":"/Docs/Wiki/Docs/KitParts/Infusions/Overview.md"            }
		,{   "mode":"Spells"            ,   "array":API_001_Atlas.KitParts().getKitGroup("SPELL").keys()       ,   "path":"/Docs/Wiki/Docs/KitParts/Spells/Overview.md"               }
		,{   "mode":"Rites"             ,   "array":API_001_Atlas.KitParts().getKitGroup("RITE").keys()        ,   "path":"/Docs/Wiki/Docs/KitParts/Rites/Overview.md"                }
		
		#,{   "mode":"Cmd"               ,   "array":API_008_CLI.getAllCmdMeta().keys()                         ,   "path":"/Docs/Wiki/Docs/Events/Cmds/Overview.md"                }
	]
	
	for current in toParse:
		Statistics_OverviewParser.calc(current.mode, current.path, current.array)
		
		for index in current.array:
			var object = Statistics_Util.getObjectByMode(current.mode,index)
			if object != null:
				
				var filepath = current.path.split(current.mode)[0]+current.mode+"/List/"+Statistics_Util.getIndexByMode(current.mode,index)+".md"
				Statistics_Util.runParserByMode(current.mode, object, filepath)
			

	
	
	print("STATISTICS COMPUTED")












