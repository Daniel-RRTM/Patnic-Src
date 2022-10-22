extends Node
class_name _Alecandria_Designer_AltManager

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
	if currentMode == MODE.FORM_SELECTION : loadForm(root)
	printCurrentRows(root)
	
	
	
	if currentMode == MODE.ROW_SELECTION or currentMode == MODE.INPUT_SELECTION: 
		root.mainTed.cursor_set_column(42)
	if event.is_action("Interface_Generall_Enter"):
		var mainInput = root.mainTed.getInput()
		var sideInput = root.sideTed.getInput()
		
		
		if mainInput == "<<< BACK TO MENUE <<<": root.changeMode(root.MenueManager)
		
		
		else:
			match currentMode:
				MODE.FORM_SELECTION   : loadForm(root)   
				MODE.ROW_SELECTION    : printCurrentRows(root)
				MODE.INPUT_SELECTION  : prepareNewInput(root)
				MODE.INPUT_COMMIT     : currentInput.commitInput(root)




func runCustomPrep(root) -> void:
	currentMode = MODE.FORM_SELECTION




func loadForm(root) -> void:
	allRowsInput.clear()
	if root.mainTed.getInput().split("o ").size() == 2:
		formOfDesign = Utils.json().fileToDictionary("res://GameData/Alecandria/Forms/"+root.mainTed.getInput().split("o ")[1].replace(" ","")+".json")
		for compName in formOfDesign["mandatory to fill out"]: 
			var compDoc = root.compAtlas[compName].getAutoDoc()
			allRowsInput[compDoc.nameToShow.replace(" ","")]=_TextToolBox_RowMetaData.new(compDoc,compName)
		currentMode = MODE.INPUT_SELECTION



func printCurrentRows(root) ->void: 
	root.mainTed.text = "\n\n<<< BACK TO MENUE <<<\n\n\n"
	for row in allRowsInput.values():
		var toPrint = row.printRow()
		if ["ARRAY","DICTIONARY","STATIC_LIST"].has(row.validType): toPrint += "press ENTER to edit"
		root.mainTed.insertTextNewLine(toPrint)
	



func prepareNewInput(root) -> void:
	if root.mainTed.getInput().split("--->").size() == 2:
		var terms = root.mainTed.getInput().split("--->   ")
		currentRow = allRowsInput[terms[0].replace(" ","")]
		root.get_node("Sidenote/Description/Text").text = currentRow.description
		root.get_node("Sidenote/Suggestion/Text").text = currentRow.suggestion
		
		if currentRow.validType == "STRING" or currentRow.validType == "INTEGER":
			currentRow.value = terms[1]
		
		elif currentRow.validType == "STATIC_LIST":
			root.sideTed.text  = "ADD \nCLEAR\n\n"
			for line in currentRow.validInput: root.sideTed.text += str(line+"\n")
			currentMode = MODE.INPUT_COMMIT
			root.sideTed.grab_focus()
		
		root.sideTed.cursor_set_line(1)
		printCurrentRows(root)
		currentMode = MODE.INPUT_SELECTION



func commitInput(root) -> void:
	if root.sideTed.getInput() != "":
		currentRow.value = root.sideTed.getInput()
		root.sideTed.text = ""
		currentRow = null
		printCurrentRows(root)
		currentMode = MODE.INPUT_SELECTION
		root.mainTed.grab_focus()
		root.mainTed.cursor_set_line(1)
		



