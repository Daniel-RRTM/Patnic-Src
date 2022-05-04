extends Entity 
# DOCS  > Docs\API\docs\Cogsmos\democrECS\Kitset.md                            
# DOCS  > TO ADD                                                               
# BOOKMARK[epic=Entities] KitSet                                               
class_name KitSetEntity


# ----- INITIALICE --------------------------------------------------------- ##


# VAR > Single Parts            
var base     : KitPartEntity
var mod      : KitPartEntity
var appendix : KitPartEntity

# VAR > Merged Event            
var event : Dictionary


# VAR > instanced timer         
var currentCooldownTime : int
# VAR > general timer of kitset 
var cooldownTime : int		
# VAR > combined name of three  
var toString : String 	                 



# ----- PROXY FUNCTIONS ---------------------------------------------------- ##


func selectedPositions()    -> Array      :   return getCompValue("C_53_SELECTED_POSITIONS")
func selectedEntities()     -> Array      :   return getCompValue("C_54_SELCTED_ENTITIES")
func triggerableEntities()  -> Array      :   return getCompValue("C_55_TRIGGERABLE_ENTITIES")



# ----- GETTER --------------------------------------------------------------- ##


# FUNC > uses BB-Code of RTL-Nodes 
func getFormatedCooldownTimer():
	if currentCooldownTime == cooldownTime :   return "[color=green]READY[/color]"
	else                                   :   return "[color=yellow]"+str(cooldownTime-currentCooldownTime)+"[/color]"
func hasMod()               -> bool        :   return is_instance_valid(mod)
func hasAppendix()          -> bool        :   return is_instance_valid(appendix)
func getMergedEvent()             -> Dictionary  :   return event

