extends OptionButton

onready var kitPartBrowserRoot = get_node("../../..")


func _ready() -> void:  
	add_item("")
	for item in range(1,11): add_item(str(item))



func getAttribute()      -> String : return "quality"
func getSelectionText()  -> String : return str(get_item_text(selected))
