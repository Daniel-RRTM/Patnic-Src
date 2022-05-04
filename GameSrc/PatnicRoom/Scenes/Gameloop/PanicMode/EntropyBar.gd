extends Control

onready var innerPanel = get_node("inner")
onready var outerPanel = get_node("outer")
onready var text = get_node("RichTextLabel")
onready var allSubtitle = Utils.json().fileToDictionary("res:/tools/RuntimeConfigs/Text-inserts/DynamicSubtitle.json")

var progress: int

func _ready() -> void:
	text.bbcode_text = str(API_013_Entropy.getEntropyToString())
	Signals.connect("updateEntropy",self,"updateEntropy")
	
 


func changePanelColor(hexColor:Color,panel:Panel):
	panel.set_modulate(Color(hexColor)) 


func updateEntropy():
	var entropyLevel = API_013_Entropy.getEntropy()
	if entropyLevel != 10:
		API_013_Entropy.incrementEntropy()
	else:
		fullEntropy=true
	
	text.bbcode_text = str(API_013_Entropy.getEntropyToString())
	
	var color = API_013_Entropy.getEntropyProgressColour()
	changePanelColor(Color(color),innerPanel)

var timer = 0
var fullEntropy=false
func _physics_process(delta: float) -> void:
	timer +=1
	if fullEntropy:
		if timer%21==0:
			text.bbcode_text = ENUM.ENTROPY_SCALE[10]
			changePanelColor(Color("#f2dc00"),innerPanel)
			changePanelColor(Color("#ea0000"),outerPanel)
	
		if timer%13 == 0:
			text.bbcode_text = getRandomText()
			changePanelColor(Color("#ffff"),outerPanel)
			changePanelColor(Color("#ea0000"),innerPanel)
	
	
func getRandomText():
	var rn = Utils.rng().getRandomNumber(0,allSubtitle["inserts"].size()) 
	return allSubtitle["inserts"][rn-1]
