extends Node2D


onready var gearedKitsetTable = get_node("geared_kitset_table")

var stationEnum


func _ready() -> void:
	initialice()
	loadPlayerGearedKitsets()
	restrictKitselection()



func initialice():
	Gameloop.scene = self
	API_009_Sound.buildSceneReference()
	stationEnum = Davinci.externalCachedInput
	
	get_node("background").texture = Utils.rng().getRngBackground()
	
	API_003_Player.getStations().changeStation(stationEnum)
	
	var symbols = Rest_Form_Getter.getFormMeta()[stationEnum]["symbols"]
	get_node("Title").initialice(symbols)



func loadPlayerGearedKitsets():
	var cache      = API_003_Player.currentChar.kitventory().kitsets().getAll()
	var maxKitsets = API_003_Player.currentChar.getCompValue("C_25_MAX_KITSETS")
	gearedKitsetTable.get_node("Kitsets").reset()
	gearedKitsetTable.get_node("Kitsets").loadKitsets(cache,maxKitsets)



func restrictKitselection():
	var kitsetTableNode = gearedKitsetTable.get_node("Kitsets/VBoxContainer")
	var catsOfStation = ENUM.KITS.CATEGORIES.values()[stationEnum].keys()
	
	for row in kitsetTableNode.get_children():
		var currentCat = row.get_node("category/RichTextLabel").bbcode_text
		if !catsOfStation.has(currentCat): row.get_node("block").visible = true

