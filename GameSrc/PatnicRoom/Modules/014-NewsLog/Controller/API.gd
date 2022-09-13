extends Node
# BOOKMARK[epic=Modules] 014_NewsLog                                          
# DOCS  > Docs\API\docs\Cogsmos\democrECS\SokraTILES.md                        
# DOCS  > TO ADD                                                               


# ----- INITIALICER -------------------------------------------------------------- ##


var textEditNode : TextEdit
var protocol = []

var catToShow = {
	 "MONITOR" : true
	,"META"    : true
	,"GEAR"    : true
	,"KIT"     : true
}

func _ready():Signals.connect("Actor_Turn_Finished",self,"reprintAll")


func monitorEntry(msg:String)  -> void : writeEntry("MONITOR",msg)
func gearEntry(msg:String)     -> void : writeEntry("GEAR",msg)
func metaEntry(msg:String)     -> void : writeEntry("META",msg)
func kitEntry(msg:String)      -> void : writeEntry("KIT",msg)


func writeEntry(cat:String,msg:String) -> void:
	protocol.append({ "CAT":cat , "MSG":msg })
	#textEditNode.text += getCatSpacing()[cat]+"  "+msg+"\n"


func reprintAll() -> void:
	if is_instance_valid(textEditNode):
		textEditNode.text = "\n"
		var lastOutput = ""
		for entry in protocol:
			if catToShow[entry["CAT"]]: 
				var current = getCatSpacing()[entry["CAT"]]+"  "+entry["MSG"]+"\n"
				if current != lastOutput : textEditNode.text += current
				lastOutput = current



# ----- GETTER -------------------------------------------------------------- ##



func getKeywordColoring() -> Dictionary: return {
	 "KIT"     : Color("#ffb5fd")
	,"GEAR"    : Color("#A0C8C3")
	,"MONITOR" : Color("#FCE2AD")
	,"META"    : Color("#ff7676")
}

func getCatSpacing() -> Dictionary: return {
	 "KIT"     : "KIT     >>>"
	,"GEAR"    : "GEAR    >>>"
	,"MONITOR" : "META    >>>"
	,"META"    : "MONITOR >>>"
}








