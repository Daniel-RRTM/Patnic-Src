extends Node
class_name _Alecandria_Designer_Manager

enum MODE {FORM_SELECTION,ROW_SELECTION,INPUT_SELECTION,INPUT_COMMIT} 

var fontPath   = "res://Assets/Alecandria/customeFont/default.tres"
var keywords   = "Selection"
var staticText = "\n<<< BACK TO MENUE <<<\n\n\n\n\n<<Actor>> \n  o Race \n  o Role \n  o Specialty \n\n\n<<KitParts>> \n  o Base \n  o Mod \n  o Appendix \n\n\n<<ProcGen>> (coming soon)\n  o NPC \n  o Loot \n\n\n<<Misc>> (coming soon)\n  o Coniditon"

var formOfDesign = {}
var allRowsInput = {}

var currentRow
var currentMode
var currentInput




func manageInput(event:InputEvent, root) -> void:
	if event.is_action("Interface_Generall_Enter"):
		var mainInput = root.mainTed.getInput()
		var sideInput = root.sideTed.getInput()
		
		
		if mainInput == "<<< BACK TO MENUE <<<": root.changeMode(root.MenueManager)
		
		else:
			match currentMode:
				MODE.FORM_SELECTION   : loadForm(root)   
				MODE.ROW_SELECTION    : printCurrentRows(root)
				MODE.INPUT_SELECTION  : prepareNewInput(root)
				MODE.INPUT_COMMIT     : if !sideInput.contains("enter"): currentInput.commitInput(root)




func runCustomPrep(root) -> void:
	currentMode = MODE.FORM_SELECTION




func loadForm(root) -> void:
	allRowsInput.clear()
	if root.mainTed.getInput().split("o ").size() == 2:
		formOfDesign = Utils.json().fileToDictionary("res://GameData/Alecandria/Forms/"+root.mainTed.getInput().split("o ")[1].replace(" ","")+".json")
		for compName in formOfDesign["mandatory to fill out"]: 
			var compDoc = root.compAtlas[compName].getAutoDoc()
			allRowsInput[compDoc.nameToShow.replace(" ","")]=_TextToolBox_RowMetaData.new(compDoc,compName)
			printCurrentRows(root)
		currentMode = MODE.ROW_SELECTION


func printCurrentRows(root) ->void: 
	root.mainTed.text = "\n\n<<< BACK TO MENUE <<<\n\n\n"
	for row in allRowsInput.values():
		root.mainTed.insertTextNewLine(row.printRow())
	currentMode = MODE.INPUT_SELECTION
	


func prepareNewInput(root) -> void:
	if root.mainTed.getInput().split("--->").size() == 2:
		currentRow = allRowsInput[root.mainTed.getInput().split("--->")[0].replace(" ","")]
		root.get_node("Sidenote/Description/Text").text = currentRow.description
		root.get_node("Sidenote/Suggestion/Text").text = currentRow.suggestion

		match currentRow.validType:
			"DICTIONARY" : currentInput = _Alecandria_Designer_Dictionary
			"INTEGER"    : currentInput = _Alecandria_Designer_Integer
			"STRING"     : currentInput = _Alecandria_Designer_String
			"ARRAY"      : currentInput = _Alecandria_Designer_Array
			"STATIC_LIST" : currentInput = _Alecandria_Designer_Enum


		currentInput.initialice(root)
		root.sideTed.text = currentRow.printDataType()+"\n\n"
		
#		for input in currentRow.validInput:
#			root.sideTed.insertTextNewLine(input)
#			for word in input.split(" "): root.sideTed.add_keyword_color(word,Color("#80ffbb"))
		
		root.sideTed.grab_focus()
		root.sideTed.cursor_set_line(1)
		currentMode = MODE.INPUT_COMMIT



func commitInput(root) -> void:
	if root.sideTed.getInput() != "":
		currentRow.value = root.sideTed.getInput()
		root.sideTed.text = ""
		currentRow = null
		printCurrentRows(root)
		root.mainTed.grab_focus()
		root.mainTed.cursor_set_line(1)
		


