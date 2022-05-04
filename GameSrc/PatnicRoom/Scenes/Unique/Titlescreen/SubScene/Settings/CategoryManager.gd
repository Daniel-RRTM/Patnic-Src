extends Panel


func distribute(optionsOfCategory):
	for option in optionsOfCategory.keys():
		get_node(option).initialice(optionsOfCategory[option])
	
	
