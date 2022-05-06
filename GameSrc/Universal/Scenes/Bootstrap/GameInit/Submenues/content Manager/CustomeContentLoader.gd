extends VBoxContainer


var allKnownElements = []
func _ready() -> void:
	var allDomains = [ENUM.ALECANDRIA.PERSONAL_GAME_DATA,ENUM.ALECANDRIA.COMMUNITY_GAME_DATA]
	
	for filepathBase in allDomains:
		var allElements = get_files(filepathBase)
		for element in allElements:
			
			var rowData = setDictOfRowData(filepathBase,element)
			
			var scene = load("res://GameSrc/Universal/Scenes/Bootstrap/GameInit/Submenues/content Manager/RowGameElement.tscn").instance()
			scene.initialice(rowData)
			self.add_child(scene)
			allKnownElements.append(scene)
			





func setDictOfRowData(domain,element):
		var split:PoolStringArray = element.split(" ")
		var type = split[0]
		var cat  = split[1]
		
		split.remove(0)
		split.remove(0)
		split[split.size()-1] = split[split.size()-1].trim_suffix(".json")

		return{
			"TYPE"  : type,
			"CAT"   : cat,
			"NAME"  : split.join(" "),
			"PATH"  : str(domain)+"/"+str(element)
		}


func get_files(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin(true)

	var file = dir.get_next()
	while file != '':
		files += [file]
		file = dir.get_next()

	return files






