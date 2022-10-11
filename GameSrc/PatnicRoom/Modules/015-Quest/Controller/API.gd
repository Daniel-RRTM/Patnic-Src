extends Node
# BOOKMARK[epic=Modules] 014_NewsLog                                          
# DOCS  > Docs\API\docs\Cogsmos\democrECS\SokraTILES.md                        
# DOCS  > TO ADD                                                               


# ----- INITIALICER -------------------------------------------------------------- ##


var _listenerSystems := _015_ListenerSystem.new()
var _signals := _015_Signals.new()



func listener() -> _015_ListenerSystem: return _listenerSystems

func instanciateNewListener(type:String, step:Dictionary) -> System:
	return _listenerSystems.instanciateNewListener(type,step)


func emitSignal(signalName:String,para:Dictionary) -> void:
	if !_signals.getSignalAtlas().keys().has(signalName): printerr("ERROR AT QUEST! Signal "+signalName+" not found!")
	else                                                : _signals.emit_signal(signalName,para)

func connectSignal(signalName:String,connectedNode,connectedFunc) -> void:
	_signals.connect(signalName,connectedNode,connectedFunc)




# ----- GETTER -------------------------------------------------------------- ##









