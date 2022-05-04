extends Entity
# DOCS  > Docs\API\docs\Cogsmos\democrECS\Conddition.md                        
# DOCS  > TO ADD                                                               
class_name ConditionEntity


# ----- INITIALICE --------------------------------------------------------- ##


var affectedEnt : Entity
var effects     : Array = []
var level       : int
var duration    : int
 


# ----- PROXY FUNCTIONS ---------------------------------------------------- ##

#>>> General <<<#


func use()           -> String     : return getCompValue("C_72_LEC_META_USE")
func index()         -> String     : return getCompValue("C_12_ATLAS_INDEX")
func by()            -> String     : return getCompValue("C_71_EVENTT_BY")
func name()          -> String     : return getCompValue("C_6_NAME")
func description()   -> String     : return getCompValue("C_0_DESCRIPTION")
func texture()       -> String     : return getCompValue("C_12_ATLAS_INDEX")



# ----- LOGTIC ------------------------------------------------------------- ##


func run():
	for effect in effects:   SYNTAX.EVENT.EFFECTS[effect["NAME"]].run(self,effect)
	duration -= 1
	
	if duration == 0:
		affectedEnt.conditions.erase(name())
		self.queue_free()


