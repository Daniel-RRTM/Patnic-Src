extends OptionButton


var syntax = {}
var shallowCmdAtlas = {}
enum SUGGESTION {
	BASE_CMD
	LIST_CMD
	SELECTING_BY_LIST
}


var cachedParameter : Array
var initialCmd
var state 


func _init() :
	state = SUGGESTION.BASE_CMD

func _enter_tree() -> void:
	syntax = API_008_CLI.getGroupedSyntax()
	for type in syntax.keys(): for cmd in syntax[type].keys(): shallowCmdAtlas[cmd] = syntax[type][cmd]
	for groupCmd in syntax.keys():
		add_item("")
		add_item("--- "+groupCmd+" ---")
		for cmd in syntax[groupCmd].values(): if cmd["input"] != "WIP": add_item(cmd["input"])






func evaluateState(index):
	var cmdToString = self.get_item_text(index) if index is int else index
	
	
	if state == SUGGESTION.BASE_CMD:
		cachedParameter.clear()
		initialCmd = cmdToString
		if   hasPassiveEffect(cmdToString) : appendIntoActiveList(cmdToString)
		if   hasNoParameter(cmdToString)   : API_008_CLI.processCmdRaw(cmdToString,[])
		elif hasListParameter(cmdToString) : state = SUGGESTION.LIST_CMD
	
	
	if state == SUGGESTION.LIST_CMD:
		if !isBaseCmd(cmdToString): state = SUGGESTION.SELECTING_BY_LIST
		prepareListCmd(cmdToString)
	
	
	if state == SUGGESTION.SELECTING_BY_LIST:
		cachedParameter.append(cmdToString)
		if   !isParameterNeeded() : API_008_CLI.processCmdRaw(initialCmd,cachedParameter)
		elif  isParameterNeeded() : prepareListCmd(initialCmd,cachedParameter.size())


func prepareListCmd(cmdToString,paraNr=0):
	var listToInsert = shallowCmdAtlas[initialCmd]["list"][paraNr]
	self.clear()
	add_item("")
	
	if listToInsert is Array: 
		for entry in listToInsert: 
			add_item(entry)
	
	if listToInsert is Dictionary:
		for instance in listToInsert.values():
			if instance is Entity : self.add_item(instance.index())
			if instance is String : self.add_item(instance)





func getCountOfParameter(cmdName) -> int  : return shallowCmdAtlas[cmdName]["parameter"].size()

func hasNoParameter(cmdName)      -> bool : return shallowCmdAtlas[cmdName]["parameter"].empty()
func hasListParameter(cmdName)    -> bool : return !shallowCmdAtlas[cmdName]["list"].empty()
func hasPassiveEffect(cmdName)    -> bool : return shallowCmdAtlas[cmdName].has("passive")
func isBaseCmd(cmdName)           -> bool : return shallowCmdAtlas.has(cmdName)
func isParameterNeeded()          -> bool : return getCountOfParameter(initialCmd) > cachedParameter.size()


func appendIntoActiveList(cmdName):
	if API_008_CLI.activeCheats.has(cmdName): API_008_CLI.activeCheats.erase(cmdName)
	else: API_008_CLI.activeCheats.append(cmdName)
	get_node("../../active/list").draw()


