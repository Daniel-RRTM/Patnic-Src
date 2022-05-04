extends Object
class_name _15_Sound_Index


static func getSound(name:String) -> String: return getSyntax()[name]


static func getSyntax():
	return{
		"enter panicroom"     : "res://Assets/Sound/FX/EnterPanicRoom.wav",
		"leave panicroom"     : "res://Assets/Sound/FX/LeavePanicRoom.wav",

		"move player"         : "res://Assets/Sound/FX/movePlayer.wav",
		"select kit"          : "res://Assets/Sound/FX/SelectKit.wav",
		"run kit"             : "res://Assets/Sound/FX/RunKit.wav",

		"hover option"        : "res://Assets/Sound/FX/HoverOnOption.wav",
		"select option"       : "res://Assets/Sound/FX/SelectOption.wav",
		"trigger panic-slide" : "res://Assets/Sound/FX/TriggerPanicSlide.wav"
	}


