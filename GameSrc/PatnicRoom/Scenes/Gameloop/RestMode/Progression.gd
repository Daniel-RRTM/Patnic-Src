extends Node2D

var background 
var inputmode
var station

var kitSelection 
var stationManager



func _init() :
	Gameloop.scene = self
	API_009_Sound.buildSceneReference()
	API_009_Sound.playEnterPanicRoom()
	Davinci.initialiceRestScene(self)
	API_003_Player.saveChar()
	API_011_ProcGen_Loot.generateLoot()
	SokraTiles.setHasPlayerRested(true)
	API_003_Player.resetChunkStats()


func _input(event: InputEvent) -> void: Davinci.manageInput(event)


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_node("background").texture = Utils.rng().getBackground("rest")
	API_014_NewsLog.metaEntry("Entring Rest-mode! Stay resilient!")
	checkQuests()
	writeSummary()

func changeSwitchPanel(filepathOfScene:String) -> void:
	get_node("SwitchPanel").get_child(0).free()
	var node = load(filepathOfScene)
	get_node("SwitchPanel").add_child(node.instance())




func checkQuests():
	for i in API_003_Player.getAllQuests().size():
		var quest = API_003_Player.getAllQuests()[i]
		var isFinished = true
		for listen in quest.listener: if !listen.validateQuest(): isFinished
		if isFinished:
			API_015_Quest.emitSignal("Player_Completed_Quest",{"keyword":"quest"+str(1),"factor":true})
			API_003_Player.getQuestCycle().setActive(quest.mType,quest.type,false)
			API_003_Player.getQuestCycle().setCompletion(quest.mType,quest.type,true)
			for step in quest.quest.getCompValue("C_53_LISTENER")["PERFORM"]: API_005_Event.runKitSet(step)




func writeSummary():
	var dict = API_003_Player.getChunkStats()
	var summary = get_node("SwitchPanel/Overview/Summary")
	summary.get_node("Gear/Valuables/value").bbcode_text = str(dict.valuables)
	summary.get_node("Gear/KitParts/value").bbcode_text = str(dict.kitparts)
	summary.get_node("Objective/Quest1/value").bbcode_text = str(dict.quest1)
	summary.get_node("Objective/Quest2/value").bbcode_text = str(dict.quest2)
	summary.get_node("Objective/Quest3/value").bbcode_text = str(dict.quest3)
	summary.get_node("Objective/Archivement/value").bbcode_text = str(dict.archivement)
	summary.get_node("Stats/Steps/value").bbcode_text = str(dict.steps)
	summary.get_node("Stats/Kits/value").bbcode_text = str(dict.kituses)





