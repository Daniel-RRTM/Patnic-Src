extends Object
class_name _004_Consider


# REFACTOR[epic=LEC-SYNTAX] Changing into Enums for Dynamic expansion          

func run(toConsider:Array) -> Array :
	if toConsider[1] == "IS" and toConsider[2] == "TRUE" : return API_004_KitSet.selection.selects
	else : return SYNTAX.EVENT.CONCEPTS.CONSIDER[toConsider[1]].run(toConsider)  


	match toConsider[1]:
		"COMP"       :   return component.run(toConsider)
		"TYPE"       :   return type.run(toConsider)
		"FLAG"       :   return flag.run(toConsider)
		"PROP"       :   return property.run(toConsider)
		"COND"       :   return condition.run(toConsider)
		
		
		_:
			printerr("ERROR!! at EVENT_PARSE, CONSIDER : "+str(toConsider)+" NOT FOUND")
			return []



var component  :=  _004_Consider_Component.new()
var type       :=  _004_Consider_Type.new()
var flag       :=  _004_Consider_Flag.new()
var property   :=  _004_Consider_Property.new()
var condition  :=  _004_Consider_Condition.new()


func _init() -> void :
	component.initialice(DemocrECS.getAllComponents())
	type.initialice(getType())
	flag.initialice(_Flags.getFlags())
	property.initialice({})





static func getType() -> Dictionary :    return {
	 "TILE"         :   TileEntity
	,"INTERACT" :   InteractEntity
	,"ACTOR"        :   ActorEntity
}







