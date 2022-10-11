extends Node


var filepath = "res://SessionLog.txt"
var logAtlas = []
var file = File.new()

func _ready():
	printIntoSeshLog("INIT","[color=red]XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
	printIntoSeshLog("INIT","[color=red]XX========== BOOTING ==============================================XX")
	printIntoSeshLog("INIT","[color=red]XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")



func printIntoSeshLog(group:String,toInsert:String) -> void:
	logAtlas.append({"time":getSystemTimeToStr(),"group":group,"desc":toInsert})
	
	file.open(filepath, File.READ)
	var content = file.get_as_text()
	file.close()
	
	file.open(filepath, File.WRITE)
	file.store_string(content+str(getSystemTimeToStr())+","+group+","+toInsert+"\n")
	file.close()



func getSystemTimeToStr() -> String:
	var time = OS.get_time()
	var hour = str(time.hour) if time.hour >9 else "0"+str(time.hour) 
	var minute = str(time.minute) if time.minute >9 else "0"+str(time.minute) 
	var sec = str(time.second) if time.second >9 else "0"+str(time.second) 
	return hour+":"+minute+":"+sec


func getLog() -> Array : return logAtlas

func getFileData()-> Array:
	var toReturn = []
	file.open(filepath, File.READ)
	var content = file.get_as_text()
	file.close()
	
	var arr = content.split("\n") as Array
	for line in arr:
		if line != "" and !line.begins_with("TIME"):
			var terms = line.split(",")
			toReturn.append({"time":terms[0],"group":terms[1],"desc":terms[2]})
	
	return toReturn



func deleteExternalLog()-> void:
	file.open(filepath, File.READ)
	file.close()
	file.open(filepath,File.WRITE)
	file.store_string("TIME,GROUP,DESC\n")
	file.close()
