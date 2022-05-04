extends Object
class_name _Davinci_InfoPanel




static func changeInfoPanel(inputEnumNr, previousState):
	var sidePanelScript = Davinci._sidePanelScript
	Signals.emit_signal("checkRootOfPanicInterface")
	
	#checkForRoot(previousState)
	checkForSame(previousState,inputEnumNr)
	
	sidePanelScript.manageSidepanel("Panic_Info_News")




static func checkForSame(previousState:int,pressedEnum:int):
	if previousState == pressedEnum:  Davinci._sidePanelScript.isSame = true
	else:                             Davinci._sidePanelScript.isSame = false

static func checkForRoot(previousState:int):
	if previousState == ENUM.PANIC_INTERFACE_STATE.ROOT:  Davinci._sidePanelScript.isRoot = true
	else:                                                 Davinci._sidePanelScript.isRoot = false
