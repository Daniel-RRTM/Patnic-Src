extends Entity
# DOCS  > Docs\API\docs\Cogsmos\democrECS\ActorRNGTemplate.md                  
# DOCS  > TO ADD                                                               
class_name ActorRngTemplateEntity


# ----- PROXY FUNCTIONS ---------------------------------------------------- ##

#>>> General <<<#


func by()          -> String      :   return getCompValue("C_71_LEC_META_BY")
func use()         -> String      :   return getCompValue("C_72_LEC_META_USE")
func index()       -> String      :   return getCompValue("C_12_ATLAS_INDEX")
func declaration() -> Dictionary  :   return getCompValue("C_74_EVENT_MAIN_DICT")["DECLARATION"]
	


#>>> Core <<<#


func role()        -> Array       :   return declaration()["MAIN"]["ROLE"]
func race()        -> Array       :   return declaration()["MAIN"]["RACE"]
func specialty()   -> Array       :   return declaration()["MAIN"]["SPECIALTY"]
func tratit()      -> Array       :   return declaration()["CHARACTERISTICS"]["TRAIT"]



#>>> ToString <<<#


func lootTable()   -> Array       :   return declaration()["CHARACTERISTICS"]["LOOT_TABLE"]

	

#>>> Gear <<<#


func kitset()      -> Array       :   return declaration()["GEAR"]["KITSET"]
func item()        -> Array       :   return declaration()["GEAR"]["ITEM"]

