extends System
class_name _008_CommandSystem


func declare() -> void:
	self.name               = "_008_Command"
	self.description        = "Operations are called by the F3-Cheatmenue"
	self.APIRef             = API_008_CLI
	self.signalsConnection  = {"API_008_runCmds":"run"}
	self.operations         = {
		 "spawn cstm actor" : _API_017_Cmd_SpawnCustomeActor
		,"spawn temp actor" : _API_017_Cmd_SpawnTemplateActor
		,"all kitparts"     : _API_017_Cmd_AddAllKitParts
		,"unique map"       : _API_017_Cmd_LoadUniqueMap
		,"story map"        : _API_017_Cmd_LoadStoryMap
		,"add credits"      : _API_017_Cmd_AddCredits
		,"spawn tile"       : _API_017_Cmd_SpawnTile
		,"restmode"         : _API_017_Cmd_Restmode
		,"no clip"          : _API_017_Cmd_NoClip
	}


func prepare() -> void:
	var groupedCmds = self.APIRef.getGroupedSyntax()
	for operation in self.operations.values():
		var doc = operation.getAutoDoc()
		doc["class"] = operation
		
		if !groupedCmds.has(doc.group): groupedCmds[doc.group] = {}
		groupedCmds[doc.group][doc.input] = doc
		
		self.APIRef.cmdsToString.append(doc.input)
		self.APIRef.shallowCmdAtlas[doc.input] = doc
	self.APIRef.groupedCmdAtlas = groupedCmds


func spawnTemplateActor() -> _API_017_Cmd_SpawnTemplateActor : return operations["spawn temp actor"]
func spawnCstmActor()     -> _API_017_Cmd_SpawnCustomeActor  : return operations["spawn cstm actor"]
func allKitParts()        -> _API_017_Cmd_AddAllKitParts     : return operations["all kitparts"]
func uniqueMap()          -> _API_017_Cmd_LoadUniqueMap      : return operations["unique map"]
func storyMap()           -> _API_017_Cmd_LoadStoryMap       : return operations["story map"]
func addCredits()         -> _API_017_Cmd_AddCredits         : return operations["add credits"]
func spawnTile()          -> _API_017_Cmd_SpawnTile          : return operations["spawn tile"]
func restmode()           -> _API_017_Cmd_Restmode           : return operations["restmode"]
func noClip()             -> _API_017_Cmd_NoClip             : return operations["no clip"]


# ----- PROCESS -------------------------------------------------------------- ##



