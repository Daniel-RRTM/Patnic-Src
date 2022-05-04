extends OptionButton


enum SUGGESTION {
	BASE_CMD
	LIST_CMD
	SELECTING_BY_LIST
}

var shallowCmdAtlas      = {}
var allBaseCmdsToString  = []
var allTypesToString     = []
var initialCmd


var state 
var syntax = API_008_CLI.getGroupedSyntax()


func _init() :
	state = SUGGESTION.BASE_CMD
	for type in syntax.keys(): allTypesToString.append(type)
	for type in syntax.keys():   for cmd in syntax[type].keys():   allBaseCmdsToString.append(cmd)
	for type in syntax.keys():   for cmd in syntax[type].keys():   shallowCmdAtlas[cmd] = syntax[type][cmd]


func _enter_tree() -> void:
	buildDefaultSuggestion()
	




func buildDefaultSuggestion():
	for groupCmd in syntax.keys():
		add_item("")
		add_item("--- "+groupCmd+" ---")
		for cmd in syntax[groupCmd].values():
			if cmd["input"] != "WIP": 
				add_item(cmd["input"])
		
	




func _on_Execution_by_Suggestion(index: int) -> void:
	var cmdToString = self.get_item_text(index)
	evaluateState(cmdToString)


func evaluateState(cmdToString):
	match state:
		SUGGESTION.BASE_CMD:  executeBaseCmd(cmdToString)
		SUGGESTION.LIST_CMD:  prepareListCmd(cmdToString)
		SUGGESTION.SELECTING_BY_LIST: executelistCmd(cmdToString)



func executeBaseCmd(cmdName):
	if hasListParameter(cmdName): 
		state=SUGGESTION.LIST_CMD
		evaluateState(cmdName)
	if hasPassiveEffect(cmdName): appendIntoActiveList(cmdName)
	if hasNoParameter(cmdName):   API_008_CLI.processCmdRaw(cmdName,[])



func prepareListCmd(cmdToString):
	initialCmd   = cmdToString
	var listToInsert = shallowCmdAtlas[cmdToString]["list"][0]
	self.clear()
	add_item("")
		
	if listToInsert is Array: for entry in listToInsert: add_item(entry)
	
	else:
		for i in listToInsert.size():
			var currentKey  = listToInsert.keys()[i]
			var currenValue = listToInsert.values()[i]

			if currenValue is TileEntity:        self.add_item(currenValue.index())
			if currenValue is ActorRngTemplateEntity:  self.add_item(currentKey)
			if currenValue is String:  self.add_item(currentKey)

	state = SUGGESTION.SELECTING_BY_LIST


func executelistCmd(cmdToString): 
	API_008_CLI.processCmdRaw(initialCmd,[cmdToString])





func hasPassiveEffect(cmdName):      return shallowCmdAtlas[cmdName].has("passive")
func hasNoParameter(cmdName):        return shallowCmdAtlas[cmdName]["parameter"].empty()
func getCountOfParameter(cmdName):   return shallowCmdAtlas[cmdName]["parameter"].size()
func hasListParameter(cmdName):      return !shallowCmdAtlas[cmdName]["list"].empty()




func appendIntoActiveList(cmdName):
	if API_008_CLI.activeCheats.has(cmdName)  : API_008_CLI.activeCheats.erase(cmdName)
	else                                      : API_008_CLI.activeCheats.append(cmdName)
	get_node("../../active/list").draw()






