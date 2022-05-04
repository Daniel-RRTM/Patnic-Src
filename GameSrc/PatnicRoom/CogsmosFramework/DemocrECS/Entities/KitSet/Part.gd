extends Entity
# DOCS  > Docs\API\docs\Cogsmos\democrECS\KitPart.md                           
# DOCS  > TO ADD                                                               
# BOOKMARK[epic=Entities] KitPart                                              
class_name KitPartEntity


# ----- PROXY FUNCTIONS ---------------------------------------------------- ##

#>>> General <<<#


func name() 				-> String: 			return getCompValue("C_6_NAME")
func decription()   		-> String:			return getCompValue("C_0_DESCRIPTION")
func index() 				-> String: 			return getCompValue("C_12_ATLAS_INDEX")



#>>> Categories <<<#


func mType()      			-> String: 			return getCompValue("C_37_M_TYPE")
func catType()   		    -> String:			return getCompValue("C_31_KIT_CAT_TYPE")
func partType()        		-> int:				return getCompValue("C_38_KIT_PART_TYPE")
func family()               -> String: 			return getCompValue("C_69_KITSET_FAMILY") 



#>>> ToString <<<#


func mechanicalSummary()    -> String:			return getCompValue("C_35_KIT_MECHANICAL_SUMMARY")
func modTime()           	-> String: 			return getCompValue("C_36_KIT_MOD_TIME")
func cooldownTime()     	-> bool: 			return getCompValue("C_33_COOLDOWN_TIMER")



#>>> Usage <<<#


func rarity()    			-> String:			return getCompValue("C_48_RARITY")
func event()                -> EventEntity:		return getCompValue("C_49_EVENT_REFERENCE")


	
