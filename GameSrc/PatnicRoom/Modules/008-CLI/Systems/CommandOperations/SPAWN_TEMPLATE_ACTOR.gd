extends Node
class_name _API_017_Cmd_SpawnTemplateActor


# ----- DOC ------------------------------------------------------------------ ##


static func getAutoDoc() -> Dictionary:
	return{	"toString"  : "spawn random actor above"                       ,
			"parameter" : ["template"]                                     ,
			"list"      :  [API_001_Atlas.RNGActorTemplate().getEntries().keys()] ,
			"group"     : "spawn"                                          ,
			"input"     : "spawn temp actor"                                    }



# ----- OPERTATION ----------------------------------------------------------- ##


static func run(parameter:Array) -> void:
	var playerPos    = API_003_Player.currentChar.pos()
	var saniticedPos = Vector2(playerPos.x+2, playerPos.y+2)
	
	var templateName = parameter[0]
	
	var templateEnt  = API_001_Atlas.RNGActorTemplate().getEntry(templateName)
	var actorEnt     = API_010_ProcGen_Actor.RNGenerateBasicActor(templateEnt)
	
	actorEnt.setPos(saniticedPos)
	SokraTiles.getActor().addActor(actorEnt)


