extends RichTextLabel


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var credits = str(API_003_Player.currentChar.stats().indirects().maxKitSlots())
	bbcode_text = credits
