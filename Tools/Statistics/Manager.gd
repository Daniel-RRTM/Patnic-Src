extends Node
class_name Statistics_Hub



var uniqueParser = [{ "title":"Components"    , "class":Statistics_components_MD },
					{ "title":"Kitparts"      , "class":Statistics_MD_Kitparts   },
					{ "title":"Enum"          , "class":Statistics_enum_MD       },
					{ "title":"Tiles"         , "class":Statistics_Tiles_MD      }]



var atlasParser =  [{ "title":"Tile"          , "atlas":API_001_Atlas.Tiles().getEntries()         },
					{ "title":"Interactables" , "atlas":API_001_Atlas.Interactables().getEntries() },
					{ "title":"Roles"         , "atlas":API_001_Atlas.Role().getEntries()          },
					{ "title":"Races"         , "atlas":API_001_Atlas.Race().getEntries()          },
					{ "title":"Specialties"   , "atlas":API_001_Atlas.Specialties().getEntries()   }]



func getStatistics():
	print("CALCULATING STATISTICS...")
	print("MARKDOWNS")
	getMDFiles()
	print("JSONS")
	#getJSONFiles()
	print("STATISTICS COMPUTED")




func getMDFiles():
	for type in atlasParser:   Statistics_Overview.calc(type.atlas.keys(),type.title)
	Statistics_Overview.calc(API_001_Atlas.KitParts().baseKitParts,"BaseKitParts")
	Statistics_Overview.calc(API_001_Atlas.Tiles().atlas_Tilesets,"TileSets")

	Statistics_CmdList.calc()
	Statistics_NamingsList.calc()
	Statistics_Conditions.calc()
	Statistics_UniqueStatmods.calc()
	Statistics_Flags.calc()
	Statistics_Properties.calc()
	
	
	
	var parserClasses = []
	for category in atlasParser  : parserClasses.append(AtlasStatistics.new(category))
	for category in uniqueParser : parserClasses.append(DefaultStatistic.new(category))
	for parser in parserClasses: parser.run()
	
	







#>>> DEFAULT <<<#
class DefaultStatistic:
	var categoryName:String  ;  var calculatorReference
	func run(): 
		calculatorReference.calc()
		print(">  "+categoryName)
	
	func _init(toCalc:Dictionary) -> void:
		calculatorReference = toCalc.class
		categoryName = toCalc.title




#>>> ATLAS <<<#
class AtlasStatistics:
	var categoryName:String ; var atlasDict:Dictionary  ;  var filepathToSave:String
	func run(): 
		Statistics_atlas_MD.calc(atlasDict, categoryName, filepathToSave)
		print(">  "+categoryName) 
	
	func _init(toCalc:Dictionary):
		filepathToSave = Gameloop.absolutefilePath+"/Docs/Wiki/docs/SubAtlas/"+toCalc.title+".md"
		categoryName = toCalc.title 
		atlasDict = toCalc.atlas














