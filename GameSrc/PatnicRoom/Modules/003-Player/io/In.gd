extends Object
class_name _005_In


func initialice():
	Signals.connect("Player_Turn_Started",self,"setPlayerTurnOn")
	Signals.connect("Player_Turn_Finished",self,"setPlayerTurnOff")
	
	API_015_Quest.connectSignal("Player_Walked_Step",API_003_Player.chunkStats,"increment")
	API_015_Quest.connectSignal("Player_Used_Kit",API_003_Player.chunkStats,"increment")
	API_015_Quest.connectSignal("Player_Completed_Quest",API_003_Player.chunkStats,"increment")
	Signals.connect("Player_Found_KitPart",API_003_Player.chunkStats,"increment")
	Signals.connect("Player_Found_Valuables",API_003_Player.chunkStats,"increment")





func setPlayerTurnOn():
	API_003_Player.inputMode = true


func setPlayerTurnOff():
	API_003_Player.inputMode = false

