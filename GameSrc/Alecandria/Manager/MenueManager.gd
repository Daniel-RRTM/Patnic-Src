extends Node
class_name _TextToolBox_MenueManager


func _init(rootPara) -> void:  root = rootPara
var root               

const INTRODUCTION_STR = "o Introduction"
const INTRODUCTION_INC = ">>>  NEXT PAGE  >>>"
const INTRODUCTION_DEC = "<<<  PREVIOUS PAGE  <<<"
const BACK_TO_MENUE    = "<<< BACK TO MENUE <<<"
const FILTER_RESET     = ">>> RESET <<<"



# ----- MAIN ----------------------------------------------------------------- ##


func checkMenueMode() -> void:
	var inputLine  = root.mainTed.getInput()
	var formToLoad = root.CURRENT_FORM
	
	
	if   isIntroductionSelect(inputLine) :   manageIntroduction(inputLine)
	elif isBackToMenue(inputLine)        :   loadMainMenue()
	elif isFilterReset()                 :   resetFilter()
	
	
	elif noCurrentFormIsFilled() :
		if   isMainMenue()       :   root.CURRENT_SCENE = _TextToolBox_Input.getMainMenueEnumByInput(inputLine)
		elif isFormMenue()       :   formToLoad         = _TextToolBox_Input.getFormEnumByInput(inputLine)
		
		if "Browse" in inputLine :   root.CURRENT_MODE  = root.ENUMS.MODES.READ
		if "Design" in inputLine :   root.CURRENT_MODE  = root.ENUMS.MODES.WRITE_PAIR
		
		setSceneByEnum(formToLoad,inputLine)



# ----- BOOTSTRAP ------------------------------------------------------------ ##


func setSceneByEnum(formToLoad:int,inputLine:String=""):
	root.browserSelection.clear()
	
	#>>> keywords <<<#
	var keywords = _TextToolBox_Input.getKeywordColourPair(root.CURRENT_SCENE)
	for key in keywords.keys():  root.mainTed.add_keyword_color(key,keywords[key])

	
	#>>> fonts <<<#
	var font = _TextToolBox_Input.getFontOfScene(root.CURRENT_SCENE)
	root.mainTed.add_font_override("font",font)

	#>>> texts <<<#
	root.mainTed.text = _TextToolBox_Input.getTextByScene(root.CURRENT_SCENE,root.CURRENT_INTRO)


	#>>> components <<<#
	if isNewFormToLoad(formToLoad):
		var jsonForm      = _TextToolBox_Input.getJSONFormByEnum(formToLoad)
		root.CURRENT_FORM = formToLoad
		
		if !jsonForm.begins_with("!!ERROR!!"): 
			if isBrowsing()      :   root.browserManager.prepareBrowsing(formToLoad)
			if isPairDesigning() :   root.pairManager.preparePairDesigning(jsonForm,formToLoad)



# ----- SUBROUTINES ---------------------------------------------------------- ##


func manageIntroduction(inputLine:String):
	match inputLine:
		INTRODUCTION_STR : root.CURRENT_INTRO  = 0
		INTRODUCTION_INC : root.CURRENT_INTRO += 1
		INTRODUCTION_DEC : root.CURRENT_INTRO -= 1
	
	root.CURRENT_SCENE = root.ENUMS.SCENES.INTRODUCTION
	root.mainTed.text  = root.mainTed.text[root.CURRENT_INTRO]
	setSceneByEnum(root.ENUMS.SCENES.INTRODUCTION)


func loadMainMenue():
	root.sideTed.text  = ""
	root.CURRENT_SCENE = root.ENUMS.SCENES.MAIN_MENUE
	root.CURRENT_FORM  = root.ENUMS.FORMS.VOID
	root.CURRENT_MODE  = root.ENUMS.MODES.SELECT
	setSceneByEnum(root.CURRENT_FORM)
	


func resetFilter():
	root.CURRENT_FILTER = root.ENUMS.FILTERS.RESET



# ----- HELPERS -------------------------------------------------------------- ##


func isBackToMenue(inputLine:String)        -> bool :   return inputLine == BACK_TO_MENUE
func isIntroductionSelect(inputLine:String) -> bool :   return [INTRODUCTION_STR,INTRODUCTION_INC,INTRODUCTION_DEC].has(inputLine)
func isFilterReset()                        -> bool :   return root.sideTed.getInput() == FILTER_RESET


func isMainMenue()                          -> bool :   return root.isCurrent(root.ENUMS.SCENES.MAIN_MENUE)
func isFormMenue()                          -> bool :   return root.isCurrent(root.ENUMS.SCENES.SELECTION)

func isBrowsing()                           -> bool :   return root.isCurrent(root.ENUMS.MODES.READ)
func isPairDesigning()                      -> bool :   return root.isCurrent(root.ENUMS.MODES.WRITE_PAIR)

func noCurrentFormIsFilled()                -> bool :   return root.isCurrent(root.ENUMS.FORMS.VOID)          
func isNewFormToLoad(formToLoad:int)        -> bool :   return formToLoad != root.CURRENT_FORM






