extends CheckBox


onready var explanationRTL = get_node("../../../explanation/text")
#func _ready() -> void: Settings.connect("saveSettings", self, "setValue")

var defaultValue
var valueToString


func initialice(option):
	defaultValue = option["default"]
	valueToString = option["explanation"]
	
	pressed = defaultValue


#func setValue(): Settings.settingsDict[name] = pressed




func _on_mouse_hover() -> void:
	explanationRTL.bbcode_text = valueToString 
