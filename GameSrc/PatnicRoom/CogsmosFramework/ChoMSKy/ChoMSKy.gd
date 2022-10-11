extends Node

# MAPPED SYNTAX KEYNOTES

# REFACTOR ARR TO DICT IN COND : SYNTAX.EVENT.EFFECTS[saniticedStep[0]].getArrToDict(saniticedStep)

# TO DELETE
# 
# EVENT_SYNTAX 
# SYNTAX


func getSystemManager(name:String)                : return parser[name]["_manager"] 
func getOperation(system:String,operation:String) : return parser[system][operation]


# TODO DOCS FÜR SYNTAX

var parser = {
	# ====================================================== #
	"medium":{
		# META
		"_manager"                : API_005_Event.medium()
		# IMPLEMENTED
		,"linea"                  : API_005_Event.medium().linea()				# DONE
		,"area"                   : API_005_Event.medium().area()				# DONE
		,"select"                 : API_005_Event.medium().select()				# DONE
		,"self"                   : API_005_Event.medium().mediumSelf()			# DONE
		# WIP
		,"universal"              : API_005_Event.medium().universal()			# DONE
		,"quader"                 : API_005_Event.medium().quad()				# DONE
		,"cone"                   : API_005_Event.medium().cone()				# DONE
	},
	# ====================================================== #
	"source":{
		# META
		"_manager"                : API_005_Event.source()
		# IMPLEMENTED
		,"self"                   : API_005_Event.source().mediumSelf()			# DONE
	},
	# ====================================================== #
	"consider":{
		# META
		"_manager"                : API_005_Event.consider()
		# IMPLEMENTED
		,"template"               : API_005_Event.consider().template()
		,"comp"                   : API_005_Event.consider().comp()				# DONE
		,"cond"                   : API_005_Event.consider().cond()				# DONE
		,"flag"                   : API_005_Event.consider().flag()
		,"prop"                   : API_005_Event.consider().prop()
		,"type"                   : API_005_Event.consider().type()
	},
	# ====================================================== #
	"perform":{
		# META
		"_manager"                : API_005_Event.perform()
		# IMPLEMENTED
		,"comp"                   : API_005_Event.perform().comp()
		,"cond"                   : API_005_Event.perform().cond()
		,"cmd"                    : API_005_Event.perform().cmd()
		,"flag"                   : API_005_Event.perform().flag()
		,"prop"                   : API_005_Event.perform().prop()
		,"uniq"                   : API_005_Event.perform().uniq()
		,"msg"                    : API_005_Event.perform().msg()
		,"passive"                : API_005_Event.perform().passive()
	},
	# ====================================================== #
	"condition":{
		# META
		 "_manager"               : API_006_Condition.effect()
		,"entries"                : API_001_Atlas.Conditions().getEntries()
		# IMPLEMENTED
		,"affecting"              : API_006_Condition.effect().affecting()
		,"constraining"           : API_006_Condition.effect().constraining()
		,"spreading"              : API_006_Condition.effect().spreading()
		
	},
	# ====================================================== #
	"uniqueStatmod":{
		# META
		"_manager"                : API_007_Statmod.uniqueStatmods()
		# IMPLEMENTED
		,"dealPlainDamage"        : API_007_Statmod.uniqueStatmods().dealPlainDamage()
		,"dropLootFilter"         : API_007_Statmod.uniqueStatmods().dropLootFilter()
		,"exchangeTexture"        : API_007_Statmod.uniqueStatmods().exchangeTexture()
		,"moveTile"               : API_007_Statmod.uniqueStatmods().moveTile()
		,"spawnTileAround"        : API_007_Statmod.uniqueStatmods().spawnTileAround()
		,"spawnTile"              : API_007_Statmod.uniqueStatmods().spawnTile()
	},
	# ====================================================== #
	"spawnTable":{
		# META
		 "_manager"               : API_010_ProcGen_Actor.actorAttribute()
		,"entries"                : API_001_Atlas.RNGActorTemplate().getEntries()
		# IMPLEMENTED
		,"race"                   : API_010_ProcGen_Actor.actorAttribute().race()
		,"role"                   : API_010_ProcGen_Actor.actorAttribute().role()
		,"Specialty"              : API_010_ProcGen_Actor.actorAttribute().specialty()
	},
	# ====================================================== #
	"lootFilter":{
		# META
		 "_manager"               : API_011_ProcGen_Loot.lootFilter()
		,"entries"                : API_001_Atlas.LootFilter().getEntries()
		# IMPLEMENTED
		,"valuables"              : API_011_ProcGen_Loot.lootFilter().valuables()
	},
	# ====================================================== #
	"Command":{
		# META
		 "_manager"               : API_008_CLI.commands()
		# IMPLEMENTED
		,"spawnCstmActor"         : API_008_CLI.commands().spawnCstmActor()
		,"spawnTemplateActor"     : API_008_CLI.commands().spawnCstmActor()
		,"allKitParts"            : API_008_CLI.commands().allKitParts()
		,"uniqueMap"              : API_008_CLI.commands().uniqueMap()
		,"storyMap"               : API_008_CLI.commands().storyMap()
		,"addCredits"             : API_008_CLI.commands().addCredits()
		,"spawnTile"              : API_008_CLI.commands().spawnTile()
		,"restmode"               : API_008_CLI.commands().restmode()
		,"noClip"                 : API_008_CLI.commands().noClip()
	},
	# ====================================================== #
	"Quest":{
		# META
		  "_manager"              : API_015_Quest.listener()
		 ,"entries"               : API_001_Atlas.Quest().getEntries()
		# IMPLEMENTED
		,"restIn"                 : API_015_Quest.listener().restIn()
		,"kill"                   : API_015_Quest.listener().kill()
	}
}


var compareSyntax = [ "NOT" , "EQUALS" , "LESS" , "MORE" ]









# STUB 100_OF_100           
# STUB 90_OF_PACKAGE        
# STUB   CONSIDER: FOR ALT >
# STUB   RUN[ ALT:          
# STUB   MAX 3  KIT_USE IF *CONSIDER* 
# STUB   MIN 99  STEPS ON *CONSIDER* 



var CONDITION = {
# STUB PERFORM: AFFECTED EXCLUSIVE FOR CONDITION
# STUB       CONSIDER:
# STUB       PERFORM: AFFECTED/SELF/FILE >
}
var RNG_ACTOR_TEMPLATE = {
	# REFACTOR WORK LIKE LOOT_FILTER
}
var LISTENER = {
}
var LOOT_FILTER = {
	#,"ASSURED"    : ""    # STUB        
	#,"IF"         : ""    # STUB will be given under circumstances(reuse CONSIDER)        IF: SELF > COMP C_6_NAME EQUALLS CHUMMER > KITPART X_H_2
}





