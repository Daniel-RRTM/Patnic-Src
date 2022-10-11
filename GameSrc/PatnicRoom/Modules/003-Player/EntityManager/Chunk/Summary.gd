extends Object
class_name _003_ChunkStats



var summary = {}
func reset() -> void:
	summary = {
	 "archivement"  : ""
	,"valuables"    : 0
	,"kitparts"     : 0
	,"kituses"      : 0
	,"quest1"       : false
	,"quest2"       : false
	,"quest3"       : false
	,"steps"        : 0
	}


func getDict() -> Dictionary : return summary
func increment(para:Dictionary) -> void:
	match para.keyword:
		"archivement" : summary.archivement += para.name
		"valuables"   : summary.valuables   += 1
		"kitparts"    : summary.kitparts    += 1
		"kituses"     : summary.kituses     += 1
		"quest1"      : summary.quest1       = true
		"quest2"      : summary.quest2       = true
		"quest3"      : summary.quest3       = true
		"steps"       : summary.steps       += 1
