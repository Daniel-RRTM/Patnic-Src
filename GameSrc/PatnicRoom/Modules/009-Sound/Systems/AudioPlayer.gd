extends AudioStreamPlayer
class_name _15_Sound_AudioPlayer


func _init():
	name = "audioPlayer"



func _playAudio(audioPath:String) -> void : 
	stream = load(audioPath)
	play()


