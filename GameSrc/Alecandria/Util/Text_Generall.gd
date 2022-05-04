extends Node
class_name _TextToolBox_Lists_GenerallStrings



##############
# MAIN MENUE #
##############

static func getMainMenue() -> String:
	var cache = ""
	
	cache += "\nPatnicRoom\n"
	cache += "    TextToolBox! \n\n\n\n"
	cache += "<<Menue>>\n\n"
	cache += "o Introduction\n"
	cache += "o Design\n"
	cache += "o Browse\n"
	cache += "o Option"
	
	cache += "\n\n\n\n\n\n"
	cache += "to select press in line enter"
	cache += "\n\n\n\n\n\n\n\n\n\n\n\n"
	
	return cache



#############
# SELECTION #
#############

static func getSelection() -> String:
	var cache = ""
	
	cache += "\n<<< BACK TO MENUE <<<\n\n"
	cache += "Following Objects are designable\n\n\n"
	cache += "<<Actor>> \n"
	cache += "  o Race \n"
	cache += "  o Role \n"
	cache += "  o Specialty \n\n"
	cache += "<<KitParts>> \n"
	cache += "  o Base \n"
	cache += "  o Mod \n"
	cache += "  o Appendix \n\n"
	cache += "<<Items>> \n"
	cache += "  o Consumables \n"
	cache += "\n"
	cache += "<<Events>> \n"
	cache += "  o KitSetEvents \n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	
	return cache






