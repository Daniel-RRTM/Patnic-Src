extends Node
class_name _API_017_Cmd_SpawnCustomeActor


# ----- DOC ------------------------------------------------------------------ ##


static func getAutoDoc() -> Dictionary:
	return{	"toString"  : "Spawn custome Actor"                    ,
			"parameter" : ["Race","Role","Specialty"]                             ,
			"list"      : [API_001_Atlas.Race().getEntries().keys(), API_001_Atlas.Role().getEntries().keys(), API_001_Atlas.Specialties().getEntries().keys()] ,
			"group"     : "spawn"                              ,
			"input"     : "spawn cstm actor"                         }



# ----- OPERTATION ----------------------------------------------------------- ##


static func run(parameter:Array) -> void:
	var playerPos    = API_003_Player.currentChar.pos()
	var saniticedPos = Vector2(playerPos.x+2, playerPos.y+2)
	
	var templateName = parameter[0]
	
	var actorEnt     = API_010_ProcGen_Actor.createActorSpecific(parameter)
	
	actorEnt.setPos(saniticedPos)
	SokraTiles.getActor().addActor(actorEnt)


