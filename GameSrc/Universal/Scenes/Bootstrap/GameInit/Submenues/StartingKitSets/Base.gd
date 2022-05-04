extends OptionButton


var loadedKitPartEntites = []


func _ready() -> void:
	self.theme = Theme.new()
	self.theme.default_font = DynamicFont.new()
	self.theme.default_font.font_data = load("res://Assets/DynamicFonts/FixedSysTemplate.ttf")



func reset():
	clear()
	add_item("")


func addEscape():
	add_item("")
	add_item(" < BACK TO CATEGORY >")
