extends Node
class_name _Alecandria_Browse_Manager


var typeAtlas = {
	 "Race"      : API_001_Atlas.Race().getEntries()
	,"Role"      : API_001_Atlas.Role().getEntries()
	,"Specialty" : API_001_Atlas.Specialties().getEntries()
	,"Base"      : API_001_Atlas.KitParts().baseKitParts
	,"Mod"       : API_001_Atlas.KitParts().modKitParts
	,"Appendix"  : {} #API_001_Atlas.().getEntries()
}

var fontPath   = "res://Assets/Alecandria/customeFont/default.tres"
var keywords   = "Selection"
var staticText = "\n<<< BACK TO MENUE <<<\n\nWe recommend our ONLINE WIKI for browsing, this tool has second priority!\npress enter on line...\n\n\n<<Actor>> \n  o Race \n  o Role \n  o Specialty \n\n\n<<KitParts>> \n  o Base \n  o Mod \n  o Appendix \n\n\n<<ProcGen>> (coming soon)\n  o NPC \n  o Loot \n\n\n<<Misc>> (coming soon)\n  o Coniditon"

var browsableEnts = {}

var applyableFilter = {}
var currentFilter = {}
var currentFilterCat = "" 

func manageInput(event:InputEvent, root) -> void:
	if event.is_action("Interface_Generall_Enter"):
		var mainInput = root.mainTed.getInput()
		var sideInput = root.sideTed.getInput()
		var sideInputRight = sideInput.split("->")[0].replace(" ","")
		
		#>>> MAIN <<<#
		if  mainInput == "<<< BACK TO MENUE <<<" : 
			root.changeMode(root.MenueManager)
		
		elif browsableEnts.has(mainInput) : 
			root.ReadManager.currentEntToRead = browsableEnts[mainInput]
			root.changeMode(root.ReadManager)
			root.sideTed.clearAllText()
		
		elif mainInput.split("o ").size() == 2 :
			var saniticedInput = mainInput.split("o ")[1].replace(" ","")
			loadBrowser(saniticedInput,root)
			printFilter(root)
		
		
		#>>> SIDE <<<#
		if root.sideTed.has_focus():
			
			if applyableFilter.has(sideInputRight):
				currentFilterCat = sideInputRight
				printParameter(root,applyableFilter[currentFilterCat])
			
			if applyableFilter.keys().has(currentFilterCat):
				if applyableFilter[currentFilterCat].has(sideInput):
					if !currentFilter[currentFilterCat].has(sideInput):
						currentFilter[currentFilterCat].append(sideInput)
					printFilter(root)
					currentFilterCat = ""
					_Alecandria_Browse_Validator.validateList(root)
			
			if  sideInput == "<<< RESET >>>":
				for entName in browsableEnts.keys(): for word in entName.split(" "):root.mainTed.add_keyword_color(word,"#6bceff")
				for cat in applyableFilter.keys(): currentFilter[cat] = []
				printFilter(root)



func loadBrowser(type:String,root) -> void:
	root.mainTed.text = "\n<<< BACK TO MENUE <<<\n\n\n"
	applyableFilter = _Alecandria_Browse_Filter.getFilter(type)
	for cat in applyableFilter.keys(): currentFilter[cat] = []
	
	for ent in typeAtlas[type].values():
		var entryName = ent.getCompValue("C_6_NAME").replace("-","")
		browsableEnts[entryName] = ent
		root.mainTed.insertTextNewLine(entryName)
		for word in entryName.split(" "): root.mainTed.add_keyword_color(word,Color("#6bceff"))



func printFilter(root) -> void :
	root.sideTed.clearAllText()
	root.sideTed.text = "Current Filter: \n\n"
	for cat in applyableFilter.keys():
		root.sideTed.text += cat
		for i in 15-cat.length(): root.sideTed.text+=" "
		root.sideTed.text += "  ->  "
		if currentFilter[cat].size()>0:
			var poolStrArr = currentFilter[cat] as PoolStringArray 
			root.sideTed.text += poolStrArr.join(" AND ")
		root.sideTed.text += "\n"
	root.sideTed.text += "\n<<< RESET >>>\n"


func printParameter(root,parameter:Array) -> void:
	root.sideTed.cursor_set_line(0)
	root.sideTed.clearAllText()
	root.sideTed.text = "Select Parameter...\n"
	for para in parameter: root.sideTed.text += para+"\n"





func runCustomPrep(root) -> void:
	pass
