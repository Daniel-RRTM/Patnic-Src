extends TextEdit


func _ready() -> void:
	text = "\n"
	API_014_NewsLog.textEditNode = self
	for key in API_014_NewsLog.getKeywordColoring(): 
		add_keyword_color(key,API_014_NewsLog.getKeywordColoring()[key])
	API_014_NewsLog.reprintAll()
	
