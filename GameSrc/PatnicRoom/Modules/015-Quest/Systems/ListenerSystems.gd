extends System
class_name _015_ListenerSystem


func declare() -> void:
	self.name              = "_015_Quest"
	self.description       = "Operations are called by the F3-Cheatmenue"
	self.APIRef            = API_015_Quest
	self.signalsConnection = {}
	self.operations        = {
		"KILL"             : _015_001_Kill ,
		"REST_WITH"        : _015_002_RestIn
		# CURRENT ---> gerade in diesem moment, wie 20 graßflächen in brand
	}


func prepare() -> void: pass


func kill() -> _015_001_Kill: return operations["KILL"]
func restIn() -> _015_002_RestIn: return operations["REST_WITH"]



# ----- PROCESS -------------------------------------------------------------- ##


func instanciateNewListener(type:String, step:Dictionary) -> System:
	var ops = operations[type].new()
	ops.signals = ops.getAutoDoc().signal
	ops.initialice(step)
	return ops 


