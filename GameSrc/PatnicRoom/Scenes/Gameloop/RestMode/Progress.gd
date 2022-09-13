extends Control

var _005_Common_StationTicker = []

onready var meatBar   = get_node("Workshop/Barframe/ProgressBar")
onready var matrixBar = get_node("Terminal/Barframe/ProgressBar") 
onready var magicBar  = get_node("Retreat/Barframe/ProgressBar")

onready var meatRtl   = get_node("Workshop/counter")
onready var matrixRtl = get_node("Terminal/counter") 
onready var magicRtl  = get_node("Retreat/counter")

onready var timer = get_node("Timer")

onready var _005_Common_StationMeta = {
	"MEAT"   : {  "bar":meatBar   , "rtl":meatRtl   },
	"MAGIC"  : {  "bar":magicBar  , "rtl":magicRtl  },
	"MATRIX" : {  "bar":matrixBar , "rtl":matrixRtl  }
}



func _ready() -> void:
	_005_Common_StationMeta["MEAT"]["bar"].initialice(API_003_Player.getStations().meat,meatRtl)
	_005_Common_StationMeta["MAGIC"]["bar"].initialice(API_003_Player.getStations().magic,magicRtl)
	_005_Common_StationMeta["MATRIX"]["bar"].initialice(API_003_Player.getStations().matrix,matrixRtl)
	
	
	for station in _005_Common_StationMeta.values():
		var stationData = station["bar"].stationMetaData
		
		station["rtl"].bbcode_text = stationProgressToString(stationData,0)
		
		if stationData.isCounting:   
			station["bar"].max_value = stationData.maxLength
			_005_Common_StationTicker.append(station["bar"])
	
	timer.start()
	print(timer.time_left)
	

func _on_Timer_timeout() -> void:
	if !_005_Common_StationTicker.empty():
		for station in _005_Common_StationTicker:
			var stationData = station.stationMetaData
			
			if stationData.currentLength == station.value: _005_Common_StationTicker.erase(station)
			
			if stationData.currentLength != station.value: station.value += 1
			
			station.correspondingRtl.bbcode_text =  stationProgressToString(stationData,station.value)
			
			if station.value == stationData.maxLength: 
				station.get_node("../../link").visible = true
				API_003_Player.stationSetter.setOnDefault()




func stationProgressToString(station,currentBar):
	if !station.isCounting:              return "No Task set!"
	if currentBar == station.maxLength:  return "[color=lime]FINISHED" 
	else:                                return str(currentBar)+" / "+str(station.maxLength)




