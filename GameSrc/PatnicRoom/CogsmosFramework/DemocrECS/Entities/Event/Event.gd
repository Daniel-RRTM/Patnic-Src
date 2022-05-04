extends Entity
# DOCS  > Docs\API\docs\Cogsmos\democrECS\Event.md                             
# DOCS  > TO ADD                                                               
class_name EventEntity


# ----- GETTER ------------------------------------------------------------- ##


func getPackage(packageName:String) -> Array: return main()[packageName].values()


func getConcept(packageName:String, conceptName:String, conceptNr:int=0) -> Dictionary : 
	for concept in main()[packageName].keys():
		if concept == conceptName and conceptNr == 0 : return main()[packageName][concept]
		else : conceptNr -= 1
	return {}



# ----- PROXY FUNCTIONS ---------------------------------------------------- ##

#>>> General <<<#


func by()          -> String     : return getCompValue("C_71_EVENTT_BY")
func use()         -> String     : return getCompValue("C_72_LEC_META_USE")
func index()       -> String     : return getCompValue("C_12_ATLAS_INDEX")
func description() -> String     : return getCompValue("C_74_EVENT_DESCRIPTION")
func main()        -> Dictionary : return getCompValue("C_74_EVENT_MAIN_DICT")



#>>> Specifics <<<#


func getSource()         -> String : return getCompValue("C_74_EVENT_MAIN_DICT")["SELECT"]["SEIZE"][1][1]
func getMedium()         -> String : return getCompValue("C_74_EVENT_MAIN_DICT")["SELECT"]["SEIZE"][0][1]
func getReach()          -> String : return getCompValue("C_74_EVENT_MAIN_DICT")["SELECT"]["SEIZE"][2][1]
func getConsider()       -> String : return getCompValue("C_74_EVENT_MAIN_DICT")["SELECT"]["CONSIDER"]
func getRunPerformance() -> Array  : return getCompValue("C_74_EVENT_MAIN_DICT")["RUN"]["PERFORM"]




