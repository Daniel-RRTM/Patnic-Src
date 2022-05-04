extends Node
# BOOKMARK[epic=Singleton] ENUM                                                


var ALECANDRIA   := _Enum_ALecandria.new()
var SOKRATILES   := _Enum_SokraTILES.new()
var ENTROPY      := _Enum_Entropy.new()
var ITEMS        := _Enum_Items.new()
var FILE_PATHS   := _Enum_FilePaths.new()
var PLAYER       := _Enum_Player.new()
var KITS         := _Enum_Kits.new()
var INPUT_PANIC  := _Enum_Input_Panic.new()
var INPUT_REST   := _Enum_Input_Rest.new()
var MINIMAL_COMP := _Enum_MinimalComp.new()
onready var LEC  := _Enum_LEC.new()



 
var allSubEnums      = []
var allEnums         = {}
var allEnumsToString = []


func _ready() -> void:
	# STUB testLecToEnt.parse()
	allSubEnums  = [ALECANDRIA,SOKRATILES,ENTROPY,ITEMS,KITS,PLAYER,INPUT_PANIC,INPUT_REST,MINIMAL_COMP,LEC,FILE_PATHS]
	var cache = []
	for subEnum in allSubEnums:   
		allEnumsToString += subEnum.ENUMS_TO_STRING.keys()
		cache += subEnum.ENUMS_TO_STRING.values()
	
	for i in cache.size():   allEnums[allEnumsToString[i]] = cache[i]





# ----- ENTITIES ------------------------------------------------------------ ##

enum GAMELOOP_STATE { TITLE , PANIC , REST }

enum EXCEPTION_TYPE{
	X_IN_Y_NOT_FOUND
	X_ALREADY_IN_Y
}


# ORDER IS RELEVANT
var ALL_INPUTS = [
	# MOVEMENT
	 "Panic_Walk_North","Panic_Walk_West","Panic_Walk_South","Panic_Walk_East"
	# INFO
	,"Panic_Info_Jur","Panic_Info_Mon","Panic_Info_News","Panic_Info_Kits","Panic_Special_CLI"
	# ACTION
	,"Panic_Action_Selection","Panic_Action_Interact","Panic_Action_Practice","Panic_Action_Onlook","Panic_Action_Loot","Panic_Action_Use"
	 # INTERFACE
	,"Interface_Cntl","Interface_delete","Interface_Generall_Escape","Interface_Generall_Enter","Interface_Mouse_Left","Interface_Mouse_Right" 
	]





