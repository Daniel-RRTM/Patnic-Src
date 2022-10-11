
# CLASS starts the game for varius Usages                                            

# DOCS  https://mizzitgamestudios.github.io/mkDocs/site/Core/RuntimeParameter        



extends Node
class_name RuntimeParameter



# ----- INITIALICE --------------------------------------------------------------- ##

# BOOKMARK[epic=Singleton] Bootstrap      

var isBrowseLecBootMode = false
var isDesignLecBootMode = false

											
func _ready() -> void:
	var file = File.new()
	file.open("res://tools/gameinit.txt", File.READ)
	var content = file.get_as_text()
	file.close()
	
	match content:
		"default"     :			runDefault();
		"tilemapTest" :			runTilemapTest()
		"restmode"    :			runRestmode();
		"statistics"  :			runStatistics()
		"quickStart"  :			runQuickStart()
		"bootMenue"   :			runBootMenue()
	HomErrorLog.printIntoSeshLog("INIT","Mode to start by file \"tools/gameinit.txt\": [color=lime]"+content)
	HomErrorLog.printIntoSeshLog("INIT","Finished at [color=lime]"+str(OS.get_ticks_msec())+" [color=white]Milliseconds!")
	HomErrorLog.printIntoSeshLog("INIT","====================================================================")
	HomErrorLog.printIntoSeshLog("INIT","============ BOOTING DONE ==========================================")
	HomErrorLog.printIntoSeshLog("INIT","====================================================================")



# ----- DEFAULT ------------------------------------------------------------------ ##


func runDefault() -> void:
	OS.window_fullscreen = true
	Gameloop.startTitleMode()



# ----- TILEMAP TEST ------------------------------------------------------------- ##


func runTilemapTest() -> void:
	OS.window_fullscreen = true
	generateQUickStartChar()
	SokraTiles.loadChunk(ENUM.FILE_PATHS.EXPERIMENTAL_TILEMAP)
	SokraTiles.hasPlayerRested = true
	get_tree().change_scene(ENUM.FILE_PATHS.SCENES.PANIC)



# ----- START IN RESTMODE -------------------------------------------------------- ##


func runRestmode() -> void:
	OS.window_fullscreen = true
	generateQUickStartChar()
	Gameloop.startRestMode()



# ----- CALCULATE ---------------------------------------------------------------- ##


func runStatistics():
	OS.window_fullscreen = true
	Statistics_Markdown_Hub.getStatistics()
	get_tree().quit()


func runDesserialicedAtlas():
	OS.window_fullscreen = true
	Statistics_Markdown_Hub.getStatistics()
	get_tree().quit()


# ----- QUICK START -------------------------------------------------------------- ##


func runQuickStart():
	OS.window_fullscreen = true
	generateQUickStartChar()
	Gameloop.startPanicMode()



# ----- BOOT MENUE --------------------------------------------------------------- ##


func runBootMenue():
	pass




# ----- HELPER --------------------------------------------------------------- ##


func generateQUickStartChar():
	API_003_Player.loadQuickStartChar()



