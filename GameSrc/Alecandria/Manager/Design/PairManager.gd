extends Node
class_name _TextToolBox_PairManager


var root
func _init(rootPara) -> void:  root = rootPara



# ----- MAIN ----------------------------------------------------------------- ##


func checkPairMode() -> void:
	if root.CURRENT_FORM != root.ENUMS.FORMS.EVENT : parsePairForm()
	if root.CURRENT_FORM == root.ENUMS.FORMS.EVENT : pass
	if root.focusedEditor.name == "SIDE"           : setValueIntoForm()
	if root.lastInput == ">>> CREATE GAME ELEMENTE >>>" : _TextToolBox_PairingValidator.validateDesign(root)



# ----- MAIN ----------------------------------------------------------------- ##


func parsePairForm():
	var comp = root.getRowDataOfInput()
	if is_instance_valid(comp):
		
		root.sideNote.showValue(comp)
		root.sideTed.prepareInput(comp)
		
		if comp.validInput.empty(): root.CURRENT_MODE = root.ENUMS.MODES.WRITE_PAIR
		else:root.CURRENT_MODE = root.ENUMS.MODES.WRITE_PAIR



func setValueIntoForm():
	root.sideTed.compToValue.value = root.sideTed.getInput()
	root.sideTed.closeInput()
	root.sideNote.hideValue()
	root.mainTed.printPair()
	root.mainTed.grab_focus()



# ----- HELPERS -------------------------------------------------------------- ##



func preparePairDesigning(jsonForm,formToLoad): 
	_TextToolBox_InstanceLoader.loadCompsOfForm(root,jsonForm)
	root.mainTed.printPair()


