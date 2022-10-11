extends Node
# DOCS  > Docs\API\docs\Cogsmos\democrECS\Entity.md                            
# DOCS  > TO ADD                                                               
# BOOKMARK[epic=Entities] Core                                                 
class_name System


# ----- INITIALICE --------------------------------------------------------- ##

# STUB Static Typing
var operations        : Dictionary   #     "keyOfOperation" : classOfOperation
var signalsConnection : Dictionary   #     "nameOfSignal" : "nameOfFunction"
var tasks             : Array        # {   "affectedEnt":ent , "operation" : "AREA" , "parameter" : [4]   }
var description       : String 
var APIRef

func _init() -> void:
	declare()
	DemocrECS.atlas_systems[self.name] = self
	for signalName in signalsConnection.keys():   Signals.connect(signalName,self,signalsConnection[signalName])

func _ready():prepare()

func declare() -> void :   printerr("There was no declaration for this system set")
func prepare() -> void :   printerr("There was no preparation for this system set")



# ----- OPERATIONS --------------------------------------------------------- ##


func runTasks() -> void:
	for task in tasks:
		if is_instance_valid(task.affectedEnt): 
			operations[task.operation].run(task.affectedEnt, task.parameter)
		else:
			operations[task.operation].run(task.parameter)
		tasks.erase(task)


func addTask(operationName:String, operationParameter=[], affectedEnt=null) -> void:
	if !operations.keys().has(operationName): printerr("Operation ["+operationName+"] in System ["+name+"] not found!")
	else: tasks.append({   "affectedEnt":affectedEnt , "operation":operationName , "parameter":operationParameter   })

func addTaskByDict(taskData:Dictionary) -> void:
	if !taskData.has("operationName"): printerr("taskData for "+name+" is not set as key")
	if !operations.keys().has(taskData.operationName): printerr("Operation ["+taskData.operationName+"] in System ["+name+"] not found!")
	else: tasks.append(taskData)




# ----- GETTER ------------------------------------------------------------- ##


func getAutoDoc() -> Dictionary:
	return{ "operations" : str(operations)  ,
			"usage"      : description      ,
			"name"       : name             ,
			"api"        : APIRef           }


