extends Node
class_name _Util_RNG




static func getBackground(ofScene:String):
	var panicBackground = ENUM.INPUT_PANIC.BACKGROUND_FILEPATH
	var titleBackground = ENUM.FILE_PATHS.TITLE_BACKGROUND
	var restBackground  = ENUM.INPUT_REST.BACKGROUND_FILEPATH
	
	if "panic" in ofScene  :   return load(panicBackground[getRandomNumber(0,panicBackground.size()) -1])
	if "title" in ofScene  :   return load(titleBackground[getRandomNumber(0,titleBackground.size()) -1])
	if "rest" in ofScene   :   return load(restBackground[getRandomNumber(0,restBackground.size()) -1])



static func getRandomNumber(from,to):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	return rng.randi_range(from,to)




