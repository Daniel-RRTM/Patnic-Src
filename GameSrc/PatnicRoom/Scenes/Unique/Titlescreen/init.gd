
extends Node




var backgroundFilepaths=[
	"res://Assets/GUI/Titlescreen/background/backgroundFour.png",
	"res://Assets/GUI/Titlescreen/background/backgroundThree.png",
	"res://Assets/GUI/Titlescreen/background/backgroundTwopng.png",]


var animate : bool = false
func _ready():
		setRandomBackground()
		isready = true
		setSubtitle()

func _init() :
	isready = false



######################
## -- Background -- ##
######################
func setRandomBackground():
	get_node("Background").texture = Utils.rng().getBackground("title") 



#########################
## -- Textanimation -- ##
#########################
var isready
func _physics_process(delta):
	if isready:
		get_node("gametitle").animateTitleSprite()
		get_node("gametitle/dynamic subtitle").animateTitleSprite()



############################
	## -- Dynamic SubTitle -- ##
############################
func setSubtitle():
	var allSubtitle = Utils.json().fileToDictionary(ENUM.FILE_PATHS.SUB_TITLES)
	
	var rn = Utils.rng().getRandomNumber(0,allSubtitle["inserts"].size()) 
	var subtitleToString = allSubtitle["inserts"][rn-1]
	
	get_node("gametitle/dynamic subtitle").append_bbcode(subtitleToString)


func _input(event):
	if event.is_pressed() and event.is_action("Interface_Generall_Escape"):
		get_tree().change_scene("res://Src/scenes/Unique/Titlescreen/Title.tscn")

















func _on_press(extra_arg_0: int) -> void:
	pass # Replace with function body.
