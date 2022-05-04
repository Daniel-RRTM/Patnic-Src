extends System
class_name _008_CommandSystem


func declare() -> void:
	self.name              = "_008_Command"
	self.description       = "Operations are called by the F3-Cheatmenue"
	self.APIRef            = API_008_CLI
	
	self.signalsConnection = {   
		"API_008_runCmds" : "runTasks"   
	}
	
	self.operations  = {
		"spawn actor"     : _API_017_Cmd_SpawnTemplateActor ,
		"all kitparts"    : _API_017_Cmd_AddAllKitParts     ,
		"load unique map" : _API_017_Cmd_LoadUniqueMap      ,
		"load story map"  : _API_017_Cmd_LoadStoryMap       ,
		"add credits"     : _API_017_Cmd_AddCredits         ,
		"spawn tile"      : _API_017_Cmd_SpawnTile          ,
		"restmode"        : _API_017_Cmd_Restmode           ,
		"no clip"         : _API_017_Cmd_NoClip             ,
	}


func prepare() -> void:
	for operation in self.operations.values():
		var doc = operation.getAutoDoc()
		doc["class"] = operation
		
		if !self.APIRef.groupedCmdAtlas.has(doc.group): self.APIRef.groupedCmdAtlas[doc.group] = {}
		self.APIRef.groupedCmdAtlas[doc.group][doc.input] = doc
		
		self.APIRef.cmdsToString.append(doc.input)
		self.APIRef.shallowCmdAtlas[doc.input] = doc


