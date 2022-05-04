extends RichTextLabel


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var commonName = str(API_003_Player.currentChar.getCompValue("C_45_CHARACTER_NAME"))
	var streetName = str(API_003_Player.currentChar.getCompValue("C_44_STREETNAME"))
	
	
	if streetName == "": 
		bbcode_text = "[color=yellow]"+commonName+"[color=white] the Nameless"
		
	else : 
		bbcode_text = "[color=yellow]"+commonName+"[color=white] the "+streetName
	
	
