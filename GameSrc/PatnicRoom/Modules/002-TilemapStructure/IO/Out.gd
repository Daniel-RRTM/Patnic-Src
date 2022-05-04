extends Object
class_name _002_Out


static func emit_playerTurnFinished():
	Signals.emit_signal("Player_Turn_Finished")



static func emit_effectTurnStarted():
	Signals.emit_signal("Effect_Turn_Finished_Started")





static func prepareDictionary(toConvert:PoolStringArray):
	var dictToReturn = {}
	
	for i in toConvert.size():
		var currentEntry = toConvert[i]
		var currentPos = currentEntry[0]
		var currentTexture = currentEntry[1]

		dictToReturn[i]["pos"] = currentPos
		dictToReturn[i]["tex"] = currentTexture
	
	return dictToReturn
